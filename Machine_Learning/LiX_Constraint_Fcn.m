% Damp_Types:
% 0 = no (default) damping. This is default of JC model.
% 1 = BJ/rational damping (same as in D3(BJ))
% 2 = Tang Damping (Essentially removes dispersion in JC)
% 3 = MMDRE Damping function (Very weak damping, damps mainly at mid range)
% 4 = PAMoC Damping function (fairly weak damping, damps mainly at mid range)
% 5 = EHFSK Damping function (strong damping)
% 6 = WY damping function (strongest damping)

% TF Parameter sets for C6/C8 coefficients
% 0 = default TF Parameters
% 1 = D3 values
% 2 = Best literature values available
% 3 = D4 with C6 and C8 generated on the fly

% GAdjust are N x 3 arrays of gaussian parameters
% (i , 1) is the Gaussian height of the ith adjustment (may be negative or
% positive)
% (i , 2) is the center point of the ith Gaussian (should be positive)
% (i , 3) is the standard deviation or width (negative and positive values
% are the same)
% When Model.Parallel_Struct_Min = true, this uses the parallel version of the subroutine Structure_Minimization (Note: each instance of gromacs is single-core in either mode)
%% Inputs
function tf = LiX_Constraint_Fcn(Input_Settings,Params)

if ~isfield(Input_Settings,'MinSkipLoss')
    defSettings = Initialize_LiX_BO_Settings;
    Input_Settings.MinSkipLoss = defSettings.MinSkipLoss;
end

Input_Settings.Table_Length = 10; % nm
Input_Settings.Table_StepSize = 0.01;

% Conversion factors
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

PotSettings = Initialize_MD_Settings;
PotSettings.Salt = Input_Settings.Salt;
[JC_MX,JC_MM,JC_XX] = JC_Potential_Parameters(PotSettings);
[BH_MX,BH_MM,BH_XX] = BH_Potential_Parameters(PotSettings);
[TF_MX,TF_MM,TF_XX] = TF_Potential_Parameters(PotSettings);

% Param will always be a table.
tf = true(size(Params,1),1);

