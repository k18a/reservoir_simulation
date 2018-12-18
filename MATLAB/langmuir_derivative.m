function Na = langmuir_derivative(P,VL,PL)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Na = (VL.*PL)./(P+PL);
end

