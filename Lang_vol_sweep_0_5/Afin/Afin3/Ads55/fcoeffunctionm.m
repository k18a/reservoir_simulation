function f = fcoeffunctionm(location,state)

N = 1; % number of equations
nr = length(location.x); % number of columns
f = zeros(N,nr); % allocate f

if state.time > 100
    % Now the particular functional form of f
    s = get_parameters;
    p = state.u(1,:);
    pm = mean(p(ismember(location.subdomain,[1,12])));
    pf = mean(p(ismember(location.subdomain,[2:11,13:22])));
    rho = rho_mahmood(pm);
    mu = mu_lee(s.T,rho,s.MW);
    flow_coupling = s.Lx.*s.Ly.*interporosity_flow(...
        s.lx,s.km,pm,pf,s.T,s.Pc,s.Tc,mu);

    f(1,:) = - flow_coupling;
    
end 

end