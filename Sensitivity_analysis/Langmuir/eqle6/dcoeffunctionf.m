function dmatrix = dcoeffunctionf(location,state)

n1 = 1;
nr = numel(location.x);
s = get_parameters;
dmatrix = zeros(n1,nr);

dmatrix(1,:) = s.phif.*cg_mahmood(state.u(...
    1,:),s.T,s.Pc,s.Tc).*rho_mahmood(state.u(1,:),s.T,s.Pc,s.Tc);

end