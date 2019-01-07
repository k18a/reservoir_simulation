function cmatrix = ccoeffunctionf(location,state)

n1 = 1;
nr = numel(location.x);
cmatrix = zeros(n1,nr);

s = get_parameters;

rho = rho_mahmood(state.u(1,:),s.T,s.Pc,s.Tc);
mu = mu_lee(s.T,rho,s.MW);
cmatrix(1,:) = rho.*s.kf./mu;