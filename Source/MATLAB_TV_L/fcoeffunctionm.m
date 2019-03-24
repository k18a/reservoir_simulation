function f = fcoeffunctionm(location,state)

N = 2; % number of equations
nr = length(location.x); % number of columns
f = zeros(N,nr); % allocate f

if state.time > 100
    % Now the particular functional form of f
    s = get_parameters;
    p = state.u(1,:);
    pm = mean(p(ismember(location.subdomain,[1:2:21,22:2:42])));
    pf = mean(p(ismember(location.subdomain,[2:2:20,23:2:41])));
    rho = rho_mahmood(pm,s.T,s.Pc,s.Tc);
    mu = mu_lee(state.u(2,:),rho,s.MW);
    flow_coupling = s.Lx.*s.Ly.*interporosity_flow(...
        s.lx,s.km,pm,pf,s.T,s.Pc,s.Tc,mu);

    f(1,:) = - flow_coupling;
    f(2,:) = (s.cpg.*rho_mahmood(...
        state.u(1,:),state.u(2,:),s.Pc,s.Tc).*s.km./mu).*(...
        state.ux(1,:)+state.uy(1,:)).*(...
        state.ux(2,:)+state.uy(2,:));

end 

end