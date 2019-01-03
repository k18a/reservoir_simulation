function Na = langmuir_derivative(P,VL,PL)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if any([any(P == 0),any(isnan(P)),any(P == inf)])
    s = get_parameters;
    P(P==0) = s.Pi;
    P(isnan(P)) = s.Pi;
    P(isinf(P)) = s.Pi;
end

Na = (VL.*PL)./(P+PL);
end

