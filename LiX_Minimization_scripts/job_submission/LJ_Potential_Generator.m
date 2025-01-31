% Lennard-Jones model
% Generates pair potential energy surfaces from 'Startpoint' up to a given
% length input 'Endpoint'. Plotswitch is a logical true or false to
% determine whether to plot the resulting potentials
% Recommended spacing is 0.005 angstroms or 0.0005 nm
% INPUT UNITS MUST BE ALL IN NANOMETERS. OUTPUTS ARE IN NANOMETER AND
% kJ/mol


% CRDamping = Close Range Damping
function [U,C6_out] = LJ_Potential_Generator(Settings,varargin)

% Optional inputs
p = inputParser;
p.FunctionName = 'LJ_Potential_Generator';
addOptional(p,'PlotType','full')
addOptional(p,'Startpoint',0);
addOptional(p,'Plotswitch',false);
addOptional(p,'MDP_Minimize',false);
addOptional(p,'TightForm',false);
addOptional(p,'Include_Dispersion_Scale',true);
parse(p,varargin{:});
PlotType = p.Results.PlotType;
Startpoint = p.Results.Startpoint;
Plotswitch = p.Results.Plotswitch;
TightForm = p.Results.TightForm;
Incl_Disp = p.Results.Include_Dispersion_Scale;
% Allowed plot types: 'full', 'lj', 'full-derivative', 'lj-derivative',
% 'dispersion', 'dispersion-derivative', 'repulsive',
% 'repulsive-derivative'

if isfield(Settings,'SigmaEpsilon')
    TightForm = ~Settings.SigmaEpsilon;
end

if p.Results.MDP_Minimize
    MDP = 'MinMDP';
else
    MDP = 'MDP';
end

%% Gaussian adjustments
G_a.MM = Settings.GAdjust_MM(:,1);
G_b.MM = Settings.GAdjust_MM(:,2);
G_c.MM = Settings.GAdjust_MM(:,3);

G_a.XX = Settings.GAdjust_XX(:,1);
G_b.XX = Settings.GAdjust_XX(:,2);
G_c.XX = Settings.GAdjust_XX(:,3);

G_a.MX = Settings.GAdjust_MX(:,1);
G_b.MX = Settings.GAdjust_MX(:,2);
G_c.MX = Settings.GAdjust_MX(:,3);

%% Conversion factors and fundamental constants
nm_per_m = 1e+9; % nm per m
NA = 6.0221409e23; % Molecules per mole
e_c = 1.60217662e-19; % Elementary charge in Coulombs
epsilon_0 = (8.854187817620e-12)*1000/(nm_per_m*NA); % Vacuum Permittivity C^2 mol kJ^-1 nm^-1
k_0 = 1/(4*pi*epsilon_0); % Coulomb constant in kJ nm C^-2 mol^-1

[Metal,Halide] = Separate_Metal_Halide(Settings.Salt);

%% Parameter: q (charge)
q.M =  Settings.S.Q; % atomic
q.X  = -Settings.S.Q; % atomic

if TightForm % Input as tight form: A, C parameters
    A.MX = Settings.S.R.All*Settings.S.R.MX; % kj/mol
    A.MM = Settings.S.R.All*Settings.S.R.MM;
    A.XX = Settings.S.R.All*Settings.S.R.XX;
    
    C.MX = Settings.S.D6D.All*Settings.S.D6D.MX*Settings.S.D.All*Settings.S.D.MX; % kJ/mol nm^(-6)
    C.MM = Settings.S.D6D.All*Settings.S.D6D.MM*Settings.S.D.All*Settings.S.D.MM;
    C.XX = Settings.S.D6D.All*Settings.S.D6D.XX*Settings.S.D.All*Settings.S.D.XX;