if size(Params,1) > 1
    disp('Searching for initial feasible points...')
    parfor jdx = 1:size(Params,1)
        Param = Params(jdx,:);
        Settings = Input_Settings;
        % Potential Scaling
        if strcmp(Settings.Theory,'TF')

            % Loose form of exp-C6-C8 model
            if Settings.SigmaEpsilon

                % Default model parameters: all length-scale units are nm,
                % energy scale units are kJ/mol

                % Input parameters
                r0_MM = Param.r0_MM; % nm
                r0_XX = Param.r0_XX; % nm

                epsilon_MM = Param.epsilon_MM; % kJ/mol
                epsilon_XX = Param.epsilon_XX; % kJ/mol

                gamma_MX = Param.gamma_MX; % Unitless

                if Settings.Additivity
                    r0_MX = (r0_MM + r0_XX)./2; % nm
                    epsilon_MX = sqrt(epsilon_MM.*epsilon_XX); % kJ/mol
                    gamma_MM = gamma_MX; % Unitless
                    gamma_XX = gamma_MX; % Unitless
                else
                    r0_MX = Param.r0_MX; % nm
                    epsilon_MX = Param.epsilon_MX; % kJ/mol
                    gamma_MM = Param.gamma_MM; % Unitless
                    gamma_XX = Param.gamma_XX; % Unitless
                end

                % Convert to Condensed form
                alpha_MM = gamma_MM./r0_MM;
                alpha_XX = gamma_XX./r0_XX;
                alpha_MX = gamma_MX./r0_MX;

                B_MM = 48.*epsilon_MM.*exp(gamma_MM)./(48 - 7*gamma_MM);
                B_XX = 48.*epsilon_XX.*exp(gamma_XX)./(48 - 7*gamma_XX);
                B_MX = 48.*epsilon_MX.*exp(gamma_MX)./(48 - 7*gamma_MX);

                C_MM = 4.*epsilon_MM.*gamma_MM.*(r0_MM^6)./(48 - 7.*gamma_MM);
                C_XX = 4.*epsilon_XX.*gamma_XX.*(r0_XX^6)./(48 - 7.*gamma_XX);
                C_MX = 4.*epsilon_MX.*gamma_MX.*(r0_MX^6)./(48 - 7.*gamma_MX);

                D_MM = 3.*epsilon_MM.*gamma_MM.*(r0_MM^8)./(48 - 7.*gamma_MM);
                D_XX = 3.*epsilon_XX.*gamma_XX.*(r0_XX^8)./(48 - 7.*gamma_XX);
                D_MX = 3.*epsilon_MX.*gamma_MX.*(r0_MX^8)./(48 - 7.*gamma_MX);

                % Convert to scaling w.r.t. TF
                Settings.S.A.MM = alpha_MM./TF_MM.alpha;
                Settings.S.A.XX = alpha_XX./TF_XX.alpha;
                Settings.S.A.MX = alpha_MX./TF_MX.alpha;

                Settings.S.R.MM = B_MM./TF_MM.B;
                Settings.S.R.XX = B_XX./TF_XX.B;
                Settings.S.R.MX = B_MX./TF_MX.B;

                Settings.S.D6D.MM = C_MM./TF_MM.C;
                Settings.S.D6D.XX = C_XX./TF_XX.C;
                Settings.S.D6D.MX = C_MX./TF_MX.C;

                Settings.S.D8D.MM = D_MM./TF_MM.D;
                Settings.S.D8D.XX = D_XX./TF_XX.D;
                Settings.S.D8D.MX = D_MX./TF_MX.D;

                % Scaling Coulombic Charge
                if Settings.Fix_Charge
                    Settings.S.Q = Settings.Q_value;
                else
                    Settings.S.Q = Param.SQ;
                end

            % Tight form of exp-C6-C8 model
            else

                % 1/R6 Dispersion (TF only)
                Settings.S.D6D.MM = Param.SD6MM;
                Settings.S.D6D.XX = Param.SD6XX;
                Settings.S.D6D.MX = Param.SD6MX;

                % 1/R8 Dispersion (TF only)
                if Settings.Fix_C8
                    % Calculate value of C8 using recursive relations

                    % Calculate Scaled C8 using recursion relation from D3 paper
                    C8_MM = 3.0.*(Settings.S.D6D.MM.*TF_MM.C./c6units).*sqrt_Q.(Settings.Metal).*sqrt_Q.(Settings.Metal).*c8units; % in kJ/mol nm^8
                    C8_XX = 3.0.*(Settings.S.D6D.XX.*TF_XX.C./c6units).*sqrt_Q.(Settings.Halide).*sqrt_Q.(Settings.Halide).*c8units; % in kJ/mol nm^8
                    C8_MX = 3.0.*(Settings.S.D6D.MX.*TF_MX.C./c6units).*sqrt_Q.(Settings.Metal).*sqrt_Q.(Settings.Halide).*c8units; % in kJ/mol nm^8

                    % Update the scaling
                    Settings.S.D8D.MM = C8_MM./TF_MM.D;
                    Settings.S.D8D.XX = C8_XX./TF_XX.D;
                    Settings.S.D8D.MX = C8_MX./TF_MX.D;
                else
                    Settings.S.D8D.MM = Param.SD8MM;
                    Settings.S.D8D.XX = Param.SD8XX;
                    Settings.S.D8D.MX = Param.SD8MX;
                end

                % Alpha (TF exponential steepness repulsive parameter)
                if ~Settings.Fix_Alpha
                    Settings.S.A.MM = Param.SAMM;
                    Settings.S.A.XX = Param.SAXX;
                    Settings.S.A.MX = Param.SAMX;
                end

                % Repulsive wall prefactor
                Settings.S.R.MM = Param.SRMM;
                Settings.S.R.XX = Param.SRXX;
                Settings.S.R.MX = Param.SRMX;

                % Scaling Coulombic Charge
                if Settings.Fix_Charge
                    Settings.S.Q = Settings.Q_value;
                else
                    Settings.S.Q = Param.SQ;
                end
            end

        elseif strcmp(Settings.Theory,'BH')

            % Loose form of exp-C6 model
            if Settings.SigmaEpsilon

                % Input parameters
                r0_MM = Param.r0_MM; % nm
                r0_XX = Param.r0_XX; % nm

                epsilon_MM = Param.epsilon_MM; % kJ/mol
                epsilon_XX = Param.epsilon_XX; % kJ/mol

                gamma_MX = Param.gamma_MX; % Unitless

                if Settings.Additivity
                    r0_MX = (r0_MM + r0_XX)./2; % nm
                    epsilon_MX = sqrt(epsilon_MM.*epsilon_XX); % kJ/mol
                    gamma_MM = gamma_MX; % Unitless
                    gamma_XX = gamma_MX; % Unitless
                else
                    r0_MX = Param.r0_MX; % nm
                    epsilon_MX = Param.epsilon_MX; % kJ/mol
                    gamma_MM = Param.gamma_MM; % Unitless
                    gamma_XX = Param.gamma_XX; % Unitless
                end

                % Convert to Condensed form
                alpha_MM = gamma_MM./r0_MM;
                alpha_XX = gamma_XX./r0_XX;
                alpha_MX = gamma_MX./r0_MX;

                B_MM = 6.*epsilon_MM.*exp(gamma_MM)./(gamma_MM - 6);
                B_XX = 6.*epsilon_XX.*exp(gamma_XX)./(gamma_XX - 6);
                B_MX = 6.*epsilon_MX.*exp(gamma_MX)./(gamma_MX - 6);

                C_MM = epsilon_MM.*gamma_MM.*(r0_MM.^6)./(gamma_MM - 6);
                C_XX = epsilon_XX.*gamma_XX.*(r0_XX.^6)./(gamma_XX - 6);
                C_MX = epsilon_MX.*gamma_MX.*(r0_MX.^6)./(gamma_MX - 6);

                % Convert to scaling w.r.t. default BH
                Settings.S.A.MM = alpha_MM./BH_MM.alpha;
                Settings.S.A.XX = alpha_XX./BH_XX.alpha;
                Settings.S.A.MX = alpha_MX./BH_MX.alpha;

                Settings.S.R.MM = B_MM./BH_MM.B;
                Settings.S.R.XX = B_XX./BH_XX.B;
                Settings.S.R.MX = B_MX./BH_MX.B;

                Settings.S.D.MM = C_MM./BH_MM.C;
                Settings.S.D.XX = C_XX./BH_XX.C;
                Settings.S.D.MX = C_MX./BH_MX.C;

                % Scaling Coulombic Charge
                if Settings.Fix_Charge
                    Settings.S.Q = Settings.Q_value;
                else
                    Settings.S.Q = Param.SQ;
                end

            % Tight form of the exp-C6 model
            else 
                % Dispersion
                Settings.S.D.MM = Param.SDMM;
                Settings.S.D.XX = Param.SDXX;

                % Repulsion
                Settings.S.R.MM = Param.SRMM;
                Settings.S.R.XX = Param.SRXX;

                if Settings.Additivity
                    Settings.S.D.MX = sqrt(Settings.S.D.MM.*Settings.S.D.XX);
                    Settings.S.R.MX = sqrt(Settings.S.R.MM.*Settings.S.R.XX);

                    if Settings.Additional_MM_Disp
                        Settings.S.D.MM = Settings.S.D.MM + Param.SDMM2;
                    end
                else
                    Settings.S.D.MX = Param.SDMX;
                    Settings.S.R.MX = Param.SRMX;
                end
                % Alpha (exponential steepness repulsive parameter)
                if ~Settings.Fix_Alpha
                    Settings.S.A.MM = Param.SAMM;
                    Settings.S.A.XX = Param.SAXX;
                    Settings.S.A.MX = Param.SAMX;
                end

                % Scaling Coulombic Charge
                if Settings.Fix_Charge
                    Settings.S.Q = Settings.Q_value;
                else
                    Settings.S.Q = Param.SQ;
                end
            end

        elseif strcmp(Settings.Theory,'JC') % JC models

            % sigma/epsilon form (cast in terms of sigma/epsilon scaling internally)
            if Settings.SigmaEpsilon

                % Sigma scaling
                Settings.S.S.MM = Param.Sigma_MM./JC_MM.sigma;
                Settings.S.S.XX = Param.Sigma_XX./JC_XX.sigma;

                % Epsilon scaling
                Settings.S.E.MM = Param.Epsilon_MM./JC_MM.epsilon;
                Settings.S.E.XX = Param.Epsilon_XX./JC_XX.epsilon;

                % Default MX params
                def_S_MX = JC_MX.sigma;
                def_E_MX = sMXParams.epsilon;

                if Settings.Additivity
                    Sigma_MX = (Param.Sigma_MM + Param.Sigma_XX)./2;
                    Epsilon_MX = sqrt(Param.Epsilon_MM.*Param.Epsilon_XX);

                    Settings.S.S.MX = Sigma_MX./def_S_MX;
                    Settings.S.E.MX = Epsilon_MX./def_E_MX;

                    if Settings.Additional_MM_Disp
                        Full_MM_Epsilon = Param.Epsilon_MM + Param.Epsilon_MM2;
                        Settings.S.E.MM = Full_MM_Epsilon./JC_MM.epsilon;
                    end
                else
                    Settings.S.S.MX = Param.Sigma_MX./def_S_MX;
                    Settings.S.E.MX = Param.Epsilon_MX./def_E_MX;
                end

            % Scaled dispersion/repulsion form
            else
                % Dispersion
                Settings.S.D.MM = Param.SDMM;
                Settings.S.D.XX = Param.SDXX;

                % Repulsion
                Settings.S.R.MM = Param.SRMM;
                Settings.S.R.XX = Param.SRXX;

                if Settings.Additivity

                    % Unscaled
                    MX_Epsilon = JC_MX.epsilon;
                    MX_Sigma   = JC_MX.sigma;

                    MX_R = 4.*MX_Epsilon.*MX_Sigma.^12;
                    MX_D = 4.*MX_Epsilon.*MX_Sigma.^6;

                    % Scaled
                    MM_Epsilon = JC_MM.epsilon.*(Settings.S.D.MM^2).*(1./Settings.S.R.MM);
                    MM_Sigma = JC_MM.sigma.*(1./(Settings.S.D.MM.^(1/6))).*(Settings.S.R.MM.^(1/6));

                    XX_Epsilon = JC_XX.epsilon.*(Settings.S.D.XX.^2).*(1./Settings.S.R.XX);
                    XX_Sigma = JC_XX.sigma.*(1./(Settings.S.D.XX.^(1/6))).*(Settings.S.R.XX.^(1/6));

                    MX_Epsilon = sqrt(MM_Epsilon.*XX_Epsilon);
                    MX_Sigma   = (MM_Sigma + XX_Sigma)./2;

                    MX_R_scaled = 4.*MX_Epsilon*MX_Sigma.^12;
                    MX_D_scaled = 4.*MX_Epsilon*MX_Sigma.^6;

                    Settings.S.D.MX = MX_D_scaled./MX_D;
                    Settings.S.R.MX = MX_R_scaled./MX_R;

                    if Settings.Additional_MM_Disp
                        Settings.S.D.MM = Settings.S.D.MM + Param.SDMM2;
                    end
                else
                    Settings.S.D.MX = Param.SDMX;
                    Settings.S.R.MX = Param.SRMX;
                end
            end

            % Scaling Coulombic Charge
            if Settings.Fix_Charge
                Settings.S.Q = Settings.Q_value;
            else
                Settings.S.Q = Param.SQ;
            end
        end

        % Perturb the potential with Gaussians
        if ~isempty(Settings.Additional_GAdjust)
            mx = 1;
            mm = 1;
            xx = 1;
            for idx = 1:length(Settings.Additional_GAdjust)
                int = [Settings.Additional_GAdjust{idx} '_' num2str(idx)];
                switch int
                    case ['MM' '_' num2str(idx)]
                        Settings.GAdjust_MM(mm,1) = Param.(['GA_' int]);
                        Settings.GAdjust_MM(mm,2) = Param.(['GB_' int]);
                        Settings.GAdjust_MM(mm,3) = Param.(['GC_' int]);
                        mm = mm+1;
                    case ['XX' '_' num2str(idx)]
                        Settings.GAdjust_XX(xx,1) = Param.(['GA_' int]);
                        Settings.GAdjust_XX(xx,2) = Param.(['GB_' int]);
                        Settings.GAdjust_XX(xx,3) = Param.(['GC_' int]);
                        xx = xx+1;
                    case ['MX' '_' num2str(idx)]
                        Settings.GAdjust_MX(mx,1) = Param.(['GA_' int]);
                        Settings.GAdjust_MX(mx,2) = Param.(['GB_' int]);
                        Settings.GAdjust_MX(mx,3) = Param.(['GC_' int]);
                        mx = mx+1;
                end
            end
        end

        % Additional functions
        if Settings.Additional_Function.MM.N >= 0 && ~isempty(Settings.Additional_Function.MM.Range)
            Settings.S.N.MM.Scale = Param.SNMM;
            Settings.S.N.MM.Value = Settings.Additional_Function.MM.N;
        end
        if Settings.Additional_Function.XX.N >= 0 && ~isempty(Settings.Additional_Function.XX.Range)
            Settings.S.N.XX.Scale = Param.SNXX;
            Settings.S.N.XX.Value = Settings.Additional_Function.XX.N;
        end
        if Settings.Additional_Function.MX.N >= 0 && ~isempty(Settings.Additional_Function.MX.Range)
            Settings.S.N.MX.Scale = Param.SNMX;
            Settings.S.N.MX.Value = Settings.Additional_Function.MX.N;
        end

        % Calculate loss due to infeasible TF / BH models with no well minima (only works reliably in sigma-epsilon form)
        Loss = 0;
        if strcmp(Settings.Theory,'BH')
            [U_MX, U_MM, U_XX] = BH_Potential_Generator(Settings,...
                'Startpoint',0.01,'ReturnAsStructure',true);
        elseif strcmp(Settings.Theory,'TF')
            [U_MX, U_MM, U_XX] = TF_Potential_Generator(Settings,...
                'Startpoint',0.01,'ReturnAsStructure',true);
        elseif strcmp(Settings.Theory,'JC')
            [U_MX, U_MM, U_XX] = JC_Potential_Generator(Settings,...
                'Startpoint',0.01,'ReturnAsStructure',true);
        end

        %% Grab the peaks and valleys of the MX attractive potential
        peaks_idx = islocalmax(U_MX.Total);
        valleys_idx = islocalmin(U_MX.Total);

        maxima_U = U_MX.Total(peaks_idx);
        minima_U = U_MX.Total(valleys_idx);

        if isempty(minima_U) % If no well minimum exists in MX interaction
            Loss = Loss + Settings.BadFcnLossPenalty;
        elseif isempty(maxima_U) % If no peak exists in MX interaction
            % Do nothing, this is normal for JC potential and some BH/TF
            % potentials
        else % Otherwise, a well minimum exists and at least one peak exists
            % ensure peak - well height is greater than specified threshold
            Threshold = Settings.MinExpWallHeight; % kJ/mol
            dU = maxima_U - minima_U;
            Loss = Loss + max(Threshold - dU,0)*Settings.BadFcnLossPenalty/Threshold;
        end
    %     plot(U_MX.r,U_MX.Total)
    %     hold on
    %     scatter(U_MX.r(peaks_idx),U_MX.Total(peaks_idx))
    %     scatter(U_MX.r(valleys_idx),U_MX.Total(valleys_idx))
    %     ylim([-1000 1000])

        %% Grab the peaks and valleys of the MM/XX potentials
        Us = [U_MM,U_XX];
        for udx = 1:2
            U = Us(udx);

            peaks_idx = islocalmax(U.Total);
            valleys_idx = islocalmin(U.Total);

            maxima_U = U.Total(peaks_idx);
            minima_U = U.Total(valleys_idx);

            maxima_r = U.r(peaks_idx);
            minima_r = U.r(valleys_idx);

    %         plot(U.r,U.Total)
    %         hold on
    %         scatter(U.r(peaks_idx),U.Total(peaks_idx))
    %         scatter(U.r(valleys_idx),U.Total(valleys_idx))
    %         ylim([-1000 1000])

            if isempty(maxima_U) % No peak exists
                % Do nothing, this is normal for JC and sometimes BH/TF
            elseif length(maxima_U) > 1 % two peaks are visible + one valley in between them
                % Penalize any model with a non-zero well depth between
                % like-like interactions
                Threshold = Settings.MaxRepWellDepth; % kJ/mol
                dU = maxima_U(2) - minima_U;
                Loss = Loss + max(dU - Threshold,0)*Settings.BadFcnLossPenalty;
            elseif length(maxima_U) == 1 && isempty(minima_U) % One peak, no valley (this is a normal case for TF and BH repulsive potentials)
                % Do nothing
            elseif length(maxima_U) == 1 && length(minima_U) == 1 % One peak visible + one valley in between, and (possibly) one hidden peak to the right
                Threshold = Settings.MaxRepWellDepth; % kJ/mol
                if minima_r < maxima_r
                    dU = maxima_U - minima_U;
                else
                    % Case of hidden peak to the right
                    % Ensure valley depth is not greater than the threshold
                    dU = U.Total(end) - minima_U;
                end
                Loss = Loss + max(dU - Threshold,0)*Settings.BadFcnLossPenalty;
            elseif length(minima_U) == 1 % well minima is available but no peaks are visible, there must be a hidden peak to the right
                Threshold = Settings.MaxRepWellDepth; % kJ/mol
                dU = U.Total(end) - minima_U;
                Loss = Loss + max(dU - Threshold,0)*Settings.BadFcnLossPenalty;
            else
                % This should never be reached...
                warning('Possible issue with the potential!')
            end
        end
        if log1p(Loss) >= Settings.MinSkipLoss
            tf(jdx) = false;
        end
    end
    disp([num2str(sum(tf)) ' feasible points found in initial search.'])
