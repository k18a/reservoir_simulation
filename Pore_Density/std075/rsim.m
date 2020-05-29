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
if true
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