function cg = cg_mahmood(P,T,Pc,Tc)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if any([(P == 0),any(isnan(P)),(P == inf)])
    s = get_parameters;
    P(P==0) = nan;
    P(isnan(P))=0;
    P(isinf(P))=0;
end
   
Pr = P./Pc;
Tr = T./Tc;

cr = (1./Pr) - (1./z_mahmood(P,T,Pc,Tc)).*(...
    (1.404.*exp(-2.5.*Tr).*Pr) - ...
    (5.524.*exp(-2.5.*Tr))...
    );
cg = cr/Pc;

end

