function cg = cg_mahmood(P)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
s = get_parameters;

if any([any(P == 0),any(isnan(P)),any(P == inf)])
    P(P==0) = s.Pi;
    P(isnan(P)) = s.Pi;
    P(isinf(P)) = s.Pi;
end
   
Pr = P./s.Pc;
Tr = s.T./s.Tc;

cr = (1./Pr) - (1./z_mahmood(P)).*(...
    (1.404.*exp(-2.5.*Tr).*Pr) - ...
    (5.524.*exp(-2.5.*Tr))...
    );
cg = cr/s.Pc;

end

