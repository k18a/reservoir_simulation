function rho = rho_mahmood(P)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

s = get_parameters;

if any([any(P == 0),any(isnan(P)),any(P == inf)])
    
    P(P==0) = s.Pi;
    P(isnan(P)) = s.Pi;
    P(isinf(P)) = s.Pi;
end

rho = P./(z_mahmood(P).*8.3144598.*s.T);
    
end

