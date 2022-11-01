function [TableFile_Out,C6,Energygrptables] = MakeTablesWithWall(Settings,varargin)

    p = inputParser;
    p.FunctionName = 'MakeTablesWithWall';
    addOptional(p,'MDP_Minimize',false)
    parse(p,varargin{:});
    MDP_Minimize = p.Results.MDP_Minimize; % Gathers components of energy at the end in addition to the total energy.

    [Metal,Halide] = Separate_Metal_Halide(Settings.Salt);
    
    switch Settings.Theory
        case {'JC' 'JC3P' 'JC4P' 'JCSD'}
            switch Settings.Theory
                case 'JC'
                    Settings.WaterModel = 'SPC/E';
                case 'JC3P'
                    Settings.WaterModel = 'TIP3P';
                case 'JC4P'
                    Settings.WaterModel = 'TIP4PEW';
                case 'JCSD'
                    Settings.WaterModel = 'SD';
            end
            
            [U,C6] = JC_Potential_Generator(Settings,...
                'MDP_Minimize',MDP_Minimize,...
                'Include_Dispersion_Scale',false);
        case 'TF'
            [U,C6] = TF_Potential_Generator(Settings,...
                'MDP_Minimize',MDP_Minimize,...
                'Include_Dispersion_Scale',false);
        case 'BH'
            [U,C6] = BH_Potential_Generator(Settings,...
                'MDP_Minimize',MDP_Minimize,...
                'Include_Dispersion_Scale',false);
        case 'BD'
            [U,C6] = BD_Potential_Generator(Settings,...
                'MDP_Minimize',MDP_Minimize,...
                'Include_Dispersion_Scale',false);
        case 'BE'
            [U,C6] = BE_Potential_Generator(Settings,...
                'MDP_Minimize',MDP_Minimize,...
                'Include_Dispersion_Scale',false);
        case 'BF'
            [U,C6] = BF_Potential_Generator(Settings,...
                'MDP_Minimize',MDP_Minimize,...
                'Include_Dispersion_Scale',false);
        case 'Mie'
            [U,C6] = Mie_Potential_Generator(Settings,...
                'MDP_Minimize',MDP_Minimize,...
                'Include_Dispersion_Scale',false);
    end
    
    % Find function minimum
    %% Grab the valleys of the potential
    TableName = [Settings.JobName '_Table'];
    U_zero = zeros(size(U.r));
    ints = {'MX' 'MM' 'XX'};
    if Settings.Polarization
        subints = {'cc' 'sc' 'cs' 'ss'};
    else
        subints = {'cc'};
    end
    Energygrptables = cell(length(ints),length(subints));
    
    % First make blank table
    Uo = [U.r ; U_zero ; U_zero ; U_zero ; U_zero ; U_zero ; U_zero];
    U_out = deblank( sprintf(['%16.12e  %16.12e  %16.12e  %16.12e  %16.12e  %16.12e  %16.12e' newline],Uo(:)) );
    
    % Save table into current directory
    TableFile_Out = fullfile(Settings.WorkDir,[TableName '.xvg']);
    fid = fopen(TableFile_Out,'wt');
    fwrite(fid,regexprep(U_out,'\r',''));
    fclose(fid);
    
    for idx = 1:length(ints)
        int = ints{idx};
        for jdx = 1:length(subints)
            subint = subints{jdx};
            
            % Only check core-core interactions
            if strcmp(subint(1),'c') && strcmp(subint(2),'c')
            
                peaks_idx = [false islocalmax(U.(int).Total(2:end),'MinProminence',1e-8)];
                peak_r = U.r(peaks_idx);
                if numel(peak_r) > 1
                    peak_r = peak_r(1);
                end

                inflex_idx = [false islocalmax(U.(int).dTotal(2:end),'MinProminence',1e-8) | ...
                    islocalmin(U.(int).dTotal(2:end),'MinProminence',1e-8)];
                inflex_r = U.r(inflex_idx);

                if ~isempty(peak_r) && ~isempty(inflex_r) % If peak and inflection points exist
                    inflex_r(inflex_r < peak_r) = [];
                    inflex_r = inflex_r(1);
                    inflex_idx = find(U.r == inflex_r);

        %             %% Visualization
        %             nm_per_m = 1e+9; % nm per m
        %             NA = 6.0221409e23; % Molecules per mole
        %             e_c = 1.60217662e-19; % Elementary charge in Coulombs
        %             epsilon_0 = (8.854187817620e-12)*1000/(nm_per_m*NA); % Vacuum Permittivity C^2 mol kJ^-1 nm^-1
        %             k_0 = 1/(4*pi*epsilon_0); % Coulomb constant in kJ nm C^-2 mol^-1
        % 
        %             if idx == 1
        %                 U.Total = -k_0*(e_c^2).*(Settings.S.Q^2).*U.f0 + U.h + U.g ;
        %             else
        %                 U.Total =  k_0*(e_c^2).*(Settings.S.Q^2).*U.f0 + U.h + U.g ;
        %             end
        %             hold on
        %             plot(U.r(2:end).*10,U.Total(2:end),'-k','Linewidth',4)
        %             scatter(inflex_r.*10,U.Total(inflex_idx),100,'r','Linewidth',4,'MarkerEdgeColor','r')
        %             %%

                    % Generate a steep repulsion beyond the peak
                    below_peak_idx = (U.r <= inflex_r);
                    r = U.r(below_peak_idx); % nm
                    % Generate a steep repulsion beyond the inflection
                    dU_infl = U.(int).dTotal(inflex_idx);
                    D = -dU_infl*(inflex_r^13)/12; % coefficient

                    fwall = D./(r.^12) - D./(inflex_r.^12);
                    dfwall = 12*D./(r.^13); % Wall -derivative

                    % Kill the attractive interaction beyond the peak
                    U_g_at_infl = C6.(int).*U.(int).g(inflex_idx);
                    U.(int).g(below_peak_idx) = zeros(size(r));   %zeros(size(r));
                    U.(int).dg(below_peak_idx) = zeros(size(r));

                    % Remove infinity at 0
                    fwall(1) = fwall(2);
                    dfwall(1) = 0;

                    % Add this repulsion to the repulsive part of the function
                    U_h_at_infl = U.(int).h(inflex_idx);
                    U.(int).h(below_peak_idx) = fwall + U_h_at_infl +  U_g_at_infl;
                    U.(int).dh(below_peak_idx) = dfwall - U.(int).df(below_peak_idx);
                end

        %         %% Testing visualization
        %         if idx == 1
        %             U.Total  = -k_0*(e_c^2).*(Settings.S.Q^2).*U.f0 + U.h + U.g;
        %             U.dTotal = k_0*(e_c^2).*(Settings.S.Q^2).*U.df0 - U.dh - U.dg;
        %         else
        %             U.Total  =  k_0*(e_c^2).*(Settings.S.Q^2).*U.f0 + U.h + U.g;
        %             U.dTotal =  -k_0*(e_c^2).*(Settings.S.Q^2).*U.df0 - U.dh - U.dg;
        %         end
        %         plot(U.r.*10,U.Total,':r','Linewidth',4)
        %         ylim([-1000 4000])
        %         xlim([0 5])
        %         set(gca,'Fontsize',32,'TickLabelInterpreter','latex','XTick',0:1:5)
        %         xlabel(gca,'$r_{ij}$ [\AA]','fontsize',32,'interpreter','latex')
        %         ylabel(gca,'$u_{ij}$ [kJ mol$^{-1}$]','fontsize',32,'interpreter','latex')
        %         set(gca,'box','on')
        %         grid(gca,'on')
        %         grid(gca,'minor')
        %         exportgraphics(gca,'Augmented_Potential.eps')
        %         %%
        
                % Output into gromacs format
                Uo = [U.r ; U.(int).f0 ; U.(int).df0 ; U.(int).g ; U.(int).dg ; U.(int).h ; U.(int).dh];
            else % shell interactions
                % Output into gromacs format
                Uo = [U.r ; U.(int).f0 ; U.(int).df0 ; U_zero ; U_zero ; U_zero ; U_zero];
            end
            
            Energygrptables{idx,jdx} = replace([int(1) '_' subint(1) ' ' int(2) '_' subint(2)],{'M' 'X' '_c'},{Metal Halide ''});
            U_out = deblank( sprintf(['%16.12e  %16.12e  %16.12e  %16.12e  %16.12e  %16.12e  %16.12e' newline],Uo(:)) );
            TableFile = fullfile(Settings.WorkDir,[TableName '_' strrep(Energygrptables{idx,jdx},' ','_') '.xvg']);
            
            % Save tables into current directory
            fid = fopen(TableFile,'wt');
            fwrite(fid,regexprep(U_out,'\r',''));
            fclose(fid);
        end
    end
    
    Energygrptables = reshape(Energygrptables,1,[]);
    Energygrptables = sort(Energygrptables(~cellfun('isempty',Energygrptables)));
    
end