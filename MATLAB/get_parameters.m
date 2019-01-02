function s = get_parameters
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% declare reservoir dimensions
s.Lx = 200;
s.Ly = 100;

% declare matrix parameters
s.phim = 0.05;
s.km = 1e-5*9.869233e-13;
s.rhos = 5e-4;

% declare fracture parameters
s.phif = 0.001;
s.kf = 1*9.869233e-13*1e-4;
s.lx = 20;
s.fw = 0.1;

% declare well inflow parameters
s.rw = 0.1;
s.re = 50;

% delcare fluid parameters
s.mu = 1e-5;
s.Tc = 190.55;
s.Pc = 4599200;

% declare reservoir parameters
s.T = 300;
s.Pi = 6101325;
s.Pwf = 3101325;

% adsorption parameters
s.VL = 0.2;
s.PL = 1101325;

end

