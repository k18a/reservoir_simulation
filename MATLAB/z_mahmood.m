function z = z_mahmood(P,T,Pc,Tc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if any([any(P == 0),any(isnan(P)),any(P == inf)])
    s = get_parameters;
    P(P==0) = s.Pi;
    P(isnan(P)) = s.Pi;
    P(isinf(P)) = s.Pi;
end


Pr = P./Pc;
Tr = T./Tc;

z = (0.702.*(Pr.^2).*exp(-2.5.*Tr)) - ...
    (5.24.*Pr.*exp(-2.5.*Tr)) + ...
    (0.044.*Tr.^2) - ...
    (0.164.*Tr) + 1.15;
    
end