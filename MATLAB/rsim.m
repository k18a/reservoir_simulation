%% define geometry
lm = 20;
h = 100;
lf = 0.1;
wr = 0.05;
g = geomet(lm, h, lf, wr);
%% create PDE model
reservoir = createpde(1); % 1 - m , 2 - f
geometryFromEdges(reservoir,g); % geometryFromEdges for 2-D
%%
pdegplot(reservoir,'FaceLabels','on');
%% generate mesh
mesh = generateMesh(reservoir,'Hmax',50,'Hmin',0.05);
% view mesh
pdemesh(reservoir)
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
%%
% initial conditions
ic = setInitialConditions(reservoir,s.Pi);
%% set tlist
tlist = [0:100];
%%
initial_conditions = solvepde(reservoir,tlist);
%%
ui = initial_conditions.NodalSolution;
pdeplot(reservoir,'XYData',ui(:,101),'FaceAlpha',0.5)
xlim([0 220])
ylim([0 100])
colormap gray
%%
% boundary conditions
bc_w = applyBoundaryCondition(reservoir,...
    'dirichlet', 'Edge', [47:88], 'u', s.Pwf);
days = 1000;
tlist = [1:86400:((86400*days))];
ic = setInitialConditions(reservoir,initial_conditions);
%% solve pde
simulation_results = solvepde(reservoir,tlist);
%% get solution
u = simulation_results.NodalSolution;
%% plot solution
day = 1000;
pdeplot(reservoir,'XYData',u(:,day),'FaceAlpha',0.5)
xlim([0 220])
ylim([0 100])
%%
lm = 20;
[X,Y] = meshgrid([0:.1:220],[50.05:.1:100]);
%%
day = 1000;
uintrp = interpolateSolution(simulation_results,X,Y,day);
v = reshape(uintrp,size(X));
%%
figure
surf(X,Y,v,'LineStyle','none')
axis equal
view(0,90)
colorbar