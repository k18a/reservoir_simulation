function s = get_parameters
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% declare matrix parameters
s.phim = 0.01;
s.km = 5e-6*9.869233e-13;
s.rhos = (1/(.5*1e-3));

% declare fracture parameters
s.phif = 0.05;
s.kf = 1*9.869233e-13*1e-4; % multiply by e04 to accout for width
s.lx = 20;
s.fw = 0.1;

% declare well inflow parameters
s.rw = 0.1;
s.re = 100;

% declare reservoir parameters
s.T = 333.15;
s.P0 = 14056597.54;
s.Pi = 6101325;
s.Pwf = 3101325;

% delcare fluid parameters
s.Tc = 190.55;
s.Pc = 4599200;
s.MW = 16.04e-3;

% adsorption parameters
s.VL = 0.201838;
s.PL = 7480.577757;

end