home = find_home;
DataDir = fullfile(home,'data','Melting_Point_Data.mat');
Salt = 'NaCl';
SolStructure = 'Rocksalt';
Model = 'JC';
fs = 24;
Custom_Legend = true;
% Custom legend parameters:
% 'Thermostat' 'Tau_T' 'Barostat' 'Tau_P' 'R_C' 'DispCorr' 'MaxTime'
% 'MeltFreezeThreshold' 'XYZ' 'XY' 'Z' 'N' 'Ewald' 'Fourier_Spacing'
% 'Ewald_rtol' 'ScaleCompressibility' 'PreEquilibrate'

Sets = {'Set60' 'Set61'};
Legend_Params = {'N' 'MaxTime' 'MeltFreezeThreshold'};

% Sets = {'Set27' 'Set28' 'Set29' 'Set30' 'Set31'};
% Legend_Params = {'N' 'R_C' 'Thermostat' 'Tau_T' 'Barostat' 'Tau_P'};


N_Sets = length(Sets);
Colours = cbrewer('qual','Set2',max(N_Sets,3));
ColoursDark = cbrewer('qual','Dark2',max(N_Sets,3));
Legend_txt = cell(1,2*N_Sets);
p = gobjects(1,2*N_Sets);
w = 0.75;
dist_start = 1280;
dist_end = 1300;
bin_edges = dist_start:w:dist_end; %205:w:226;
bin_centers = bin_edges(1:end-1)+w/2;
xlimits = [bin_edges(1) bin_edges(end)];
YDat = zeros(N_Sets,length(bin_edges)-1);

figh = figure('WindowState','maximized','NumberTitle','off',...
    'Name','','Visible','On');
axh = axes(figh,'FontSize',24,'TickLabelInterpreter','latex',...
    'XMinorGrid','on','YLimitMethod','padded',...
    'YMinorGrid','on');
hold(axh,'on')

Exp = Load_Experimental_Data;
Tm_Exp = Exp.(Salt).mp;

Data = load(DataDir).Data.(Salt).(Model).(SolStructure);

AllJobs = fieldnames(Data);
for sidx = 1:N_Sets
    Set = Sets{sidx};
    col = Colours(sidx,:);
    colDark = ColoursDark(sidx,:);
    
    [~,Dependent_var,Legend_txt{2*sidx-1},~,~,~,Parameters] =  MP_Set_Info(Set);
    if Custom_Legend
        Legend_txt{2*sidx-1} = Parameters.(Legend_Params{1});
        for lidx = 2:length(Legend_Params)
            Legend_txt{2*sidx-1} = [Legend_txt{2*sidx-1} ', ' Parameters.(Legend_Params{lidx})];
        end
    end
    
    JobsOfInterest = AllJobs(contains(AllJobs,Set));
    X = zeros(length(JobsOfInterest),1);
    Y = zeros(length(JobsOfInterest),1);
    Y_pos_err = zeros(length(JobsOfInterest),1);
    Y_neg_err = zeros(length(JobsOfInterest),1);

    Xscatter = [];
    Yscatter = [];

    for jdx = 1:length(JobsOfInterest)

         if Data.(JobsOfInterest{jdx}).MP_confirmed
            MPs_idx = ~Data.(JobsOfInterest{jdx}).Freeze_Trace & ~Data.(JobsOfInterest{jdx}).Melt_Trace;
            Tms = Data.(JobsOfInterest{jdx}).T_Trace(MPs_idx);

            mean_Tm = mean([min(Tms) max(Tms)]);

            dTms = Tms; %- Tm_Exp;
            switch Dependent_var
                case 'Rep'
                    repno = regexp(JobsOfInterest{jdx},'Rep_([0-9]+)','once','tokens');
                    XPoints = repmat(str2double(repno{1}),1,length(dTms));
                    X(jdx) = str2double(repno{1});
                otherwise
                    XPoints = repmat(norm(Data.(JobsOfInterest{jdx}).(Dependent_var)),1,length(dTms));
                    X(jdx) = norm(Data.(JobsOfInterest{jdx}).(Dependent_var));
            end

            Y(jdx) = mean([min(dTms) max(dTms)]);

            for kdx = 1:length(Tms)
                Xscatter(end+1) = XPoints(kdx);
                Yscatter(end+1) = dTms(kdx);
            end

            Tfr_idx = Data.(JobsOfInterest{jdx}).T_Freeze_Trace < min(Tms);
            Tml_idx = Data.(JobsOfInterest{jdx}).T_Melt_Trace > max(Tms);

            T_freeze_max = max( Data.(JobsOfInterest{jdx}).T_Freeze_Trace(Tfr_idx) );
            T_melt_min = min( Data.(JobsOfInterest{jdx}).T_Melt_Trace(Tml_idx) );

            Y_pos_err(jdx) = T_melt_min - mean_Tm;
            Y_neg_err(jdx) = mean_Tm - T_freeze_max;

         else
            switch Dependent_var
                case 'Rep'
                    repno = regexp(JobsOfInterest{jdx},'Rep_([0-9]+)','once','tokens');
                    X(jdx) = str2double(repno{1});
                otherwise
                    X(jdx) = norm(Data.(JobsOfInterest{jdx}).(Dependent_var));
            end

            Tm = mean(Data.(JobsOfInterest{jdx}).dT);
            Y(jdx) = Tm; %- Tm_Exp;

            Y_pos_err(jdx) = Data.(JobsOfInterest{jdx}).dT(2) - Tm;
            Y_neg_err(jdx) = Tm - Data.(JobsOfInterest{jdx}).dT(1);
         end
    end
    %YDat(sidx,:) = histcounts(Y,bin_edges);
    YDat = histcounts(Y,bin_edges);
