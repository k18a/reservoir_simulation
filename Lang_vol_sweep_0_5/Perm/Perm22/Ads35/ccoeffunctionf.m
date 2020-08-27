function cmatrix = ccoeffunctionf(location,state)

n1 = 1;
nr = numel(location.x);
cmatrix = zeros(n1,nr);

s = get_parameters;

p = state.u(1,:)

rho = rho_mahmood(p);
mu = mu_lee(s.T,rho,s.MW);
cmatrix(1,:) = rho.*s.kf./mu;

end