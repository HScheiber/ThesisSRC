function MD_PreEquilibrate(Directory)

Settings = load(fullfile(Directory,'TempJobInfo.mat'));

% Place "Settings" sub-structure into the main input structure
if isfield(Settings,'Settings')
    f = fieldnames(Settings.Settings);
    for i = 1:length(f)
        Settings.(f{i}) = Settings.Settings.(f{i});
    end
    Settings = rmfield(Settings,'Settings');
end
Settings.WorkDir = Directory;

disp('*** Fast Pre-Equilibration Selected ***')

% Set the number of steps
timesteps = Settings.PreEquilibration/Settings.MDP.dt;
Compressibility = 1e-6.*ones(1,length(Settings.Target_P)); % bar^(-1)
if length(Compressibility) > 2
    Compressibility(4:6) = 0;
end
Compressibility = regexprep(num2str(Compressibility),' +',' ');
tau_p = Settings.MDP.dt; % ps
tau_t = Settings.MDP.dt; % ps
    
nstpcouple = max(round(tau_p/(20*Settings.MDP.dt)),1);
nsttcouple = max(round(tau_t/(20*Settings.MDP.dt)),1);

Target_P = regexprep(num2str(Settings.Target_P),' +',' ');

% Ensure fast equilibration with Berendsen barostat + small time constant
MDP_Template = regexprep(Settings.MDP_Template,'(nsteps += *)(.+?)( *);',['$1' num2str(timesteps) '$3;']);
MDP_Template = regexprep(MDP_Template,'(nstenergy += *)(.+?)( *);','$11$3;');
MDP_Template = regexprep(MDP_Template,'(pcoupl += *)(.+?)( *);','$1Berendsen$3;');
MDP_Template = regexprep(MDP_Template,'(pcoupltype += *)(.+?)( *);',['$1' Settings.Isotropy '$3;']);
MDP_Template = regexprep(MDP_Template,'(tau-p += *)(.+?)( *);',['$1 ' num2str(tau_p) '$3;']);
MDP_Template = regexprep(MDP_Template,'(nstpcouple += *)(.+?)( *);',['$1 ' num2str(nstpcouple) '$3;']);
MDP_Template = regexprep(MDP_Template,'(compressibility += *)(.+?)( *);',['$1 ' Compressibility '$3;']);
MDP_Template = regexprep(MDP_Template,'(ref-p += *)(.+?)( *);',['$1 ' Target_P '$3;']);
    
% Pair it with velocity rescale thermostat + small time constant
MDP_Template = regexprep(MDP_Template,'(tcoupl += *)(.+?)( +);','$1v-rescale$3;');
MDP_Template = regexprep(MDP_Template,'(tau-t += *)(.+?)( +);',['$1 ' num2str(tau_t) '$3;']);
MDP_Template = regexprep(MDP_Template,'(nsttcouple += *)(.+?)( +);',['$1 ' num2str(nsttcouple) '$3;']);
MDP_Template = regexprep(MDP_Template,'(annealing += *)(.+?)( +);','$1no$3;');
    
% Save MDP file, topology file can be reused
MDP_Filename = fullfile(Settings.WorkDir,'Equil_System.mdp');
fidMDP = fopen(MDP_Filename,'wt');
fwrite(fidMDP,regexprep(MDP_Template,'\r',''));
fclose(fidMDP);

TPR_File = fullfile(Settings.WorkDir,'Equil_System.tpr');
MDPout_File = fullfile(Settings.WorkDir,'Equil_System_out.mdp');
GrompLog_File = fullfile(Settings.WorkDir,'Equil_System_Grompplog.log');
    
FEquil_Grompp = [Settings.gmx_loc ' grompp -c ' windows2unix(Settings.SuperCellFile) ...
    ' -f ' windows2unix(MDP_Filename) ' -p ' windows2unix(Settings.Topology_File) ...
    ' -o ' windows2unix(TPR_File) ' -po ' windows2unix(MDPout_File) ...
    ' -maxwarn ' num2str(Settings.MaxWarn) Settings.passlog windows2unix(GrompLog_File)];
