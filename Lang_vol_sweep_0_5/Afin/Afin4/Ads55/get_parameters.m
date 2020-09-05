function s = get_parameters
% get parameters for simulation
s.day = 3650;% days for simulation

% declare matrix parameters
s.phim = 0.05; % matrix porosity
s.km = 4.99e-22;
s.rhos = 2.7e3; % shale density in kg/m3

% declare fracture parameters
s.phif = 1; % fracture porosity = 1 
s.kf = 1e-14; % fracture permeability = 1 

% declare geometry
s.lx = 20;
s.rw = 0.05; % well radius in m
s.hr = 300; % reservoir height in m
s.hf = 200;
s.lf = 0.01; % fracture width in m

% declare well inflow parameters
s.re = 100; % well equivalent radius in m

% delcare fluid parameters
s.Tc = 190.55; % methane critical temperature in K
s.Pc = 4599200; % methane critical pressure in Pa
s.MW = 16.04e-3; % methane molecular weight in kg/mol

% declare reservoir parameters
s.T = 333.15; % initial reservoir temperature in K
s.Pi = 20101325; % initial reservoir pressure in Pa
s.Pwf = 3601325; % bottom hole pressure in Pa

% adsorption parameters
s.isotherm = 'Langmuir';
s.lk = 1.82e-4; % henry constant in m^3/kg
s.lq = 0.55;
s.lb = 4e-4;
s.fk = 1.15e-3; % freundlich constant k in m^3/kg
s.fn = 1.47; % freundlich heterogeneity constant 
s.drb = 6.78e-1; % dr beta beta/RT
s.drq = 3.98e-1; % dr max sorption in mol/kg
s.drs = 5.56e3; % dr s in mol/m^3
s.sb = 8.12e-4; % sips b in m^3/mol
s.sn = 9e-1;  % sips n
s.sq = 3.11e-1; % sips max sorption mol/kg
s.tb = 6.67e-4; % toth affinity in m^3/mol
s.tq = 2.81e-1; % toth max sorption in mol/kg
s.tt = 1.41; % toth heterogeneity
s.ub = 2.58e-2; % unilan affinity in m^3/mol
s.uq = 1.47e-3; % unilan max sorption in mol/kg 
s.us = 3.76; % unilan heterogeniety

end
