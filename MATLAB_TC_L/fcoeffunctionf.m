function f = fcoeffunctionf(location,state)

N = 1; % number of equations
nr = length(location.x); % number of columns
f = zeros(N,nr); % allocate f

if state.time > 100
    % Now the particular functional form of f
    s = get_parameters;
    p = state.u(1,:);
    pm = mean(p(ismember(location.subdomain,[1:2:21,22:2:42])));
    pf = mean(p(ismember(location.subdomain,[2:2:20,23:2:41])));
    flow_coupling = s.Lx.*s.Ly.*interporosity_flow(...
        s.lx,s.km,pm,pf,s.T,s.Pc,s.Tc,s.mu);
    production = 10.*s.fw.*inflow_gas_production(s.kf,...
        s.mu,pf,s.T,s.Pwf,s.re,s.rw,s.Pc,s.Tc);

    f(1,:) = flow_coupling - production;
    
end 

end