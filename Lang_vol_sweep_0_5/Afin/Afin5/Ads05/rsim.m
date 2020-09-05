%% figures
figures = true;
% figures = false;
%% define geometry
s = get_parameters;
lm = s.lx;
hr = s.hr;
lf = s.lf;
hf = s.hf;
wr = s.rw;
g = geomet(s.lx, s.hr, s.hf, s.lf, s.rw);
%% create PDE model
reservoir = createpde(1); 
geometryFromEdges(reservoir,g); % geometryFromEdges for 2-D
%%
if figures
    figure
    pdegplot(reservoir,'EdgeLabels','on');
end 
%% generate mesh
mesh = generateMesh(reservoir,'Hmax',5);%,'Hmin',0.05);
% view mesh
if figures
    figure
    pdemesh(reservoir)
end 
%% mesh quality 
Q = meshQuality(mesh);
if figures
    figure
    hist(Q)
end 
%% specify coefficients, boundary conditions, and initial conditions
% coefficients
s = get_parameters;
coefm = specifyCoefficients(reservoir,'m',0,...
                           'd',@dcoeffunctionm,...
                           'c',@ccoeffunctionm,...
                           'a',0,...
                           'f',@fcoeffunctionm,...
                           'Face',[1,12]);
coeff = specifyCoefficients(reservoir,'m',0,...
                           'd',@dcoeffunctionf,...
                           'c',@ccoeffunctionf,...
                           'a',0,...
                           'f',@fcoeffunctionf,...
                           'Face',[2:11,13:22]);
% boundary conditions
bc_w = applyBoundaryCondition(reservoir,...
    'dirichlet', 'Edge', [68:2:86,89:2:107], 'u', s.Pi);
bc_b = applyBoundaryCondition(reservoir,...
    'neumann', 'Edge', [1:66,67:2:87,88:2:108], 'g', [0], 'q', [0]);
%%
% initial conditions
ic = setInitialConditions(reservoir,s.Pi);
% time in seconds
tlist = [0:100];
% solve pde
initial_conditions = solvepde(reservoir,tlist);
%% plot
if figures
    figure
    ui = initial_conditions.NodalSolution;
    pdeplot(reservoir,'XYData',ui(:,101),'FaceAlpha',0.5)
    xlim([0 lm*11])
    ylim([0 hr])
end
%% simulate with production
% boundary conditions
bc_w = applyBoundaryCondition(reservoir,...
    'dirichlet', 'Edge', [68:2:86,89:2:107], 'u', s.Pwf);
% set duration
tlist = [1:86400:((86400*s.day))];
% set initial conditions
ic = setInitialConditions(reservoir,initial_conditions);
% solve pde
simulation_results = solvepde(reservoir,tlist);
% get solution
u = simulation_results.NodalSolution;
%% save results
if false
    save('results','simulation_results','-v7.3')
end
%% plot
if figures
    figure
    pdeplot(reservoir,'XYData',u(:,s.day),'FaceAlpha',0.5)
    xlim([0 lm*11])
    ylim([0 hr])
    savefig('final_distribution.fig')
end
%% define geometry
s = get_parameters;
lm = s.lx;
hr = s.hr;
lf = s.lf;
hf = s.hf;
wr = s.rw;
%% post processing
[mat_l,frac_l] = get_lengths(lm,lf); 
max_days = s.day
days = [0,max_days];
ca = [];
ct = [];
% loop through days
for day = days
    % loop through matrix regions
    cfm = 0;
    cam = 0;
    for i = 1:11
        x = [linspace(mat_l(i,1),mat_l(i,2))];
        y = [linspace(0,(hr/2)-wr)];
        [X,Y] = meshgrid(x,y);
        if day == 0
            uintrp = ones(size(X)).*s.Pi;
        else
            uintrp = interpolateSolution(simulation_results,X,Y,day);
            % interpolate nan values
            if any([any(uintrp == 0),any(isnan(uintrp)),any(uintrp == inf)]) 
                nandata = uintrp;
                xdata=(1:length(nandata))';
                uintrp = interp1(xdata(~isnan(nandata)),nandata(~isnan(nandata)),xdata);
            end
        end
        p = reshape(uintrp,size(X));   
        cfma = s.phim.*rho_mahmood(p);
        cama = (1-s.phim).*adsorbed(p).*s.rhos;
        cfms = trapz(y,trapz(x,cfma,2));
        cams = trapz(y,trapz(x,cama,2));
        cfm = cfm + cfms;
        cam = cam + cams;
    end
    % loop through matrix above fracture regions
    cff = 0;
    for i = 1:10
        x = [linspace(frac_l(i,1),frac_l(i,2))];
        y = [linspace(0,(hr-hf)/2)];
        [X,Y] = meshgrid(x,y);
        if day == 0
            uintrp = ones(size(X)).*s.Pi;
        else
            uintrp = interpolateSolution(simulation_results,X,Y,day);
            % interpolate nan values
            if any([any(uintrp == 0),any(isnan(uintrp)),any(uintrp == inf)]) 
                nandata = uintrp;
                xdata=(1:length(nandata))';
                uintrp = interp1(xdata(~isnan(nandata)),nandata(~isnan(nandata)),xdata);
            end
        end
        p = reshape(uintrp,size(X));
        cfma = s.phim.*rho_mahmood(p);
        cama = (1-s.phim).*adsorbed(p).*s.rhos;
        cfms = trapz(y,trapz(x,cfma,2));
        cams = trapz(y,trapz(x,cama,2));
        cfm = cfm + cfms;
        cam = cam + cams;
    end
    % loop through fracture regions
    cff = 0;
    for i = 1:10
        x = [linspace(frac_l(i,1),frac_l(i,2))];
        y = [linspace((hr-hf)/2,(hr/2)-wr)];
        [X,Y] = meshgrid(x,y);
        if day == 0
            uintrp = ones(size(X)).*s.Pi;
        else
            uintrp = interpolateSolution(simulation_results,X,Y,day);
            % interpolate nan values
            if any([any(uintrp == 0),any(isnan(uintrp)),any(uintrp == inf)]) 
                nandata = uintrp;
                xdata=(1:length(nandata))';
                uintrp = interp1(xdata(~isnan(nandata)),nandata(~isnan(nandata)),xdata);
            end
        end
        p = reshape(uintrp,size(X));
        cffa = s.phif.*rho_mahmood(p);
        cff = trapz(y,trapz(x,cffa,2));
    end
    cam = cam*2*s.hr;
    cfm = cfm*2*s.hr;
    cff = cff*2*s.hr;
    ca = [ca, cam];
    ct = [ct, cam+cfm+cff];
end
% calculate production
pa = ca(1) - ca;
pt = ct(1) - ct;
%% save
r = (vertcat(days,ct,ca,pt,pa))';
csvwrite('production.csv',r)
%% plot figures
if figures
    figure
    hold on
    plot(days,ct)
    plot(days,ca)
    title('moles/kg present')
    figure
    hold on
    plot(days,pt)
    plot(days,pa)
    title('moles/kg produced')
    savefig('production.fig')
end
exit
