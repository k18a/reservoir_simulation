function interporosity_flow = interporosity_flow(lx,km,Pm,Pf,T,Pc,Tc,mu)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
lambda = 12*(1/lx^2);

rho = rho_mahmood(Pm,T,Pc,Tc);

interporosity_flow = (lambda.*km.*rho.*(Pm-Pf))./mu;
end

