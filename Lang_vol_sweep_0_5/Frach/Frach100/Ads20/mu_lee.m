function mu = mu_lee(T,rho,MW)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
T = T.*1.8;
rho = (rho.*MW).*1e-3;
MW = MW.*1e3;
K = ( (9.4 + (0.02.*MW) ).*T.^(1.5))/(209 + (19.*MW) + T);
X = 3.5 + 986./T + 0.001.*MW;
Y = 2.4 - 0.2.*X;
mu = K.*exp(X.*(rho.^Y)).*1e-4;
mu = mu.*1e-3;
end

