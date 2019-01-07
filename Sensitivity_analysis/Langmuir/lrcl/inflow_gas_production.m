function production = inflow_gas_production(k,mu,Pav,Tav,Pwf,re,rw,Pc,Tc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

rho = rho_mahmood(Pav,Tav,Pc,Tc);
production = (k.*rho.*2.*pi.*(Pav-Pwf))./(mu.*log(re./rw));
end