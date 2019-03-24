function dmatrix = dcoeffunctionf(location,state)

n1 = 4;
nr = numel(location.x);
s = get_parameters;
dmatrix = zeros(n1,nr);

% an n^2 element matrix 

dmatrix(1,:) = s.phim.*cg_mahmood(...
    state.u(1,:),state.u(2,:),s.Pc,s.Tc).*rho_mahmood(...
    state.u(1,:),state.u(2,:),s.Pc,s.Tc);
dmatrix(2,:) = 0;
dmatrix(3,:) = s.phim.*alphag_mahmood(...
    state.u(1,:),s.T,s.Pc,s.Tc).*rho_mahmood(...
    state.u(1,:),s.T,s.Pc,s.Tc);
dmatrix(4,:) = s.phim.*s.cpg.*rho_mahmood(...
    state.u(1,:),s.T,s.Pc,s.Tc);

end