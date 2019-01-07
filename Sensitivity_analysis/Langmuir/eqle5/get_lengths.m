function [mat_l,frac_l] = get_lengths(lm,lf,w,h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
mat_l = zeros(11,4);
frac_l = zeros(10,4);
mat_l(1,:) = [0,lm,(h/2)-w,(h/2)+w];
for i = 2:11
    mat_l(i,1) = mat_l(i-1,1)+lm+lf;
    mat_l(i,2) = mat_l(i-1,2)+lm+lf;
    mat_l(i,3) = (h/2)-w;
    mat_l(i,4) = (h/2)+w;
end
frac_l(1,:) = [lm,lm+lf,(h/2)-w,(h/2)+w];
for i = 2:10
    mat_l(i,1) = mat_l(i-1,1)+lm+lf;
    mat_l(i,2) = mat_l(i-1,2)+lm+lf;
    mat_l(i,3) = (h/2)-w;
    mat_l(i,4) = (h/2)+w;
end
end

