function rho = rho_mahmood(P,T,Pc,Tc)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if any([(P == 0),any(isnan(P)),(P == inf)])
    s = get_parameters;
    P(P==0) = nan;
    P(isnan(P))=0;
    P(isinf(P))=0;
end

rho = P./(z_mahmood(P,T,Pc,Tc).*8.3144598.*T);
    
end