[state,~] = system(FEquil_Grompp);
    
% Catch errors in grompp
if state ~= 0
    error(['Error running GROMPP. Problem command: ' newline FEquil_Grompp]);
else
    delete(GrompLog_File)
end
    
% Prepare Equilibration mdrun command
Log_File = fullfile(Settings.WorkDir,'Equil_System.log');
Energy_file = fullfile(Settings.WorkDir,'Equil_System.edr');
TRR_File = fullfile(Settings.WorkDir,'Equil_System.trr');
Equilibrated_Geom_File = fullfile(Settings.WorkDir,['Equil_System.' Settings.CoordType]);
    
mdrun_command = [Settings.gmx ' mdrun -s ' windows2unix(TPR_File) ...   
    ' -o ' windows2unix(TRR_File) ' -g ' windows2unix(Log_File) ...
    ' -e ' windows2unix(Energy_file) ' -c ' windows2unix(Equilibrated_Geom_File) ...
    ' -deffnm ' windows2unix(fullfile(Settings.WorkDir,'Equil_System')) ...
    Settings.mdrun_opts];

if Settings.Table_Req
    mdrun_command = [mdrun_command ' -table ' windows2unix(Settings.TableFile_MX)];
end
    
% Run Liquid Equilibration
disp(['Beginning System Pre-Equilibration for ' num2str(Settings.PreEquilibration) ' ps...'] )
mintimer = tic;
[state,mdrun_output] = system(mdrun_command);
if state == 0
    disp(['System Successfully Equilibrated! Epalsed Time: ' datestr(seconds(toc(mintimer)),'HH:MM:SS')]);
    copyfile(Equilibrated_Geom_File,Settings.SuperCellFile)
else
    disp('Equilibration failed. Stopping.')
    disp(mdrun_output);
    error(['Error running mdrun for solid equilibration. Problem command: ' newline mdrun_command]);
end
    
%     En_xvg_file = fullfile(Settings.WorkDir,'Equil_System_Energy.xvg');
%     Data = import_xvg(En_xvg_file);
%     plot(Data(:,1),Data(:,2)./Settings.nmol_liquid) % Potential
%     plot(Data(:,1),Data(:,3)./Settings.nmol_liquid) % Conversved Energy
%     plot(Data(:,1),(10^3).*Data(:,4)./Settings.nmol_liquid) % Volume


% Update MDP file and overwrite
MDP_Template = regexprep(Settings.MDP_Template,'(gen-vel *= *)yes(.+?\n)','$1no $2');
MDP_Template = strtrim(regexprep(MDP_Template,'gen-temp.+?generation',''));
fidMDP = fopen(Settings.MDP_in_File,'wt');
fwrite(fidMDP,regexprep(MDP_Template,'\r',''));
fclose(fidMDP);

% Rerun Grompp
if isfile(Settings.Traj_Conf_File)
    delete(Settings.Traj_Conf_File)
end
GROMPP_command = [Settings.gmx_loc ' grompp -c ' windows2unix(Settings.SuperCellFile) ...
    ' -f ' windows2unix(Settings.MDP_in_File) ' -p ' windows2unix(Settings.Topology_File) ...
    ' -o ' windows2unix(Settings.Traj_Conf_File) ' -po ' windows2unix(Settings.MDP_out_File) ...
    ' -maxwarn ' num2str(Settings.MaxWarn) Settings.passlog windows2unix(Settings.GrompLog_File)];
[errcode,~] = system(GROMPP_command);

% Catch error in grompp
if errcode ~= 0
    error(['Error running GROMPP. Problem command: ' newline GROMPP_command]);
end

disp('*** Pre-Equilibration of System Complete ***')

% Remove backups
if Settings.Delete_Backups
    system([Settings.wsl 'find ' windows2unix(Settings.WorkDir) ...
        ' -iname "#*#" -delete']);
end

end