%     p(2*sidx-1) = area(axh,bin_centers,YDat./sum(YDat),'FaceColor',Colours(sidx,:),...
%         'EdgeColor',Colours(sidx,:),'Linewidth',2,'FaceAlpha',0.25);
    p(2*sidx-1) = bar(axh,bin_centers,YDat./sum(YDat),'FaceColor',Colours(sidx,:),...
        'EdgeColor',Colours(sidx,:),'Linewidth',2,'FaceAlpha',0.25);
    
    
	% Generate a Gaussian Fit model
    X_known = bin_centers;
    Y_known = YDat./sum(YDat);
    modelfun = @(b,x)normpdf(x,b(1),b(2));
    beta0 = [1290 2];
    opts = statset('Display','iter','TolFun',1e-20,'TolX',1e-20,'maxiter',1000);
    model = fitnlm(X_known',Y_known',modelfun,beta0,'Options',opts);
    
    x = (dist_start:0.1:dist_end)';
    y = model.predict(x);
    hold on
    p(2*sidx) = plot(x,y,'Linewidth',2,'Color',Colours(sidx,:));
    Legend_txt{2*sidx} = ['Fitted Gaussian: $\mu = ' num2str(model.Coefficients.Estimate(1),'%.1f') '$ K, $\sigma = ' num2str(model.Coefficients.Estimate(2),'%.2f') '$ K'];

    % Statistics
    varc = var(Y);
    meanc = mean(Y);
    
    SEM = std(Y)/sqrt(length(Y));               % Standard Error
    ts = tinv([0.025  0.975],length(Y)-1);      % T-Score
    CI = mean(Y) + ts*SEM;                      % Confidence Intervals
    
    

end


%p = bar(bin_centers,YDat','FaceColor','flat','Visible','on','BarWidth',1);

% Apply colours and alpha
% for i=1:length(p)
%     p(i).CData = Colours(i,:);
%     p(i).LineWidth = 2;
% end

set(axh,'FontSize',fs,'Box','On','TickLabelInterpreter','latex')
xlim(axh,'padded')
ylim(axh,'padded')
xlabel(axh,'$T_{m}$ [K]','Interpreter','latex');

    
ylabel(axh,'$\rho(T_{m})$','Interpreter','latex')
%yticks(axh,0:0.1:1)
grid(axh,'minor')


%% Fit normal distribution to results
legend(axh,p,Legend_txt,'location','Northwest','Interpreter','latex');




