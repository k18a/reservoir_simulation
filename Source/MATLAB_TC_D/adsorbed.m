function Na = adsorbed(P,VL,PL)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
s = get_parameters;
    
if any([any(P == 0),any(isnan(P)),any(P == inf)])
    P(P==0) = s.Pi;
    P(isnan(P)) = s.Pi;
    P(isinf(P)) = s.Pi;
end

% let PL = E

r = 8.314*s.T/PL;

PRinv = s.P0./P;

Na = VL.*exp(-((r.*log(PRinv)).^2));
end