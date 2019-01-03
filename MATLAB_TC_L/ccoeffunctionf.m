function cmatrix = ccoeffunctionf(location,state)

n1 = 1;
nr = numel(location.x);
cmatrix = zeros(n1,nr);

s = get_parameters;

cmatrix(1,:) = rho_mahmood(state.u(1,:),s.T,s.Pc,s.Tc).*s.kf./s.mu;