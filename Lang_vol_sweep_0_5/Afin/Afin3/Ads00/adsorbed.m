function Nm = adsorbed(P)
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
        Nm = s.lk*rho;
    case 'Langmuir'
        Nm = s.lq.*(s.lb.*rho)./(1+s.lb.*rho);
    case 'Freundlich'
        Nm = s.fk.*(rho).^(1/s.fn);
    case 'Dubinin-Radushkevich'
        Nm = s.drq.*exp(-(s.drb).*log(s.drs./rho));
    case 'Sips'
        Nm = s.sq.*((s.sb.*rho).^(1./s.sn))./(1+(s.sb.*rho).^(1./s.sn));
    case 'Toth'
        Nm = s.tq.*(s.tb.*rho)./((1+(s.tb.*rho).^(s.tt)).^(1./s.tt));
end

end