else
    Param = Params;
    Settings = Input_Settings;
    % Potential Scaling
    if strcmp(Settings.Theory,'TF')

        % Loose form of exp-C6-C8 model
        if Settings.SigmaEpsilon

            % Default model parameters: all length-scale units are nm,
            % energy scale units are kJ/mol

            % Input parameters
            r0_MM = Param.r0_MM; % nm
            r0_XX = Param.r0_XX; % nm

            epsilon_MM = Param.epsilon_MM; % kJ/mol
            epsilon_XX = Param.epsilon_XX; % kJ/mol

            gamma_MX = Param.gamma_MX; % Unitless

            if Settings.Additivity
                r0_MX = (r0_MM + r0_XX)./2; % nm
                epsilon_MX = sqrt(epsilon_MM.*epsilon_XX); % kJ/mol
                gamma_MM = gamma_MX; % Unitless
                gamma_XX = gamma_MX; % Unitless
            else
                r0_MX = Param.r0_MX; % nm
                epsilon_MX = Param.epsilon_MX; % kJ/mol
                gamma_MM = Param.gamma_MM; % Unitless
                gamma_XX = Param.gamma_XX; % Unitless
            end

            % Convert to Condensed form
            alpha_MM = gamma_MM./r0_MM;
            alpha_XX = gamma_XX./r0_XX;
            alpha_MX = gamma_MX./r0_MX;

            B_MM = 48.*epsilon_MM.*exp(gamma_MM)./(48 - 7*gamma_MM);
            B_XX = 48.*epsilon_XX.*exp(gamma_XX)./(48 - 7*gamma_XX);
            B_MX = 48.*epsilon_MX.*exp(gamma_MX)./(48 - 7*gamma_MX);

            C_MM = 4.*epsilon_MM.*gamma_MM.*(r0_MM^6)./(48 - 7.*gamma_MM);
            C_XX = 4.*epsilon_XX.*gamma_XX.*(r0_XX^6)./(48 - 7.*gamma_XX);
            C_MX = 4.*epsilon_MX.*gamma_MX.*(r0_MX^6)./(48 - 7.*gamma_MX);

            D_MM = 3.*epsilon_MM.*gamma_MM.*(r0_MM^8)./(48 - 7.*gamma_MM);
            D_XX = 3.*epsilon_XX.*gamma_XX.*(r0_XX^8)./(48 - 7.*gamma_XX);
            D_MX = 3.*epsilon_MX.*gamma_MX.*(r0_MX^8)./(48 - 7.*gamma_MX);

            % Convert to scaling w.r.t. TF
            Settings.S.A.MM = alpha_MM./TF_MM.alpha;
            Settings.S.A.XX = alpha_XX./TF_XX.alpha;
            Settings.S.A.MX = alpha_MX./TF_MX.alpha;

            Settings.S.R.MM = B_MM./TF_MM.B;
            Settings.S.R.XX = B_XX./TF_XX.B;
            Settings.S.R.MX = B_MX./TF_MX.B;

            Settings.S.D6D.MM = C_MM./TF_MM.C;
            Settings.S.D6D.XX = C_XX./TF_XX.C;
            Settings.S.D6D.MX = C_MX./TF_MX.C;

            Settings.S.D8D.MM = D_MM./TF_MM.D;
            Settings.S.D8D.XX = D_XX./TF_XX.D;
            Settings.S.D8D.MX = D_MX./TF_MX.D;

            % Scaling Coulombic Charge
            if Settings.Fix_Charge
                Settings.S.Q = Settings.Q_value;
            else
                Settings.S.Q = Param.SQ;
            end

        % Tight form of exp-C6-C8 model
        else

            % 1/R6 Dispersion (TF only)
            Settings.S.D6D.MM = Param.SD6MM;
            Settings.S.D6D.XX = Param.SD6XX;
            Settings.S.D6D.MX = Param.SD6MX;

            % 1/R8 Dispersion (TF only)
            if Settings.Fix_C8
                % Calculate value of C8 using recursive relations

                % Calculate Scaled C8 using recursion relation from D3 paper
                C8_MM = 3.0.*(Settings.S.D6D.MM.*TF_MM.C./c6units).*sqrt_Q.(Settings.Metal).*sqrt_Q.(Settings.Metal).*c8units; % in kJ/mol nm^8
                C8_XX = 3.0.*(Settings.S.D6D.XX.*TF_XX.C./c6units).*sqrt_Q.(Settings.Halide).*sqrt_Q.(Settings.Halide).*c8units; % in kJ/mol nm^8
                C8_MX = 3.0.*(Settings.S.D6D.MX.*TF_MX.C./c6units).*sqrt_Q.(Settings.Metal).*sqrt_Q.(Settings.Halide).*c8units; % in kJ/mol nm^8

                % Update the scaling
                Settings.S.D8D.MM = C8_MM./TF_MM.D;
                Settings.S.D8D.XX = C8_XX./TF_XX.D;
                Settings.S.D8D.MX = C8_MX./TF_MX.D;
            else
                Settings.S.D8D.MM = Param.SD8MM;
                Settings.S.D8D.XX = Param.SD8XX;
                Settings.S.D8D.MX = Param.SD8MX;
            end

            % Alpha (TF exponential steepness repulsive parameter)
            if ~Settings.Fix_Alpha
                Settings.S.A.MM = Param.SAMM;
                Settings.S.A.XX = Param.SAXX;
                Settings.S.A.MX = Param.SAMX;
            end

            % Repulsive wall prefactor
            Settings.S.R.MM = Param.SRMM;
            Settings.S.R.XX = Param.SRXX;
            Settings.S.R.MX = Param.SRMX;

            % Scaling Coulombic Charge
            if Settings.Fix_Charge
                Settings.S.Q = Settings.Q_value;
            else
                Settings.S.Q = Param.SQ;
            end
        end

    elseif strcmp(Settings.Theory,'BH')

        % Loose form of exp-C6 model
        if Settings.SigmaEpsilon

            % Input parameters
            r0_MM = Param.r0_MM; % nm
            r0_XX = Param.r0_XX; % nm

            epsilon_MM = Param.epsilon_MM; % kJ/mol
            epsilon_XX = Param.epsilon_XX; % kJ/mol

            gamma_MX = Param.gamma_MX; % Unitless

            if Settings.Additivity
                r0_MX = (r0_MM + r0_XX)./2; % nm
                epsilon_MX = sqrt(epsilon_MM.*epsilon_XX); % kJ/mol
                gamma_MM = gamma_MX; % Unitless
                gamma_XX = gamma_MX; % Unitless
            else
                r0_MX = Param.r0_MX; % nm
                epsilon_MX = Param.epsilon_MX; % kJ/mol
                gamma_MM = Param.gamma_MM; % Unitless
                gamma_XX = Param.gamma_XX; % Unitless
            end

            % Convert to Condensed form
            alpha_MM = gamma_MM./r0_MM;
            alpha_XX = gamma_XX./r0_XX;
            alpha_MX = gamma_MX./r0_MX;

            B_MM = 6.*epsilon_MM.*exp(gamma_MM)./(gamma_MM - 6);
            B_XX = 6.*epsilon_XX.*exp(gamma_XX)./(gamma_XX - 6);
            B_MX = 6.*epsilon_MX.*exp(gamma_MX)./(gamma_MX - 6);

            C_MM = epsilon_MM.*gamma_MM.*(r0_MM.^6)./(gamma_MM - 6);
            C_XX = epsilon_XX.*gamma_XX.*(r0_XX.^6)./(gamma_XX - 6);
            C_MX = epsilon_MX.*gamma_MX.*(r0_MX.^6)./(gamma_MX - 6);

            % Convert to scaling w.r.t. default BH
            Settings.S.A.MM = alpha_MM./BH_MM.alpha;
            Settings.S.A.XX = alpha_XX./BH_XX.alpha;
            Settings.S.A.MX = alpha_MX./BH_MX.alpha;

            Settings.S.R.MM = B_MM./BH_MM.B;
            Settings.S.R.XX = B_XX./BH_XX.B;
            Settings.S.R.MX = B_MX./BH_MX.B;

            Settings.S.D.MM = C_MM./BH_MM.C;
            Settings.S.D.XX = C_XX./BH_XX.C;
            Settings.S.D.MX = C_MX./BH_MX.C;

            % Scaling Coulombic Charge
            if Settings.Fix_Charge
                Settings.S.Q = Settings.Q_value;
            else
                Settings.S.Q = Param.SQ;
            end

        % Tight form of the exp-C6 model
        else 
            % Dispersion
            Settings.S.D.MM = Param.SDMM;
            Settings.S.D.XX = Param.SDXX;

            % Repulsion
            Settings.S.R.MM = Param.SRMM;
            Settings.S.R.XX = Param.SRXX;

            if Settings.Additivity
                Settings.S.D.MX = sqrt(Settings.S.D.MM.*Settings.S.D.XX);
                Settings.S.R.MX = sqrt(Settings.S.R.MM.*Settings.S.R.XX);

                if Settings.Additional_MM_Disp
                    Settings.S.D.MM = Settings.S.D.MM + Param.SDMM2;
                end
            else
                Settings.S.D.MX = Param.SDMX;
                Settings.S.R.MX = Param.SRMX;
            end
            % Alpha (exponential steepness repulsive parameter)
            if ~Settings.Fix_Alpha
                Settings.S.A.MM = Param.SAMM;
                Settings.S.A.XX = Param.SAXX;
                Settings.S.A.MX = Param.SAMX;
            end

            % Scaling Coulombic Charge
            if Settings.Fix_Charge
                Settings.S.Q = Settings.Q_value;
            else
                Settings.S.Q = Param.SQ;
            end
        end

    elseif strcmp(Settings.Theory,'JC') % JC models

        % sigma/epsilon form (cast in terms of sigma/epsilon scaling internally)
        if Settings.SigmaEpsilon

            % Sigma scaling
            Settings.S.S.MM = Param.Sigma_MM./JC_MM.sigma;
            Settings.S.S.XX = Param.Sigma_XX./JC_XX.sigma;

            % Epsilon scaling
            Settings.S.E.MM = Param.Epsilon_MM./JC_MM.epsilon;
            Settings.S.E.XX = Param.Epsilon_XX./JC_XX.epsilon;

            % Default MX params
            def_S_MX = JC_MX.sigma;
            def_E_MX = sMXParams.epsilon;

            if Settings.Additivity
                Sigma_MX = (Param.Sigma_MM + Param.Sigma_XX)./2;
                Epsilon_MX = sqrt(Param.Epsilon_MM.*Param.Epsilon_XX);

                Settings.S.S.MX = Sigma_MX./def_S_MX;
                Settings.S.E.MX = Epsilon_MX./def_E_MX;

                if Settings.Additional_MM_Disp
                    Full_MM_Epsilon = Param.Epsilon_MM + Param.Epsilon_MM2;
                    Settings.S.E.MM = Full_MM_Epsilon./JC_MM.epsilon;
                end
            else
                Settings.S.S.MX = Param.Sigma_MX./def_S_MX;
                Settings.S.E.MX = Param.Epsilon_MX./def_E_MX;
            end

        % Scaled dispersion/repulsion form
        else
            % Dispersion
            Settings.S.D.MM = Param.SDMM;
            Settings.S.D.XX = Param.SDXX;

            % Repulsion
            Settings.S.R.MM = Param.SRMM;
            Settings.S.R.XX = Param.SRXX;

            if Settings.Additivity

                % Unscaled
                MX_Epsilon = JC_MX.epsilon;
                MX_Sigma   = JC_MX.sigma;

                MX_R = 4.*MX_Epsilon.*MX_Sigma.^12;
                MX_D = 4.*MX_Epsilon.*MX_Sigma.^6;

                % Scaled
                MM_Epsilon = JC_MM.epsilon.*(Settings.S.D.MM^2).*(1./Settings.S.R.MM);
                MM_Sigma = JC_MM.sigma.*(1./(Settings.S.D.MM.^(1/6))).*(Settings.S.R.MM.^(1/6));

                XX_Epsilon = JC_XX.epsilon.*(Settings.S.D.XX.^2).*(1./Settings.S.R.XX);
                XX_Sigma = JC_XX.sigma.*(1./(Settings.S.D.XX.^(1/6))).*(Settings.S.R.XX.^(1/6));

                MX_Epsilon = sqrt(MM_Epsilon.*XX_Epsilon);
                MX_Sigma   = (MM_Sigma + XX_Sigma)./2;

                MX_R_scaled = 4.*MX_Epsilon*MX_Sigma.^12;
                MX_D_scaled = 4.*MX_Epsilon*MX_Sigma.^6;

                Settings.S.D.MX = MX_D_scaled./MX_D;
                Settings.S.R.MX = MX_R_scaled./MX_R;

                if Settings.Additional_MM_Disp
                    Settings.S.D.MM = Settings.S.D.MM + Param.SDMM2;
                end
            else
                Settings.S.D.MX = Param.SDMX;
                Settings.S.R.MX = Param.SRMX;
            end
        end

        % Scaling Coulombic Charge
        if Settings.Fix_Charge
            Settings.S.Q = Settings.Q_value;
        else
            Settings.S.Q = Param.SQ;
        end
    end

    % Perturb the potential with Gaussians
    if ~isempty(Settings.Additional_GAdjust)
        mx = 1;
        mm = 1;
        xx = 1;
        for idx = 1:length(Settings.Additional_GAdjust)
            int = [Settings.Additional_GAdjust{idx} '_' num2str(idx)];
            switch int
                case ['MM' '_' num2str(idx)]
                    Settings.GAdjust_MM(mm,1) = Param.(['GA_' int]);
                    Settings.GAdjust_MM(mm,2) = Param.(['GB_' int]);
                    Settings.GAdjust_MM(mm,3) = Param.(['GC_' int]);
                    mm = mm+1;
                case ['XX' '_' num2str(idx)]
                    Settings.GAdjust_XX(xx,1) = Param.(['GA_' int]);
                    Settings.GAdjust_XX(xx,2) = Param.(['GB_' int]);
                    Settings.GAdjust_XX(xx,3) = Param.(['GC_' int]);
                    xx = xx+1;
                case ['MX' '_' num2str(idx)]
                    Settings.GAdjust_MX(mx,1) = Param.(['GA_' int]);
                    Settings.GAdjust_MX(mx,2) = Param.(['GB_' int]);
                    Settings.GAdjust_MX(mx,3) = Param.(['GC_' int]);
                    mx = mx+1;
            end
        end
    end

    % Additional functions
    if Settings.Additional_Function.MM.N >= 0 && ~isempty(Settings.Additional_Function.MM.Range)
        Settings.S.N.MM.Scale = Param.SNMM;
        Settings.S.N.MM.Value = Settings.Additional_Function.MM.N;
    end
    if Settings.Additional_Function.XX.N >= 0 && ~isempty(Settings.Additional_Function.XX.Range)
        Settings.S.N.XX.Scale = Param.SNXX;
        Settings.S.N.XX.Value = Settings.Additional_Function.XX.N;
    end
    if Settings.Additional_Function.MX.N >= 0 && ~isempty(Settings.Additional_Function.MX.Range)
        Settings.S.N.MX.Scale = Param.SNMX;
        Settings.S.N.MX.Value = Settings.Additional_Function.MX.N;
    end

    % Calculate loss due to infeasible TF / BH models with no well minima (only works reliably in sigma-epsilon form)
    Loss = 0;
    if strcmp(Settings.Theory,'BH')
        [U_MX, U_MM, U_XX] = BH_Potential_Generator(Settings,...
            'Startpoint',0.01,'ReturnAsStructure',true);
    elseif strcmp(Settings.Theory,'TF')
        [U_MX, U_MM, U_XX] = TF_Potential_Generator(Settings,...
            'Startpoint',0.01,'ReturnAsStructure',true);
    elseif strcmp(Settings.Theory,'JC')
        [U_MX, U_MM, U_XX] = JC_Potential_Generator(Settings,...
            'Startpoint',0.01,'ReturnAsStructure',true);
    end

    %% Grab the peaks and valleys of the MX attractive potential
    peaks_idx = islocalmax(U_MX.Total);
    valleys_idx = islocalmin(U_MX.Total);

    maxima_U = U_MX.Total(peaks_idx);
    minima_U = U_MX.Total(valleys_idx);

    if isempty(minima_U) % If no well minimum exists in MX interaction
        Loss = Loss + Settings.BadFcnLossPenalty;
    elseif isempty(maxima_U) % If no peak exists in MX interaction
        % Do nothing, this is normal for JC potential and some BH/TF
        % potentials
    else % Otherwise, a well minimum exists and at least one peak exists
        % ensure peak - well height is greater than specified threshold
        Threshold = Settings.MinExpWallHeight; % kJ/mol
        dU = maxima_U - minima_U;
        Loss = Loss + max(Threshold - dU,0)*Settings.BadFcnLossPenalty/Threshold;
    end
