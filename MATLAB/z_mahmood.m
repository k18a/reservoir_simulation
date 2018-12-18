function z = z_mahmood(P,T,Pc,Tc)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if any([(P == 0),any(isnan(P)),(P == inf)])
    s = get_parameters;
    P(P==0) = nan;
    P(isnan(P))=0;
    P(isinf(P))=0;
end


Pr = P./Pc;
Tr = T./Tc;

z = (0.702.*(Pr.^2).*exp(-2.5.*Tr)) - ...
    (5.24.*Pr.*exp(-2.5.*Tr)) + ...
    (0.044.*Tr.^2) - ...
    (0.164.*Tr) + 1.15;
    
end