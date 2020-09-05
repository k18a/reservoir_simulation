function cmatrix = ccoeffunctionm(location,state)

n1 = 1;
nr = numel(location.x);
cmatrix = zeros(n1,nr);

p = state.u(1,:)

s = get_parameters;
rho = rho_mahmood(p);
mu = mu_lee(s.T,rho,s.MW);
cmatrix(1,:) = rho.*s.km./mu;

end