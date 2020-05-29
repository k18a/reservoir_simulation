function Ka = adsorbed_derivative(P)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
s = get_parameters;

if any([any(P == 0),any(isnan(P)),any(P == inf)])
    P(P==0) = s.Pi;
    P(isnan(P)) = s.Pi;
    P(isinf(P)) = s.Pi;
end

rho = rho_mahmood(P);

switch s.isotherm 
    case 'Linear'
        Na_ac = s.lk;
    case 'Langmuir'
        Na_ac = s.lq.*(s.lb)./(1+s.lb.*rho).^2;
    case 'Freundlich'
        Na_ac = s.fk.*(rho).^((1/s.fn)-1)./s.fn;
    case 'Dubinin-Radushkevich'
        Na_ac = (s.drb./rho).*exp(-(s.drb).*log(s.drs./rho));
    case 'Sips'
        Na_ac = s.sq.*((s.sb.*rho).^(1./s.sn))./(s.sn.*rho.*(1+(s.sb.*rho).^(1./s.sn)));
    case 'Toth'
        Na_ac = (s.tq.*s.tb).*((1+(s.tb.*rho).^(s.tt)).^((-1./s.tt) -1));
end

Na = max(Na_ac,s.lk);

Ka = Na*s.rhos;

end

