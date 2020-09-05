function [mat_l,frac_l] = get_lengths(lm,lf)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
mat_l = zeros(11,2);
frac_l = zeros(10,2);
mat_l(1,:) = [0,lm];
for i = 2:11
    mat_l(i,1) = mat_l(i-1,1)+lm+lf;
    mat_l(i,2) = mat_l(i-1,2)+lm+lf;
end
frac_l(1,:) = [lm,lm+lf];
for i = 2:10
    mat_l(i,1) = mat_l(i-1,1)+lm+lf;
    mat_l(i,2) = mat_l(i-1,2)+lm+lf;
end
end

