function alphag = alphag_mahmood(P,T,Pc,Tc)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if any([any(P == 0),any(isnan(P)),any(P == inf)])
    s = get_parameters;
    P(P==0) = s.Pi;
    P(isnan(P)) = s.Pi;
    P(isinf(P)) = s.Pi;
end

if any([any(T == 0),any(isnan(T)),any(T == inf)])
    s = get_parameters;
    T(T==0) = s.T;
    T(isnan(T)) = s.T;
    T(isinf(T)) = s.T;
end

Pr = P./Pc;
Tr = T./Tc;

alphar = (1./Tr) - (1./z_mahmood(P,T,Pc,Tc)).*(...
    ((13.1.*Pr - 1.75.*Pr.^2).*exp(-2.5.*Tr)) + ...
    (5.524.*Tr) - 0.164...
    );
alphag = alphar/Tc;

end

