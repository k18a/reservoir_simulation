function rho = rho_mahmood(P,T,Pc,Tc)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if any([any(P == 0),any(isnan(P)),any(P == inf)])
    s = get_parameters;
    P(P==0) = s.Pi;
    P(isnan(P)) = s.Pi;
    P(isinf(P)) = s.Pi;
end

rho = P./(z_mahmood(P,T,Pc,Tc).*8.3144598.*T);
    
end

