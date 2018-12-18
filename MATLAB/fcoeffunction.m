function f = fcoeffunction(location,state)

N = 2; % number of equations
nr = length(location.x); % number of columns
f = zeros(N,nr); % allocate f

s = get_parameters;

if state.time > 100
    % Now the particular functional form of f
    flow_coupling = s.Lx.*s.Ly.*s.Lz.*interporosity_flow(...
        s.lx,s.ly,s.lz,s.km,state.u(1,:),state.u(2,:),s.T,s.Pc,s.Tc,s.mu);
    production = s.Lx.*inflow_gas_production(s.kf,...
        s.mu,mean(state.u(2,:)),s.T,s.Pwf,s.re,s.rw,s.Pc,s.Tc);

    f(1,:) = - flow_coupling;
    f(2,:) = flow_coupling - production;
end 

end