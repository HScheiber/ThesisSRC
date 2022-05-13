Settings = Initialize_MD_Settings;

Salts = {'LiF' 'LiCl' 'LiBr' 'LiI' ...
         'NaF' 'NaCl' 'NaBr' 'NaI' ...
         'KF' 'KCl' 'KBr' 'KI' ...
         'RbF' 'RbCl' 'RbBr' 'RbI' ...
         'CsF' 'CsCl' 'CsBr' 'CsI'};
Theories = {'JC' 'JC3P' 'JC4P' 'TF'};
Structures = {'Rocksalt' 'Wurtzite' 'NiAs' 'Sphalerite' 'FiveFive' 'AntiNiAs' 'BetaBeO' 'CsCl'};


Settings.MinMDP.Energy_Tol = 1e-3; % kJ/mol
Settings.MinMDP.Gradient_Tol_RMS = 1e-3; % kJ/(mol A)
Settings.MinMDP.Gradient_Tol_Max = 1e-3; % kJ/(mol A)
Settings.Cutoff_Buffer = 1.02;
Settings.MinMDP.RList_Cutoff = 2;
Settings.MinMDP.RCoulomb_Cutoff = 2;
Settings.MinMDP.RVDW_Cutoff = 2;

Settings.MinMDP.Parallel_Min = false;
[~,Settings.gmx,Settings.gmx_loc,Settings.mdrun_opts,~] = MD_Batch_Template(Settings.JobSettings);
setenv('OMP_NUM_THREADS','1');
setenv('GMX_PME_NUM_THREADS','1');
setenv('GMX_PME_NTHREADS','1');
setenv('GMX_OPENMP_MAX_THREADS','1');
setenv('KMP_AFFINITY','disabled');
Settings.mdrun_opts = ' -pin on -ntmpi 1 -ntomp 1';
Settings.gmx = Settings.gmx_loc;


% Set up matlab parallel features
N = length(Theories)*length(Salts)*length(Structures)+length(Structures);
n = length(Theories)*length(Salts)*length(Structures);
Parcores = feature('numcores');
PrefCores = min(Parcores,N);
if ~isempty(gcp('nocreate'))
    Cur_Pool = gcp;
    Cur_Workers = Cur_Pool.NumWorkers;

    % Start the parallel pool
    if Cur_Workers ~= PrefCores
        delete(Cur_Pool);
        % Create a "local" cluster object
        local_cluster = parcluster('local');

        % Modify the JobStorageLocation to a temporary directory
        tmp = tempname;
        if ~isfolder(tmp)
            mkdir(tmp)
        end
        local_cluster.JobStorageLocation = tmp;

        ppool = parpool(local_cluster,min(Parcores,N));
    else
        ppool = Cur_Pool;
    end
else
    ppool = parpool(min(Parcores,N)); 
end

f(1:N) = parallel.FevalFuture;

% Run in parallel with parfavel
indexes = combvec(1:length(Salts),1:length(Theories),1:length(Structures));
for idx = 1:N
    if idx > n
        Settings.Salt = 'NaCl';
        Settings.Theory = 'JCSD';
        Settings.Structure = Structures{idx-n};
    else
        Settings.Salt = Salts{indexes(1,idx)};
        Settings.Theory = Theories{indexes(2,idx)};
        Settings.Structure = Structures{indexes(3,idx)};
    end
    if strcmp(Settings.Structure,'FiveFive')
        Find_Min_Params = false;
    else
        Find_Min_Params = true;
    end
    
    f(idx) = parfeval(ppool,@Structure_Minimization,1,Settings,'Extra_Properties',true,...
        'Find_Min_Params',Find_Min_Params);
end

wait(f); % Wait for parallel jobs to finish

% Collect outputs into cell array
Data = struct();
for idx = 1:N
    if idx > n
        Salt = 'NaCl';
        Theory = 'JCSD';
        Structure = Structures{idx-n};
    else
        Salt = Salts{indexes(1,idx)};
        Theory = Theories{indexes(2,idx)};
        Structure = Structures{indexes(3,idx)};
    end
    if strcmp(f(idx).State,'finished')
        Data.(Salt).(Theory).(Structure) = f(idx).fetchOutputs;
    else
        Data.(Salt).(Theory).(Structure).E = nan;
    end
end

save(fullfile(Settings.home,'data','MX_JCTF_Min_Data.mat'),'Data')
