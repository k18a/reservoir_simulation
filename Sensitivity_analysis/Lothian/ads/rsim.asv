%% figures
figures = false;
% figures = false;
%% define geometry
lm = 100;
h = 500;
lf = 0.1;
wr = 0.05;
g = geomet(lm, h, lf, wr);
%% create PDE model
reservoir = createpde(1); 
geometryFromEdges(reservoir,g); % geometryFromEdges for 2-D
%%
if figures
    figure
    pdegplot(reservoir,'EdgeLabels','off');
end 
%% generate mesh
mesh = generateMesh(reservoir,'Hmax',50,'Hmin',0.05);
% view mesh
if figures
    figure
    pdemesh(reservoir)
end 
%% specify coefficients, boundary conditions, and initial conditions
% coefficients
s = get_parameters;
coefm = specifyCoefficients(reservoir,'m',0,...
                           'd',@dcoeffunctionm,...
                           'c',@ccoeffunctionm,...
                           'a',0,...
                           'f',@fcoeffunctionm,...
                           'Face',[1:2:21,22:2:42]);
coeff = specifyCoefficients(reservoir,'m',0,...
                           'd',@dcoeffunctionf,...
                           'c',@ccoeffunctionf,...
                           'a',0,...
                           'f',@fcoeffunctionf,...
                           'Face',[2:2:20,23:2:41]);
% boundary conditions
bc_w = applyBoundaryCondition(reservoir,...
    'dirichlet', 'Edge', [47:88], 'u', s.Pi);
    %'dirichlet', 'Edge', [48:2:66,69:2:87], 'u', s.Pi);
bc_b = applyBoundaryCondition(reservoir,...
    'neumann', 'Edge', [1:46], 'g', [0], 'q', [0]);
    %'neumann', 'Edge', [1:46,47:2:67,68:2:88], 'g', [0], 'q', [0]);
%%
% initial conditions
ic = setInitialConditions(reservoir,s.Pi);
% time in seconds
tlist = [0:100];
% solve pde
initial_conditions = solvepde(reservoir,tlist);
% plot
if figures
    figure
    ui = initial_conditions.NodalSolution;
    pdeplot(reservoir,'XYData',ui(:,101),'FaceAlpha',0.5)
    xlim([0 lm*11])
    ylim([0 h])
end
%% simulate with production
% boundary conditions
bc_w = applyBoundaryCondition(reservoir,...
    'dirichlet', 'Edge', [47:88], 'u', s.Pwf);
    %'dirichlet', 'Edge', [48:2:66,69:2:87], 'u', s.Pwf);
% set duration
days = 20000;
tlist = [1:86400:((86400*days))];
% set initial conditions
ic = setInitialConditions(reservoir,initial_conditions);
% solve pde
simulation_results = solvepde(reservoir,tlist);
% get solution
u = simulation_results.NodalSolution;
%% save results
if false
    save('results','u','-v7.3')
end
%% plot
if figures
    day = 1000;
    figure
    pdeplot(reservoir,'XYData',u(:,day),'FaceAlpha',0.5)
    xlim([0 lm*11])
    ylim([0 h])
end
%% post processing
[mat_l,frac_l] = get_lengths(lm,lf,wr,h); 
% days = [0,100,1000,5000,10000];
days = [0:10,15:5:100,150:50:1000,1500:500:10000,10000:1000:20000];
step_size = 5;
ca = [];
ct = [];
% loop through days
for day = days
    % loop through matrix regions
    cfm = 0;
    cam = 0;
    for i = 1:11
        x = [mat_l(i,1):step_size:mat_l(i,2)];
        y = [0:step_size,mat_l(i,3),mat_l(i,4):step_size:h];
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
        cfma = s.T.*s.phim.*rho_mahmood(p,s.T,s.Pc,s.Tc);
        cama = s.T.*(1-s.phim).*adsorbed(p,s.VL,s.PL)./s.rhos;
        cfms = trapz(y,trapz(x,cfma,2));
        cams = trapz(y,trapz(x,cama,2));
        cfm = cfm + cfms;
        cam = cam + cams;
    end
    % loop through fracture regions
    cff = 0;
    for i = 1:10
        x = [frac_l(i,1):step_size:frac_l(i,2)];
        y = [0:step_size,frac_l(i,3),frac_l(i,4):step_size:100];
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
        cffa = s.T.*s.phif.*rho_mahmood(p,s.T,s.Pc,s.Tc);
        cff = trapz(y,trapz(x,cffa,2));
    end
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
end