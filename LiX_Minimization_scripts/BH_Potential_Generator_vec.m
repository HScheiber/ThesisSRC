function U = BH_Potential_Generator_vec(Settings)

%% Load BH Parameters
dat = load(fullfile(Settings.home,'data','BH_Default_Param.mat'));
Param = dat.Param;
b = dat.b;
rho = dat.rho;
sigma = dat.sigma;
valence = dat.valence;
QQ_prefactor = dat.QQ_prefactor;

%% Parameter: q (charge)
q.(Settings.Metal) =  Settings.S.Q; % atomic
q.(Settings.Halide)= -Settings.S.Q; % atomic

%% Calculate Pauling Coefficients beta: MX = +-   MM = ++     XX = --
beta.MM = 1 + 2/valence.(Settings.Metal); % Unitless
beta.XX = 1 - 2/valence.(Settings.Halide); % Unitless
beta.MX = 1 + 1/valence.(Settings.Metal) - 1/valence.(Settings.Halide); % Unitless

%% Calculate Repulsive Exponential Parameter alpha: MX = +-   MM = ++     XX = --
alpha.MM = Settings.S.A.All.*Settings.S.A.MM./rho.(Settings.Salt); % nm^-1
alpha.MX = Settings.S.A.All.*Settings.S.A.MX./rho.(Settings.Salt); % nm^-1
alpha.XX = Settings.S.A.All.*Settings.S.A.XX./rho.(Settings.Salt); % nm^-1

%% Calculate Repulsive Scaling Parameter B: MX = +-   MM = ++     XX = -- (Including scaling)
B.MM = Settings.S.R.All.*Settings.S.R.MM.*beta.MM.*b.*exp(2.*sigma.(Settings.Metal)./rho.(Settings.Salt));
B.XX = Settings.S.R.All.*Settings.S.R.XX.*beta.XX.*b.*exp(2.*sigma.(Settings.Halide)./rho.(Settings.Salt));
B.MX = Settings.S.R.All.*Settings.S.R.MX.*beta.MX.*b.*exp((sigma.(Settings.Metal) + sigma.(Settings.Halide))./rho.(Settings.Salt));

%% Calculate parameters of interest for LJ potential: change parameteters into C6/r6 format and apply mixing rules
CMM_pre = 4*Param.(Settings.Metal).epsilon*(Param.(Settings.Metal).sigma^6);
CXX_pre = 4*Param.(Settings.Halide).epsilon*(Param.(Settings.Halide).sigma^6);
C.MM = Settings.S.D.All.*Settings.S.D.MM.*CMM_pre;
C.XX = Settings.S.D.All.*Settings.S.D.XX.*CXX_pre;
C.MX = Settings.S.D.All.*Settings.S.D.MX.*sqrt(CMM_pre.*CXX_pre);

%% Generate range (r) in nm
U.r = Settings.Table_StepSize:Settings.Table_StepSize:Settings.Table_Length;

%% If Damping at close range, affects all attractive interactions
for interaction = {'MX' 'XX' 'MM'}
    int = interaction{1};
    switch int
        case 'MX'
            Y1 = Settings.Metal;
            Y2 = Settings.Halide;
        case 'MM'
            Y1 = Settings.Metal;
            Y2 = Settings.Metal;
        case 'XX'
            Y1 = Settings.Halide;
            Y2 = Settings.Halide;
    end
    
    % Build PES
    U.(int) = QQ_prefactor.*q.(Y1).*q.(Y2)./U.r + B.(int).*exp(-alpha.(int).*U.r) - C.(int)./(U.r.^6);
end

end