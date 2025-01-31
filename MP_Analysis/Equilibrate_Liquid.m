function Output = Equilibrate_Liquid(Settings)

    %% What this function does:
    % Initialize density based on experiment
    % Create a cubic box with the smallest possible system size for a given cutoff
    % Increase that box size by Settings.Cutoff_Buffer to account for possibility of shrinkage
    % Randomly fill box with appropriate number of atoms to reach experimental density
    % Use Make_Tables function if necessary, run a brief ~1000 step minimization
    % Run NPT simulation for [Settings.MP_Equilibrate_Liquid] amount of time using fast equilibration settings (Berendsen baro and Velocity-Rescale thermo)
    % Calculate average density of equilibrated box based on last 25% of simulation
    % Give new density as output
    
	Output.StructureChange = false;
    Output.SolidMelted = false;
    Output.LiquidFroze = false;
    Output.LiquidAmorphous = false;
    Output.Aborted = false;
    Output.Equil_density = nan;
    
    %% Possibility 1 Implemented
    if Settings.Verbose
        disp('*** Separate Equilibration of Liquid Selected ***')
    end
    
    Inp_Settings = Settings;
    MinDir = Settings.WorkDir;
    Settings.WorkDir = fullfile(Settings.WorkDir,'Equil_Liq');
    if ~isfolder(Settings.WorkDir)
        mkdir(Settings.WorkDir)
    end

    % Grab reference density, cutoff, and corresponding box size
    Settings.Ref_Density = Get_LiX_Liquid_Density(Settings); % molecules/nm^3
    L = (2*Settings.Longest_Cutoff)*Settings.Cutoff_Buffer; % nm, the box dimension
    Volume = L^3;
    nmol_liquid = round(Volume*Settings.Ref_Density);

    % Initialize empty box
    Box.a_vec  = [L 0 0];
    Box.b_vec  = [0 L 0];
    Box.c_vec  = [0 0 L];
    Box.boxcoords = {L L L 0 0 0 0 0 0};
    Box.Volume = Volume;
    Box.Salt = Settings.Salt;
    Box.N = 0;
    Box.N_atoms = 0;
    Box.comment = [Settings.Salt ' liquid cell'];
    Box.res_number = double.empty(0,1);
    Box.res_name = cell.empty(0,1);
    Box.atom_name = cell.empty(0,1);
    Box.atom_number = int32.empty(0,1);
    Box.xyz = double.empty(0,3);
    Box.vel = double.empty(0,3);

    % Save empty box
    Liq_Box_File = fullfile(Settings.WorkDir,['Prep_Liq.' Settings.CoordType]);
    SaveGroFile(Liq_Box_File,Box,true);

    Ref_M = fullfile(Settings.home,'templates','GRO_Templates',[Settings.Metal '_Box.gro']);
    Ref_X = fullfile(Settings.home,'templates','GRO_Templates',[Settings.Halide '_Box.gro']);

    % Add metal
    if Settings.Verbose
        disp(['Randomly adding ' num2str(nmol_liquid) ' ' Settings.Metal ' ions to liquid box...'])
    end
    mtimer = tic;
    Prep_Liq_Metal_Only = fullfile(Settings.WorkDir,['Prep_Liq_Metal_Only.' Settings.CoordType]);
    cmd = [Settings.gmx_loc Settings.insert_molecules ' -f ' windows2unix(Liq_Box_File) ' -ci ' windows2unix(Ref_M) ...
        ' -o ' windows2unix(Prep_Liq_Metal_Only) ' -nmol ' num2str(nmol_liquid) ' -try 200'];
    [errcode,output] = system(cmd);

    if errcode ~= 0
        if Settings.Verbose
            disp(output);
        end
        error(['Error adding ' Settings.Metal ' atoms with insert-molecules. Problem command: ' newline cmd]);
    end
    if Settings.Verbose
        disp([Settings.Metal ' atoms added. Epalsed Time: ' datestr(seconds(toc(mtimer)),'HH:MM:SS')])
    end

    % Add Halide
    Prep_Liq_Random_Liq = fullfile(Settings.WorkDir,['Prep_Liq_Random_Liq.' Settings.CoordType]);
    if Settings.Verbose
        disp(['Randomly adding ' num2str(nmol_liquid) ' ' Settings.Halide ' ions to liquid box...'])
    end
    htimer = tic;
    cmd = [Settings.gmx_loc Settings.insert_molecules ' -ci ' windows2unix(Ref_X) ' -f ' windows2unix(Prep_Liq_Metal_Only) ...
        ' -o ' windows2unix(Prep_Liq_Random_Liq) ' -nmol ' num2str(nmol_liquid) ' -try 400'];

    [errcode,output] = system(cmd);

    if errcode ~= 0
        if Settings.Verbose
            disp(output);
        end
        error(['Error adding ' Settings.Halide ' atoms with insert-molecules. Problem command: ' newline cmd]);
    end
    if Settings.Verbose
        disp([Settings.Halide ' atoms added. Epalsed Time: ' datestr(seconds(toc(htimer)),'HH:MM:SS')])
    end
    
    % Load current randomly-generated liquid file data
    Random_Liquid_data = load_gro_file(Prep_Liq_Random_Liq);

    % Check to make sure all atoms were added
    if Random_Liquid_data.N_atoms ~= nmol_liquid*2
        error('Not all requested liquid atoms were added!')
    end

    %% Minimize the randomly-generated liquid: build MDP file
    MDP = Settings.MDP;
    MDP.Minimization_txt = fileread(fullfile(Settings.home,'templates','Gromacs_Templates',...
    'MDP.template'));

    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##NSTEPS##',pad(num2str(Settings.MinMDP.nsteps_min),18));
    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##INTEGR##',pad(Settings.MinMDP.min_integrator,18));
    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'dt                       = ##TIMEST##; Time step (ps)',...
        ['emtol                    = ' num2str(Settings.MinMDP.emtol)]);
    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##MET##',Settings.Metal);
    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##HAL##',Settings.Halide);
    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##COULOMB##',pad(num2str(MDP.CoulombType),18));
    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##FOURIER##',pad(num2str(MDP.Fourier_Spacing),18));
    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##PMEORDER##',pad(num2str(MDP.PME_Order),18));
    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##EWALDTOL##',pad(num2str(MDP.Ewald_rtol),18));
    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##RLIST##',pad(num2str(MDP.RList_Cutoff),18));
    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##RCOULOMB##',pad(num2str(MDP.RCoulomb_Cutoff),18));
    MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##RVDW##',pad(num2str(MDP.RVDW_Cutoff),18));

    if Settings.Table_Req
        MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##VDWTYPE##',pad('user',18));
        MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##VDWMOD##',pad(MDP.vdw_modifier,18));
        MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##CUTOFF##',pad('group',18));
        MDP.Minimization_txt = regexprep(MDP.Minimization_txt,'ewald-rtol-lj.+?\n','');
        MDP.Minimization_txt = regexprep(MDP.Minimization_txt,'lj-pme-comb-rule.+?\n','');
        MDP.Minimization_txt = regexprep(MDP.Minimization_txt,'verlet-buffer-tolerance.+?\n','');

        % For minimization, add in a close-range repulsive wall to the
        % potential with the following function
        if isfield(Settings,'TableFile_MX')
            TableFile_MX_old = Settings.TableFile_MX;
        else
            TableFile_MX_old = '';
        end
        TableName = [Settings.JobName '_Table'];
        [Settings.TableFile_MX,~,~] = MakeTables(Settings,'TableName',TableName,...
            'Add_Wall',true);
    else
        % Modify the MDP file
        MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##VDWTYPE##',pad(MDP.VDWType,18));
        MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##VDWMOD##',pad(MDP.vdw_modifier,18));
        MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##CUTOFF##',pad(MDP.CutOffScheme,18));
        MDP.Minimization_txt = regexprep(MDP.Minimization_txt,'energygrp-table.+?\n','');
        MDP.Minimization_txt = regexprep(MDP.Minimization_txt,'ewald-rtol-lj.+?\n','');
        MDP.Minimization_txt = regexprep(MDP.Minimization_txt,'lj-pme-comb-rule.+?\n','');

        % Add in Verlet Settings
        if strcmp(MDP.CutOffScheme,'Verlet')
            MDP.Minimization_txt = strrep(MDP.Minimization_txt,'##VerletBT##',pad(num2str(MDP.VerletBT),18));
        else
            MDP.Minimization_txt = regexprep(MDP.Minimization_txt,'verlet-buffer-tolerance.+?\n','');
        end
    end

    % Add in dispersion corrections
    if Settings.MDP.Disp_Correction
        MDP.Minimization_txt = [MDP.Minimization_txt newline newline...
            '; Long-range dispersion correction' newline ...
            'DispCorr                 = EnerPres          ; apply long range dispersion corrections for Energy and pressure'];
    end

    % Save MDP file
    MDP_Filename = fullfile(Settings.WorkDir,'Prep_Liq.mdp');
    fidMDP = fopen(MDP_Filename,'wt');
    fwrite(fidMDP,regexprep(MDP.Minimization_txt,'\r',''));
    fclose(fidMDP);

    % Complete a topology file for the liquid box to be minimized
    Atomlist = copy_atom_order(Prep_Liq_Random_Liq);
    Top_Filename = fullfile(Settings.WorkDir,'Prep_Liq.top');
    
    % Update topology text with atom list
    Topology_Text = strrep(Settings.Topology_Text,'##LATOMS##',Atomlist);
    
    % Save topology file
    fidTOP = fopen(Top_Filename,'wt');
    fwrite(fidTOP,regexprep(Topology_Text,'\r',''));
    fclose(fidTOP);

    TPR_File = fullfile(Settings.WorkDir,'Prep_Liq.tpr');
    MDPout_File = fullfile(Settings.WorkDir,'Prep_Liq_out.mdp');
    GrompLog_File = fullfile(Settings.WorkDir,'Prep_Liq_Grompplog.log');

    FMin_Grompp = [Settings.gmx_loc Settings.grompp ' -c ' windows2unix(Prep_Liq_Random_Liq) ...
        ' -f ' windows2unix(MDP_Filename) ' -p ' windows2unix(Top_Filename) ...
        ' -o ' windows2unix(TPR_File) ' -po ' windows2unix(MDPout_File) ...
        ' -maxwarn ' num2str(Settings.MaxWarn) ...
         Settings.passlog windows2unix(GrompLog_File)];
    [state,~] = system(FMin_Grompp);
    % Catch error in grompp
    if state ~= 0
        error(['Error running GROMPP. Problem command: ' newline FMin_Grompp]);
    else
        delete(GrompLog_File)
    end

    % Prepare minimization mdrun command
    Log_File = fullfile(Settings.WorkDir,'Prep_Liq.log');
    Energy_file = fullfile(Settings.WorkDir,'Prep_Liq.edr');
    TRR_File = fullfile(Settings.WorkDir,'Prep_Liq.trr');
    Minimized_Geom_File = fullfile(Settings.WorkDir,['Minimized_Liq.' Settings.CoordType]);

    mdrun_command = [Settings.gmx Settings.mdrun ' -s ' windows2unix(TPR_File) ...
        ' -o ' windows2unix(TRR_File) ' -g ' windows2unix(Log_File) ...
        ' -e ' windows2unix(Energy_file) ' -c ' windows2unix(Minimized_Geom_File) ...
        ' -deffnm ' windows2unix(fullfile(Settings.WorkDir,'Prep_Liq')) ...
        Settings.mdrun_opts];

    if Settings.Table_Req || strcmp(Settings.Theory,'BH')
        mdrun_command = [mdrun_command ' -table ' windows2unix(Settings.TableFile_MX)];
    end
    
    % Liquid Minimization
    if Settings.Verbose
        disp('Begining Liquid Minimization...')
    end
    mintimer = tic;
    [state,mdrun_output] = system(mdrun_command);
    if state == 0
        if Settings.Verbose
            disp(['System Successfully Minimized! Epalsed Time: ' datestr(seconds(toc(mintimer)),'HH:MM:SS')]);
        end
    else
        if Settings.Verbose
            disp(mdrun_output);
        end
        error(['Error running mdrun for liquid system minimization. Problem command: ' newline mdrun_command]);
    end
    
    %% System is now minimized, run a fast equilibration
    if Settings.Table_Req
    	Settings.TableFile_MX = TableFile_MX_old;
    end
    
    % Set the number of steps
    timesteps = Settings.MP_Equilibrate_Liquid/Settings.MDP.dt;
    %Compressibility = Get_Alkali_Halide_Compressibility(Settings.Salt,'Isotropy','isotropic','Molten',true);
    Compressibility = Settings.QECompressibility; % bar^(-1)
    tau_p = Settings.MDP.dt; % ps
    tau_t = Settings.MDP.dt; % ps

    nstpcouple = max(round(tau_p/(20*Settings.MDP.dt)),1);
    nsttcouple = max(round(tau_t/(20*Settings.MDP.dt)),1);

    % Ensure fast equilibration with Berendsen barostat + small time constant
    MDP_Template = regexprep(Settings.MDP_Template,'(nsteps += *)(.+?)( *);',['$1' num2str(timesteps) '$3;']);
    MDP_Template = regexprep(MDP_Template,'(nstenergy += *)(.+?)( *);','$1100$3;');
    MDP_Template = regexprep(MDP_Template,'(pcoupl += *)(.+?)( *);','$1Berendsen$3;');
    MDP_Template = regexprep(MDP_Template,'(pcoupltype += *)(.+?)( *);','$1isotropic$3;');
    MDP_Template = regexprep(MDP_Template,'(tau-p += *)(.+?)( *);',['$1 ' num2str(tau_p) '$3;']);
    MDP_Template = regexprep(MDP_Template,'(nstpcouple += *)(.+?)( *);',['$1 ' num2str(nstpcouple) '$3;']);
    MDP_Template = regexprep(MDP_Template,'(compressibility += *)(.+?)( *);',['$1 ' num2str(Compressibility) '$3;']);
    MDP_Template = regexprep(MDP_Template,'(ref-p += *)(.+?)( *);',['$1 ' num2str(Settings.Target_P(1)) '$3;']);
    MDP_Template = regexprep(MDP_Template,'(nstxout += *)(.+?)( *);',['$1' num2str(round(0.1/Settings.MDP.dt)) '$3;']);
    MDP_Template = regexprep(MDP_Template,'(dt += *)(.+?)( *);',['$1' num2str(Settings.MDP.dt) '$3;']);

    % Pair it with velocity rescale thermostat + small time constant
    MDP_Template = regexprep(MDP_Template,'(tcoupl += *)(.+?)( +);','$1v-rescale$3;');
    MDP_Template = regexprep(MDP_Template,'(tau-t += *)(.+?)( +);',['$1 ' num2str(tau_t) '$3;']);
    MDP_Template = regexprep(MDP_Template,'(nsttcouple += *)(.+?)( +);',['$1 ' num2str(nsttcouple) '$3;']);

    % Save MDP file, topology file can be reused
    MDP_Filename = fullfile(Settings.WorkDir,'Equil_Liq.mdp');
    fidMDP = fopen(MDP_Filename,'wt');
    fwrite(fidMDP,regexprep(MDP_Template,'\r',''));
    fclose(fidMDP);

    TPR_File = fullfile(Settings.WorkDir,'Equil_Liq.tpr');
    MDPout_File = fullfile(Settings.WorkDir,'Equil_Liq_out.mdp');
    GrompLog_File = fullfile(Settings.WorkDir,'Equil_Liq_Grompplog.log');

    FEquil_Grompp = [Settings.gmx_loc Settings.grompp ' -c ' windows2unix(Minimized_Geom_File) ...
        ' -f ' windows2unix(MDP_Filename) ' -p ' windows2unix(Top_Filename) ...
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
    Log_File = fullfile(Settings.WorkDir,'Equil_Liq.log');
    Energy_file = fullfile(Settings.WorkDir,'Equil_Liq.edr');
    TRR_File = fullfile(Settings.WorkDir,'Equil_Liq.trr');
    Equilibrated_Geom_File = fullfile(Settings.WorkDir,['Equil_Liq_out.' Settings.CoordType]);

    mdrun_command = [Settings.gmx Settings.mdrun ' -s ' windows2unix(TPR_File) ...
        ' -o ' windows2unix(TRR_File) ' -g ' windows2unix(Log_File) ...
        ' -e ' windows2unix(Energy_file) ' -c ' windows2unix(Equilibrated_Geom_File) ...
        ' -deffnm ' windows2unix(fullfile(Settings.WorkDir,'Equil_Liq')) ...
        Settings.mdrun_opts];

    if Settings.Table_Req
        mdrun_command = [mdrun_command ' -table ' windows2unix(Settings.TableFile_MX)];
    end

    % Run Liquid Equilibration
    if Settings.Verbose
        disp(['Begining Liquid Equilibration for ' num2str(Settings.MP_Equilibrate_Liquid) ' ps...'] )
    end
    mintimer = tic;
    [state,mdrun_output] = system(mdrun_command);
    if state == 0
        if Settings.Verbose
            disp(['Liquid Successfully Equilibrated! Epalsed Time: ' datestr(seconds(toc(mintimer)),'HH:MM:SS')]);
        end
    else
        try % Clean up
            [~,~] = system([Settings.wsl 'find ' windows2unix(Settings.WorkDir) ' -iname "#*#" ^| xargs rm']);
        catch me
            disp(me.message)
        end

        Settings = Inp_Settings;
%         if ~isfield(Settings,'QECompressibility_init')
%             Settings.QECompressibility_init = Settings.QECompressibility;
%         end
%         
%         if Settings.QECompressibility > 1e-8 % Retry until compressibility is very tight
%             if Settings.Verbose
%                 disp('Equilibration failed. Retrying with stiffer compressibility.')
%             end
%             Settings.QECompressibility = Settings.QECompressibility/2;
%             Output = Equilibrate_Liquid(Settings);
%             return
        if Settings.MDP.dt/2 >= Settings.MinTimeStep
            if Settings.Verbose
                disp('Equilibration failed. Reducing time step.')
            end
            %Settings.QECompressibility = Settings.QECompressibility_init;
            Settings.MDP.dt = Settings.MDP.dt/2;
            Settings.Output_Coords = Settings.Output_Coords*2;
            Output = Equilibrate_Liquid(Settings);
            return
        else
            if Settings.Verbose
                disp('Equilibration failed. Stiffer compressibility did not resolve.')
                disp(mdrun_output);
                disp(['Error running mdrun for equilibration. Problem command: ' newline mdrun_command]);
            end
            Output.Aborted = true;
            TDir = fullfile(strrep(MinDir,[filesep 'Minimization'],''),['T_' num2str(Settings.Target_T,'%.4f')]);
            [~,~] = system([Settings.wsl 'find ' windows2unix(Settings.WorkDir) ' -iname "#*#" ^| xargs rm']);
            copyfile(Settings.WorkDir,TDir)
            try
                if Settings.Delete_Equil
                    rmdir(Settings.WorkDir,'s')
                end
            catch
                disp(['Unable to remove directory: ' Settings.WorkDir])
            end
            return
        end
    end
    
    % Check to ensure system remained liquid
    copyfile(Minimized_Geom_File,fullfile(Settings.WorkDir,['Equil_Liq.' Settings.CoordType]));
    PyOut = py.LiXStructureDetector.Calculate_Liquid_Fraction(Settings.WorkDir, Settings.Salt, ...
        pyargs('SystemName','Equil_Liq',...
        'RefStructure',Settings.Structure,...
        'CheckFullTrajectory',false,...
        'FileType',Settings.CoordType,...
        'ML_TimeLength',0,...
        'ML_TimeStep',0,...
        'SaveTrajectory',false,...
        'SavePredictionsImage',false));
    Sol_Fraction = PyOut{4};
    Liq_Fraction = PyOut{5};
    
    if Liq_Fraction < (1 - Settings.MeltFreezeThreshold)
        if Settings.Verbose
            disp('Detected Liquid Phase change.')
        end
        if Sol_Fraction > 0.5*Settings.MeltFreezeThreshold
            Output.LiquidFroze = true;
        else
            Output.StructureChange = true;
        end
        Output.Aborted = true;
        TDir = fullfile(strrep(MinDir,[filesep 'Minimization'],''),['T_' num2str(Settings.Target_T,'%.4f')]);
        [~,~] = system([Settings.wsl 'find ' windows2unix(Settings.WorkDir) ' -iname "#*#" ^| xargs rm']);
        copyfile(Settings.WorkDir,TDir)
        return
    end
    
    %% Optional: Check if liquid is properly mobile (i.e. not amorphous solid)
    if Settings.CheckAmorphousLiquid
        
        MSD_File = fullfile(Settings.WorkDir,'Equil_Liq_MSD.xvg');
        MSD_Log_File = fullfile(Settings.WorkDir,'Equil_Liq_MSD.log');
        msd_command = [Settings.wsl 'echo 0 ' Settings.pipe ' '  strrep(Settings.gmx_loc,Settings.wsl,'') ...
            Settings.g_msd ' -f ' windows2unix(TRR_File) ' -s ' windows2unix(TPR_File) ...
            ' -o ' windows2unix(MSD_File) ' -b ' num2str(Settings.MP_Equilibrate_Liquid/2) ...
            ' -e ' num2str(Settings.MP_Equilibrate_Liquid) ' -trestart 1 -beginfit 1 -endfit ' ...
            num2str(0.75*Settings.MP_Equilibrate_Liquid/2) Settings.passlog windows2unix(MSD_Log_File)];
        [~,~] = system(msd_command);
        outp = fileread(MSD_Log_File);
        Diff_txt = regexp(outp,'D\[ *System] *([0-9]|\.|e|-)+ *(\(.+?\)) *([0-9]|\.|e|-)+','tokens','once');
        Diff_const = str2double(Diff_txt{1})*str2double(Diff_txt{3}); % cm^2 / s
        
        if Diff_const <= Settings.AmorphousDiffThreshold
            if Settings.Verbose
                disp('Detected liquid has hardened to amorphous solid.')
            end
            Output.LiquidAmorphous = true;
            Output.Aborted = true;
            TDir = fullfile(strrep(MinDir,[filesep 'Minimization'],''),['T_' num2str(Settings.Target_T,'%.4f')]);
            [~,~] = system([Settings.wsl 'find ' windows2unix(Settings.WorkDir) ' -iname "#*#" ^| xargs rm']);
            copyfile(Settings.WorkDir,TDir);
            try
                if Settings.Delete_Equil
                    rmdir(Settings.WorkDir,'s')
                end
            catch
                if Settings.Verbose
                    disp(['Unable to remove directory: ' Settings.WorkDir])
                end
            end
            return
        end
    end
    
    En_xvg_file = fullfile(Settings.WorkDir,'Equil_Liq_Energy.xvg');

    % Check energy options
    gmx_command = [Settings.wsl 'echo "0" ' Settings.pipe ...
        ' ' strrep(Settings.gmx_loc,Settings.wsl,'') Settings.g_energy ...
        ' -f ' windows2unix(Energy_file) ' -s ' windows2unix(TPR_File)];
    [~,outpt] = system(gmx_command);

    en_opts = regexp(outpt,'End your selection with an empty line or a zero.\n-+(.+?)\n\n','tokens','once');
    en_opts = en_opts{1};
    En_set = [En_set ' ' char(regexp(en_opts,'([0-9]{1,2})  Volume','tokens','once'))];
    En_set = [En_set ' 0'];
    En_set = regexprep(En_set,' +',' ');

    % Grab data from results
    startpoint = Settings.MP_Equilibrate_Liquid*0.5; % ps
    gmx_command = [Settings.wsl 'echo ' En_set ' ' Settings.pipe ...
        ' ' strrep(Settings.gmx_loc,Settings.wsl,'') Settings.g_energy ...
        ' -f ' windows2unix(Energy_file) ' -o ' windows2unix(En_xvg_file) ...
        ' -s ' windows2unix(TPR_File) ' -b ' num2str(startpoint) ...
        ' -e ' num2str(Settings.MP_Equilibrate_Liquid)];
    [err,~] = system(gmx_command);
    if err ~= 0
        warndlg('Failed to collect data.')
        return
    end

    Data = import_xvg(En_xvg_file); % Gather X,Y,Z lengths
    delete(En_xvg_file) % remove temp output file

    Equil_Volume = mean(Data(:,2)); % nm^3

    % plot(Data(:,1),(10^3).*Data(:,2)./nmol_liquid)
    % V = mean((10^3).*Data(timesteps/2:end,2)./nmol_liquid) % A^3/molecule
    % stdevV = std((10^3).*Data(timesteps/2:end,2)./nmol_liquid) % A^3/molecule

    Output.Equil_density = nmol_liquid/Equil_Volume;

    try
        if Settings.Delete_Equil
            rmdir(Settings.WorkDir,'s')
        end
    catch
        if Settings.Verbose
            disp(['Unable to remove directory: ' Settings.WorkDir])
        end
    end
    
    if Settings.Verbose
        disp('*** Separate Equilibration of Liquid Complete ***')
    end

end