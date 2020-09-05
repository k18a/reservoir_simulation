function dmatrix = dcoeffunctionm(location,state)

n1 = 1;
nr = numel(location.x);
s = get_parameters;
dmatrix = zeros(n1,nr);

p = state.u(1,:);

dmatrix(1,:) = cg_mahmood(p) .* rho_mahmood(p) .* (  s.phim.* + (1-s.phim).*adsorbed_derivative(p) );

end