function dmatrix = dcoeffunctionm(location,state)

n1 = 1;
nr = numel(location.x);
s = get_parameters;
dmatrix = zeros(n1,nr);

dmatrix(1,:) = s.phim.*cg_mahmood(...
    state.u(1,:),s.T,s.Pc,s.Tc).*rho_mahmood(...
    state.u(1,:),s.T,s.Pc,s.Tc) + (...
    1-s.phim).*(1/s.rhos).*adsorbed_derivative(state.u(1,:),s.PL,s.VL);

end
