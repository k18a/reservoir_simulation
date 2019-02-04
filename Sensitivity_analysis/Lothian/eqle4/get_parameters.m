function s = get_parameters
% get parameters for simulation

% declare matrix parameters
s.phim = 0.3; % matrix porosity
s.km = 5e-6*9.869233e-13; % matrix permeability with conversion factor in m^2
s.rhos = 2257.948; % shale density in kg/cc

% declare fracture parameters
s.phif = 1*1e-4; % fracture porosity = 1 multiply by e04 to accout for width 
s.kf = 1*9.869233e-13*1e-4; % fracture permeability = 1 multiply by e04 to accout for width in m2

% declare geometry
s.lx = 100; % fracture spacing in x direction in m
s.rw = 0.05; % well radius in m
s.h = 500; % reservoir height in m
s.lf = 0.1; % fracture width in m this number is too large to be pracical but porosity and permeability are adjusted accordingly in m

% declare well inflow parameters
s.re = 100; % well equivalent radius in m

% delcare fluid parameters
s.Tc = 190.55; % methane critical temperature in K
s.Pc = 4599200; % methane critical pressure in Pa
s.MW = 16.04e-3; % methane molecular weight in kg/mol

% declare reservoir parameters
s.T = 333.15; % initial reservoir temperature in K
s.Pi = 6101325; % initial reservoir pressure in Pa
s.Pwf = 3101325; % bottom hole pressure in Pa

% adsorption parameters
s.VL = 0.189315649;
s.PL = 110132;

end