else
    %% Parameters of interest for vdW potential
    sigma.MX = Settings.S.S.MX; % (also called R0) nm
    sigma.MM = Settings.S.S.MM;
    sigma.XX = Settings.S.S.XX;
    
    epsilon.MX = Settings.S.E.MX; % kJ/mol
    epsilon.MM = Settings.S.E.MM;
    epsilon.XX = Settings.S.E.XX;

    % Convert parameteters into A/r12 - C/r6 format
    A.MM = 4*epsilon.MM*(sigma.MM^12);
    A.XX = 4*epsilon.XX*(sigma.XX^12);
    A.MX = 4*epsilon.MX*(sigma.MX^12);
    
    C.MM = 4*epsilon.MM*(sigma.MM^6);
    C.XX = 4*epsilon.XX*(sigma.XX^6);
    C.MX = 4*epsilon.MX*(sigma.MX^6);
end

%% Generate range (r) in nm
U.r = Startpoint:Settings.Table_StepSize:Settings.Table_Length;

%% If Damping at close range, affects all attractive interactions
for interaction = {'MX' 'XX' 'MM'}
    int = interaction{1};
    if Settings.CR_Damp.(int).r_d >= 0 && Settings.CR_Damp.(int).b >= 0
        r_d = Settings.CR_Damp.(int).r_d;
        b  = Settings.CR_Damp.(int).b;
        
        f_r.(int) = 1./(1 + exp(-b.*(U.r - r_d))); % sigmoid damping function
        df_r.(int) = (b.*exp(-b.*(U.r - r_d)))./((1 + exp(-b.*(U.r - r_d))).^2); % sigmoid damping function derivative
        f_cutoff.(int) = 1./(1 + exp(-b.*(Settings.(MDP).RVDW_Cutoff - r_d)));  % value of f at vdw cutoff
    else
        f_r.(int) = 1; % No damping
        df_r.(int) = 0; % Damping derivative is zero
        f_cutoff.(int) = 1; % value of f at vdw cutoff
    end

    switch int
        case 'MX'
            Y1 = Metal;
            Y2 = Halide;
        case 'MM'
            Y1 = Metal;
            Y2 = Metal;
        case 'XX'
            Y1 = Halide;
            Y2 = Halide;
    end
    
    % Apply C6 Damping
    %% No Damping
    if Settings.C6_Damp.(int) == 0
        % No-damping function
        f6.(int) = f_r.(int);

        % Derivative parts of no-damping function   
        df6.(int) = df_r.(int);
        
        % Values at vdw cutoff
        f6_cutoff.(int) = f_cutoff.(int);

    %% BJ-Type Rational Damping
    elseif Settings.C6_Damp.(int) == 1

        % Generate conversion factors
        Bohr_nm = 0.0529177; % a_0 - > Angstrom
        c6conv = 1e-3/2625.4999/((0.052917726)^6); % J/mol nm^6 - > au (from sourcecode)
        J_kJ = 1e-3; % J - > kJ
        Ha_kJmol = 2625.4999; % Ha - > kJ/mol
        c6units = (1/c6conv)*J_kJ; % au - > kJ/mol nm^6
        c8units = (Ha_kJmol)*(Bohr_nm^8); % au - > kJ/mol nm^8

        % Factor used to calculate C8
        sqrt_Q.Li = 5.019869340000000;
        sqrt_Q.Na = 6.585855360000000;
        sqrt_Q.K  = 7.977627530000000;
        sqrt_Q.Rb = 9.554616980000000;
        sqrt_Q.Cs = 11.02204549000000;
        sqrt_Q.F  = 2.388252500000000;
        sqrt_Q.Cl = 3.729323560000000;
        sqrt_Q.Br = 4.590896470000000;
        sqrt_Q.I  = 5.533218150000000;

        % Calculate C8 (needed for cutoff radius)
        C8.(int) = 3.0*(C.(int)/c6units)*sqrt_Q.(Y1)*sqrt_Q.(Y2)*c8units; % in kJ/mol nm^8
        
        % Damping distances (no C8 term so define wrt crystal radii)
        if Settings.C6_Damp.input_rvdw
            R0.(int) = Settings.C6_Damp.rvdw.(Y1) + Settings.C6_Damp.rvdw.(Y2);
        else
            R0.(int) = sqrt(C8.(int)/C.(int)); % in nm
        end

        % Damping functions (unitless)
        f6.(int) = f_r.(int)./( 1 + ( R0.(int) ./ U.r ).^6 );

        % Values of damping function at vdw cutoff
        f6_cutoff.(int) = f_cutoff.(int)/( 1 + ( R0.(int) / Settings.(MDP).RVDW_Cutoff )^6 );

        % Derivative of damping functions
        df6.(int) = f_r.(int).*(6.*(R0.(int).^6).*(U.r.^5)./(((U.r.^6) + (R0.(int).^6)).^2)) + df_r.(int)./( 1 + ( R0.(int) ./ U.r ).^6 );

    %% Tang and Toennies Damping function. Cite:
    % "An improved simple model for the van der Waals potential based on universal damping functions for the dispersion coefficients."
    % K. T. Tang, J. P. Toennies
    % J. Chem. Phys. 1984, 80, 3726-3741.
    elseif Settings.C6_Damp.(int) == 2
        

        % C6 damping functions
        f6sum = 0;
        for k = 0:6
            f6sum = f6sum + ((alpha.(int).*U.r).^k)./factorial(k); 
        end
        f6.(int) = f_r.(int).*(1 - f6sum.*exp(-alpha.(int).*U.r));

        % Calculate C6 damping derivatives
        df6sum = 0;
        for k = 1:6
            df6sum = df6sum + k.*(alpha.(int).^k).*(U.r.^(k-1))./factorial(k);
        end
        df6.(int) = f_r.(int).*((alpha.(int).*exp(-alpha.(int).*U.r)).*f6sum ...
            - (exp(-alpha.(int).*U.r)).*df6sum) + df_r.(int).*(1 - f6sum.*exp(-alpha.(int).*U.r));

        % Values of damping function at vdw cutoff
        f6_cutoff.(int) = f_cutoff.(int)*(1 - sum(((alpha.(int).*Settings.(MDP).RVDW_Cutoff).^(0:6))./factorial(0:6)).*exp(-alpha.(int).*Settings.(MDP).RVDW_Cutoff));

    %% Family of other damping functions related by a single formula, requiring van der waals radii
    elseif Settings.C6_Damp.(int) >= 3 && Settings.C6_Damp.(int) <= 6

        % Define crystal radii source:
        % https://en.wikipedia.org/wiki/Ionic_radius
        R0.Li = 0.09; % nm
        R0.Na = 0.116; % nm
        R0.K  = 0.152; % nm
        R0.Rb = 0.166; % nm
        R0.Cs = 0.181; % nm
        R0.F  = 0.119; % nm
        R0.Cl = 0.167; % nm
        R0.Br = 0.182; % nm
        R0.I  = 0.206; % nm

        %% MMDRE Damping function. Citation:
        % "Transferable ab initio intermolecular potentials. 1. Derivation from methanol dimer and trimer calculations"
        % W.T.M. Mooij, F.B. van Duijneveldt, J.G.C.M. van Duijneveldt-van de Rijdt, B.P. van Eijck
        % J. Phys. Chem. A 1999, 103, 9872-9882.
        if Settings.C6_Damp.(int) == 3
            a = -1;
            b = 7.19;
            m = 3;
            n = 2;

        %% PAMoC Damping function. Citation:
        % "Empirical correction to density functional theory for van der Waals interactions"
        % Q. Wu, W. Yang
        % J. Chem. Phys. 2002, 116, 515-524.
        elseif Settings.C6_Damp.(int) == 4
            a = -1;
            b = 3.54;
            m = 3;
            n = 2;

        %% EHFSK Damping function. Citation:
        % "Hydrogen bonding and stacking interactions of nucleic acid base pairs: A density-functional-theory based treatment"
        % M. Elstner, P. Hobza, T. Frauenheim, S. Suhai, E. Kaxiras
        % J. Chem. Phys. 2001, 114, 5149-5155.
        elseif Settings.C6_Damp.(int) == 5
            a = -1;
            b = 3;
            m = 7;
            n = 4;

        %% WY damping function. Citation:
        % "Empirical correction to density functional theory for van der Waals interactions"
        % Q. Wu, W. Yang
        % J. Chem. Phys. 2002, 116, 515-524.
        elseif Settings.C6_Damp.(int) == 6
            a = exp(23);
            b = 23;
            m = 1;
            n = -1;
        end

        R0.(int) = R0.(Y1) + R0.(Y2);

        % Damping functions
        f6.(int) = f_r.(int).*((1 + a.*exp(-b.*(U.r./R0.(int)).^m) ).^n);

        % Derivative parts of damping functions
        df6.(int) = f_r.(int).*(-(a.*b.*m.*n.*(U.r./R0.(int)).^(m - 1).*exp(-b.*(U.r./R0.(int)).^m).*(a.*exp(-b.*(U.r/R0.(int)).^m) + 1).^(n - 1))./R0.(int)) ...
            + df_r.(int).*((1 + a.*exp(-b.*(U.r./R0.(int)).^m) ).^n);

        % Values at vdw cutoff
        f6_cutoff.(int) = f_cutoff.(int)*((1 + a*exp(-b*(Settings.(MDP).RVDW_Cutoff/R0.(int))^m) )^n);
    end
    
    % Apply Damping for extra functions
    %% No Damping
    if Settings.C6_Damp.N.(int) == 0
        % No-damping function
        fN.(int) = f_r.(int);

        % Derivative parts of no-damping function   
        dfN.(int) = df_r.(int);
        
        % Values at vdw cutoff
        fN_cutoff.(int) = f_cutoff.(int);

    %% BJ-Type Rational Damping
    elseif Settings.C6_Damp.N.(int) == 1

        % Generate conversion factors
        Bohr_nm = 0.0529177; % a_0 - > Angstrom
        c6conv = 1e-3/2625.4999/((0.052917726)^6); % J/mol nm^6 - > au (from sourcecode)
        J_kJ = 1e-3; % J - > kJ
        Ha_kJmol = 2625.4999; % Ha - > kJ/mol
        c6units = (1/c6conv)*J_kJ; % au - > kJ/mol nm^6
        c8units = (Ha_kJmol)*(Bohr_nm^8); % au - > kJ/mol nm^8

        % Factor used to calculate C8
        sqrt_Q.Li = 5.019869340000000;
        sqrt_Q.Na = 6.585855360000000;
        sqrt_Q.K  = 7.977627530000000;
        sqrt_Q.Rb = 9.554616980000000;
        sqrt_Q.Cs = 11.02204549000000;
        sqrt_Q.F  = 2.388252500000000;
        sqrt_Q.Cl = 3.729323560000000;
        sqrt_Q.Br = 4.590896470000000;
        sqrt_Q.I  = 5.533218150000000;

        % Calculate C8 (needed for cutoff radius)
        C8.(int) = 3.0*(C.(int)/c6units)*sqrt_Q.(Y1)*sqrt_Q.(Y2)*c8units; % in kJ/mol nm^8

        % Damping distances (no C8 term so define wrt crystal radii)
        if Settings.C6_Damp.input_rvdw
            R0.(int) = Settings.C6_Damp.rvdw.(Y1) + Settings.C6_Damp.rvdw.(Y2);
        else
            R0.(int) = sqrt(C8.(int)/C.(int)); % in nm
        end

        % Damping functions (unitless)
        NV = Settings.S.N.(int).Value;
        fN.(int) = f_r.(int)./( 1 + ( R0.(int) ./ U.r ).^NV );

        % Values of damping function at vdw cutoff
        fN_cutoff.(int) = f_cutoff.(int)/( 1 + ( R0.(int) / Settings.(MDP).RVDW_Cutoff )^NV );

        % Derivative of damping functions
        dfN.(int) = f_r.(int).*(NV.*(R0.(int).^NV).*(U.r.^(NV-1))./(((U.r.^NV) + (R0.(int).^NV)).^2)) + df_r.(int)./( 1 + ( R0.(int) ./ U.r ).^NV );

    %% Tang and Toennies Damping function. Cite:
    % "An improved simple model for the van der Waals potential based on universal damping functions for the dispersion coefficients."
    % K. T. Tang, J. P. Toennies
    % J. Chem. Phys. 1984, 80, 3726-3741.
    elseif Settings.C6_Damp.N.(int) == 2
        
        % CN damping functions
        NV = Settings.S.N.(int).Value;
        
        fNsum = 0;
        for k = 0:NV
            fNsum = fNsum + ((alpha.(int).*U.r).^k)./factorial(k); 
        end
        fN.(int) = f_r.(int).*(1 - fNsum.*exp(-alpha.(int).*U.r));

        % Calculate C6 damping derivatives
        dfNsum = 0;
        for k = 1:NV
            dfNsum = dfNsum + k.*(alpha.(int).^k).*(U.r.^(k-1))./factorial(k);
        end
        dfN.(int) = f_r.(int).*((alpha.(int).*exp(-alpha.(int).*U.r)).*fNsum ...
            - (exp(-alpha.(int).*U.r)).*dfNsum) + df_r.(int).*(1 - fNsum.*exp(-alpha.(int).*U.r));

        % Values of damping function at vdw cutoff
        fN_cutoff.(int) = f_cutoff.(int)*(1 - sum(((alpha.(int).*Settings.(MDP).RVDW_Cutoff).^(0:NV))./factorial(0:NV)).*exp(-alpha.(int).*Settings.(MDP).RVDW_Cutoff));

    %% Family of other damping functions related by a single formula, requiring van der waals radii
    elseif Settings.C6_Damp.N.(int) >= 3 && Settings.C6_Damp.N.(int) <= 6

        % Define crystal radii source:
        % https://en.wikipedia.org/wiki/Ionic_radius
        R0.Li = 0.09; % nm
        R0.Na = 0.116; % nm
        R0.K  = 0.152; % nm
        R0.Rb = 0.166; % nm
        R0.Cs = 0.181; % nm
        R0.F  = 0.119; % nm
        R0.Cl = 0.167; % nm
        R0.Br = 0.182; % nm
        R0.I  = 0.206; % nm

        %% MMDRE Damping function. Citation:
        % "Transferable ab initio intermolecular potentials. 1. Derivation from methanol dimer and trimer calculations"
        % W.T.M. Mooij, F.B. van Duijneveldt, J.G.C.M. van Duijneveldt-van de Rijdt, B.P. van Eijck
        % J. Phys. Chem. A 1999, 103, 9872-9882.
        if Settings.C6_Damp.N.(int) == 3
            a = -1;
            b = 7.19;
            m = 3;
            n = 2;

        %% PAMoC Damping function. Citation:
        % "Empirical correction to density functional theory for van der Waals interactions"
        % Q. Wu, W. Yang
        % J. Chem. Phys. 2002, 116, 515-524.
        elseif Settings.C6_Damp.N.(int) == 4
            a = -1;
            b = 3.54;
            m = 3;
            n = 2;

        %% EHFSK Damping function. Citation:
        % "Hydrogen bonding and stacking interactions of nucleic acid base pairs: A density-functional-theory based treatment"
        % M. Elstner, P. Hobza, T. Frauenheim, S. Suhai, E. Kaxiras
        % J. Chem. Phys. 2001, 114, 5149-5155.
        elseif Settings.C6_Damp.N.(int) == 5
            a = -1;
            b = 3;
            m = 7;
            n = 4;

        %% WY damping function. Citation:
        % "Empirical correction to density functional theory for van der Waals interactions"
        % Q. Wu, W. Yang
        % J. Chem. Phys. 2002, 116, 515-524.
        elseif Settings.C6_Damp.N.(int) == 6
            a = exp(23);
            b = 23;
            m = 1;
            n = -1;
        end

        R0.(int) = R0.(Y1) + R0.(Y2);

        % Damping functions
        fN.(int) = f_r.(int).*((1 + a.*exp(-b.*(U.r./R0.(int)).^m) ).^n);

        % Derivative parts of damping functions
        dfN.(int) = f_r.(int).*(-(a.*b.*m.*n.*(U.r./R0.(int)).^(m - 1).*exp(-b.*(U.r./R0.(int)).^m).*(a.*exp(-b.*(U.r/R0.(int)).^m) + 1).^(n - 1))./R0.(int)) ...
            + df_r.(int).*((1 + a.*exp(-b.*(U.r./R0.(int)).^m) ).^n);

        % Values at vdw cutoff
        fN_cutoff.(int) = f_cutoff.(int)*((1 + a*exp(-b*(Settings.(MDP).RVDW_Cutoff/R0.(int))^m) )^n);
    end
    
    %% Modify potential with Gaussian Adjustments
    G_r.(int) = zeros(1,length(U.r));
    dG_r.(int) = zeros(1,length(U.r));
    G_r_cutoff.(int) = 0;
    for i = 1:length(G_a.(int))
        G_r.(int) = G_r.(int) + G_a.(int)(i).*exp((-(U.r - G_b.(int)(i)).^2)./(2.*(G_c.(int)(i).^2)));
        G_r_cutoff.(int) = G_r_cutoff.(int) + G_a.(int)(i)*exp((-(Settings.(MDP).RVDW_Cutoff - G_b.(int)(i))^2)/(2*(G_c.(int)(i)^2)));
        dG_r.(int) = dG_r.(int) - (G_a.(int)(i).*(U.r - G_b.(int)(i))).*(exp((-(U.r - G_b.(int)(i)).^2)./(2.*(G_c.(int)(i).^2))))/(G_c.(int)(i).^2);
    end
    
    %% Build PES
    if strcmp(int,'MX')
        % Place a CR damping function for the attractive coulomb potential
        U_Qdamp = - k_0*(e_c^2)*q.(int(1))*q.(int(2))./(U.r) ...
                  + f_r.(int).*k_0*(e_c^2)*q.(int(1))*q.(int(2))./(U.r);

        % Negative Derivative of CR damping function
        dU_Qdamp = - k_0*(e_c^2)*q.(int(1))*q.(int(2))./(U.r.^2) ...
                   + f_r.(int).*k_0*(e_c^2)*q.(int(1))*q.(int(2))./(U.r.^2) ...
                   - df_r.(int).*k_0*(e_c^2)*q.(int(1))*q.(int(2))./(U.r);
       
        U_Qdamp_cutoff = - k_0*(e_c^2)*q.(int(1))*q.(int(2))/(Settings.(MDP).RVDW_Cutoff) ...
                         + f_cutoff.(int)*k_0*(e_c^2)*q.(int(1))*q.(int(2))/(Settings.(MDP).RVDW_Cutoff);
    else
        % No close-range coulomb damping
        U_Qdamp = 0;
        dU_Qdamp = 0;
        U_Qdamp_cutoff = 0;
    end
    
    % Additional functions
    if Settings.S.N.(int).Value > 0
        NV = Settings.S.N.(int).Value; % Exponent
        Sc = Settings.S.N.(int).Scale; % Scaling
        U_add  = - fN.(int).*Sc./(U.r.^NV);
        dU_add = + fN.(int).*Sc.*NV./(U.r.^(NV+1)) ...
                 - dfN.(int).*Sc./(U.r.^NV);
        U_add_cutoff = - fN_cutoff.(int)*Sc/(Settings.(MDP).RVDW_Cutoff^NV);
    else
        U_add = 0;
        dU_add = 0;
        U_add_cutoff = 0;
    end
    
    % C6 values should be in terms on nm and kJ/mol
    if Incl_Disp
        C6 = C.(int);
        C6_out.(int) = 1;
    else
        C6 = 1;
        C6_out.(int) = C.(int);
    end
    
    % Components of potential
    [U.(int).f0,U.(int).df0] = Coulomb_Potential(Settings,U.r,int); % Electrostatics function f(r) and derivative
    U.(int).g = - f6.(int).*C6./(U.r.^6) ...
                + G_r.(int)./C6_out.(int) ...
                + U_add./C6_out.(int); % Dispersion g(r)
    U.(int).h = A.(int)./(U.r.^12) ...
                + U_Qdamp; % Short range repulsion (with possible close-range coulomb damping)
    
    % Negative components of derivative
    U.(int).dg = - f6.(int).*C6.*6./(U.r.^7) ...
                 + df6.(int).*C6./(U.r.^6) ...
                 - dG_r.(int)./C6_out.(int) ...
                 + dU_add./C6_out.(int); % Dispersion -dg(r)/dr
    U.(int).dh = A.(int).*12./(U.r.^13) ...
                 + dU_Qdamp; % Short range repulsion
    
    % Shift the potential to zero at the cutoff
    if contains(Settings.(MDP).vdw_modifier,'potential-shift','IgnoreCase',true)
        EVDW_Cutoff = A.(int)./(Settings.(MDP).RVDW_Cutoff.^12) ...
                      + U_Qdamp_cutoff ...
                      - f6_cutoff.(int).*C.(int)./(Settings.(MDP).RVDW_Cutoff.^6) ...
                      + G_r_cutoff.(int) ...
                      + U_add_cutoff;
        
        % Shift by the dispersion energy at vdw cutoff radius. only affects one
        % energy component, not derivatives (i.e. forces)
        U.(int).g = U.(int).g - EVDW_Cutoff./C6_out.(int);
    end
    
    % remove infinities
    U.(int) = Remove_Infinities(U.(int));
    
    % Print
    U.(int).f  = k_0*(e_c^2)*q.(int(1))*q.(int(2)).*U.(int).f0;
    U.(int).df = k_0*(e_c^2)*q.(int(1))*q.(int(2)).*U.(int).df0;
    U.(int).Total = U.(int).f + C6_out.(int).*U.(int).g + U.(int).h;
    U.(int).dTotal = -(U.(int).df + C6_out.(int).*U.(int).dg + U.(int).dh);
