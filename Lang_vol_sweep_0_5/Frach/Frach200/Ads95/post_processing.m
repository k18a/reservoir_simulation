%% figures
figures = true;
% figures = false;
%% define geometry
s = get_parameters;
lm = s.lx;
hr = s.hr;
lf = s.lf;
hf = s.hf;
wr = s.rw;
load('results.mat')
%% post processing
[mat_l,frac_l] = get_lengths(lm,lf); 
max_days = s.day
days = [0:10,15:5:100,150:50:max_days];
ca = [];
ct = [];
% loop through days
for day = days
    % loop through matrix regions
    cfm = 0;
    cam = 0;
    for i = 1:11
        x = [linspace(mat_l(i,1),mat_l(i,2))];
        y = [linspace(0,(hr/2)-wr)];
        [X,Y] = meshgrid(x,y);
        if day == 0
            uintrp = ones(size(X)).*s.Pi;
        else
            uintrp = interpolateSolution(simulation_results,X,Y,day);
            % interpolate nan values
            if any([any(uintrp == 0),any(isnan(uintrp)),any(uintrp == inf)]) 
                nandata = uintrp;
                xdata=(1:length(nandata))';
                uintrp = interp1(xdata(~isnan(nandata)),nandata(~isnan(nandata)),xdata);
            end
        end
        p = reshape(uintrp,size(X));   
        cfma = s.phim.*rho_mahmood(p);
        cama = (1-s.phim).*adsorbed(p).*s.rhos;
        cfms = trapz(y,trapz(x,cfma,2));
        cams = trapz(y,trapz(x,cama,2));
        cfm = cfm + cfms;
        cam = cam + cams;
    end
    % loop through matrix above fracture regions
    cff = 0;
    for i = 1:10
        x = [linspace(frac_l(i,1),frac_l(i,2))];
        y = [linspace(0,(hr-hf)/2)];
        [X,Y] = meshgrid(x,y);
        if day == 0
            uintrp = ones(size(X)).*s.Pi;
        else
            uintrp = interpolateSolution(simulation_results,X,Y,day);
            % interpolate nan values
            if any([any(uintrp == 0),any(isnan(uintrp)),any(uintrp == inf)]) 
                nandata = uintrp;
                xdata=(1:length(nandata))';
                uintrp = interp1(xdata(~isnan(nandata)),nandata(~isnan(nandata)),xdata);
            end
        end
        p = reshape(uintrp,size(X));
        cfma = s.phim.*rho_mahmood(p);
        cama = (1-s.phim).*adsorbed(p).*s.rhos;
        cfms = trapz(y,trapz(x,cfma,2));
        cams = trapz(y,trapz(x,cama,2));
        cfm = cfm + cfms;
        cam = cam + cams;
    end
    % loop through fracture regions
    cff = 0;
    for i = 1:10
        x = [linspace(frac_l(i,1),frac_l(i,2))];
        y = [linspace((hr-hf)/2,(hr/2)-wr)];
        [X,Y] = meshgrid(x,y);
        if day == 0
            uintrp = ones(size(X)).*s.Pi;
        else
            uintrp = interpolateSolution(simulation_results,X,Y,day);
            % interpolate nan values
            if any([any(uintrp == 0),any(isnan(uintrp)),any(uintrp == inf)]) 
                nandata = uintrp;
                xdata=(1:length(nandata))';
                uintrp = interp1(xdata(~isnan(nandata)),nandata(~isnan(nandata)),xdata);
            end
        end
        p = reshape(uintrp,size(X));
        cffa = s.phif.*rho_mahmood(p);
        cff = trapz(y,trapz(x,cffa,2));
    end
    cam = cam*2*s.hr;
    cfm = cfm*2*s.hr;
    cff = cff*2*s.hr;
    ca = [ca, cam];
    ct = [ct, cam+cfm+cff];
end
% calculate production
pa = ca(1) - ca;
pt = ct(1) - ct;
%% save
r = (vertcat(days,ct,ca,pt,pa))';
csvwrite('production.csv',r)
%% plot figures
if figures
    figure
    hold on
    plot(days,ct)
    plot(days,ca)
    title('moles/kg present')
    figure
    hold on
    plot(days,pt)
    plot(days,pa)
    title('moles/kg produced')
    savefig('production.fig')
end
