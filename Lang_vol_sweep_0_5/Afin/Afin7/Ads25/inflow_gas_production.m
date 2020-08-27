function production = inflow_gas_production(k,mu,Pav,Pwf,re,rw)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

rho = rho_mahmood(Pav);
production = (k.*rho.*2.*pi.*(Pav-Pwf))./(mu.*log(re./rw));
end