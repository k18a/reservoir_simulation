function dNa = adsorbed_derivative(P,VL,PL)
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

dNa = VL.*(2.*(r.^2).*log(PRinv).*exp(-((r^2).*((log(PRinv)).^2))))./P;

end