end

%% PLOT if plotswitch chosen
if Plotswitch
    figure;
    % Options
    lw=2;
    fs=25;

    h = cell(1,8);
    hold on
    switch lower(PlotType)
        case 'full'
            h{1} = plot(U.r.*10,k_0*(e_c^2).*q.M*q.X.*U.MX.f + U.MX.g + U.MX.h,'Color','r','LineWidth',lw,'LineStyle','-');
            h{2} = plot(U.r.*10,k_0*(e_c^2).*q.M*q.M.*U.MM.f + U.MM.g + U.MM.h,'Color','b','LineWidth',lw,'Linestyle','-');
            h{3} = plot(U.r.*10,k_0*(e_c^2).*q.X*q.X.*U.XX.f + U.XX.g + U.XX.h,'Color','g','LineWidth',lw,'Linestyle','-');
            yl = [-600 1000];
            ttxt = 'Full Potential';
        case 'full-derivative'
            h{1} = plot(U.r.*10,k_0*(e_c^2).*q.M*q.X.*U.MX.df + U.MX.dg + U.MX.dh,'Color','r','LineWidth',lw,'LineStyle','-');
            h{2} = plot(U.r.*10,k_0*(e_c^2).*q.M*q.M.*U.MM.df + U.MM.dg + U.MM.dh,'Color','b','LineWidth',lw,'Linestyle','-');
            h{3} = plot(U.r.*10,k_0*(e_c^2).*q.X*q.X.*U.XX.df + U.XX.dg + U.XX.dh,'Color','g','LineWidth',lw,'Linestyle','-');
            yl = [-600 1000];
            ttxt = 'Derivative of Full Potential';
        case 'lj'
            h{1} = plot(U.r.*10,U.MX.g + U.MX.h,'Color','r','LineWidth',lw,'LineStyle','-');
            h{2} = plot(U.r.*10,U.MM.g + U.MM.h,'Color','b','LineWidth',lw,'Linestyle','-');
            h{3} = plot(U.r.*10,U.XX.g + U.XX.h,'Color','g','LineWidth',lw,'Linestyle','-');
            yl = [-50 10];
            ttxt = 'Lennard-Jones Potential';
        case 'lj-derivative'
            h{1} = plot(U.r.*10,U.MX.dg + U.MX.dh,'Color','r','LineWidth',lw,'LineStyle','-');
            h{2} = plot(U.r.*10,U.MM.dg + U.MM.dh,'Color','b','LineWidth',lw,'Linestyle','-');
            h{3} = plot(U.r.*10,U.XX.dg + U.XX.dh,'Color','g','LineWidth',lw,'Linestyle','-');
            yl = [-50 10];
            ttxt = 'Derivative of Lennard-Jones Potential';
        case 'dispersion'
            h{1} = plot(U.r.*10,U.MX.g,'Color','r','LineWidth',lw,'LineStyle','-');
            h{2} = plot(U.r.*10,U.MM.g,'Color','b','LineWidth',lw,'Linestyle','-');
            h{3} = plot(U.r.*10,U.XX.g,'Color','g','LineWidth',lw,'Linestyle','-');
            yl = [-50 10];
            ttxt = 'Dispersion Potential';
        case 'dispersion-derivative'
            h{1} = plot(U.r.*10,U.MX.dg,'Color','r','LineWidth',lw,'LineStyle','-');
            h{2} = plot(U.r.*10,U.MM.dg,'Color','b','LineWidth',lw,'Linestyle','-');
            h{3} = plot(U.r.*10,U.XX.dg,'Color','g','LineWidth',lw,'Linestyle','-');
            yl = [-50 10];
            ttxt = 'Derivative of Dispersion Potential';
        case 'repulsive'
            h{1} = plot(U.r.*10,U.MX.h,'Color','r','LineWidth',lw,'LineStyle','-');
            h{2} = plot(U.r.*10,U.MM.h,'Color','b','LineWidth',lw,'Linestyle','-');
            h{3} = plot(U.r.*10,U.XX.h,'Color','g','LineWidth',lw,'Linestyle','-');
            yl = [-50 10];
            ttxt = 'Repulsive Potential';
        case 'repulsive-derivative'
            h{1} = plot(U.r.*10,U.MX.dh,'Color','r','LineWidth',lw,'LineStyle','-');
            h{2} = plot(U.r.*10,U.MM.dh,'Color','b','LineWidth',lw,'Linestyle','-');
            h{3} = plot(U.r.*10,U.XX.dh,'Color','g','LineWidth',lw,'Linestyle','-');
            yl = [-50 10];
            ttxt = 'Derivative of Repulsive Potential';
    end
    
    title(['Plot of ' ttxt ' for ' Settings.Salt ' LJ Model'],...
       'Interpreter','latex','fontsize',fs)

    set(gca,'box','on','TickLabelInterpreter','latex');
    set(gca,'XMinorTick','on','YMinorTick','on','FontSize',fs);
    xlabel('Separation [\AA]','fontsize',fs,'Interpreter','latex');
    ylabel('Potential Energy [kJ mol$^{-1}$]','fontsize',fs,'Interpreter','latex');

    ylim(yl);
    xlim([Startpoint Settings.Table_Length]);

    % Blank line
    hline = refline([0 0]);
    hline.Color = 'k';
    hline.LineWidth = lw-1;
    hline.LineStyle = '--';
    leg1 = legend([h{:}],{[Metal '$^{+}$' ' - ' Halide '$^{-}$'] [Metal '$^{+}$' ' - ' Metal '$^{+}$'] [Halide '$^{-}$' ' - ' Halide '$^{-}$']});
    leg1.Interpreter = 'latex';
end

end