%     plot(U_MX.r,U_MX.Total)
%     hold on
%     scatter(U_MX.r(peaks_idx),U_MX.Total(peaks_idx))
%     scatter(U_MX.r(valleys_idx),U_MX.Total(valleys_idx))
%     ylim([-1000 1000])

    %% Grab the peaks and valleys of the MM/XX potentials
    Us = [U_MM,U_XX];
    for udx = 1:2
        U = Us(udx);

        peaks_idx = islocalmax(U.Total);
        valleys_idx = islocalmin(U.Total);

        maxima_U = U.Total(peaks_idx);
        minima_U = U.Total(valleys_idx);

        maxima_r = U.r(peaks_idx);
        minima_r = U.r(valleys_idx);

%         plot(U.r,U.Total)
%         hold on
%         scatter(U.r(peaks_idx),U.Total(peaks_idx))
%         scatter(U.r(valleys_idx),U.Total(valleys_idx))
%         ylim([-1000 1000])

        if isempty(maxima_U) % No peak exists
            % Do nothing, this is normal for JC and sometimes BH/TF
        elseif length(maxima_U) > 1 % two peaks are visible + one valley in between them
            % Penalize any model with a non-zero well depth between
            % like-like interactions
            Threshold = Settings.MaxRepWellDepth; % kJ/mol
            dU = maxima_U(2) - minima_U;
            Loss = Loss + max(dU - Threshold,0)*Settings.BadFcnLossPenalty;
        elseif length(maxima_U) == 1 && isempty(minima_U) % One peak, no valley (this is a normal case for TF and BH repulsive potentials)
            % Do nothing
        elseif length(maxima_U) == 1 && length(minima_U) == 1 % One peak visible + one valley in between, and (possibly) one hidden peak to the right
            Threshold = Settings.MaxRepWellDepth; % kJ/mol
            if minima_r < maxima_r
                dU = maxima_U - minima_U;
            else
                % Case of hidden peak to the right
                % Ensure valley depth is not greater than the threshold
                dU = U.Total(end) - minima_U;
            end
            Loss = Loss + max(dU - Threshold,0)*Settings.BadFcnLossPenalty;
        elseif length(minima_U) == 1 % well minima is available but no peaks are visible, there must be a hidden peak to the right
            Threshold = Settings.MaxRepWellDepth; % kJ/mol
            dU = U.Total(end) - minima_U;
            Loss = Loss + max(dU - Threshold,0)*Settings.BadFcnLossPenalty;
        else
            % This should never be reached...
            warning('Possible issue with the potential!')
        end
    end
    if log1p(Loss) >= Settings.MinSkipLoss
        tf(jdx) = false;
    end
end

end