function g = geomet(lm, hr, hf, lf, wr)

n_frac = 5
total_length = lm*11+lf*10
fracture_length = lf
matrix_length = (total_length - fracture_length*n_frac)/(1+n_frac)


% matrix
m = [3
    4
    lm*0
    lm*11+lf*10 
    lm*11+lf*10
    lm*0
    hr*0
    hr*0
    hr*1
    hr*1];


%fracture
f1 = [3
    4
    matrix_length*1+fracture_length*0
    matrix_length*1+fracture_length*1 
    matrix_length*1+fracture_length*1
    matrix_length*1+fracture_length*0
    (hr-hf)/2
    (hr-hf)/2
    (hr+hf)/2
    (hr+hf)/2];
f2 = [3
    4
    matrix_length*2+fracture_length*1
    matrix_length*2+fracture_length*2 
    matrix_length*2+fracture_length*2
    matrix_length*2+fracture_length*1
    (hr-hf)/2
    (hr-hf)/2
    (hr+hf)/2
    (hr+hf)/2];
f3 = [3
    4
    matrix_length*3+fracture_length*2
    matrix_length*3+fracture_length*3 
    matrix_length*3+fracture_length*3
    matrix_length*3+fracture_length*2
    (hr-hf)/2
    (hr-hf)/2
    (hr+hf)/2
    (hr+hf)/2];
f4 = [3
    4
    matrix_length*4+fracture_length*3
    matrix_length*4+fracture_length*4 
    matrix_length*4+fracture_length*4
    matrix_length*4+fracture_length*3
    (hr-hf)/2
    (hr-hf)/2
    (hr+hf)/2
    (hr+hf)/2];
f5 = [3
    4
    matrix_length*5+fracture_length*4
    matrix_length*5+fracture_length*5 
    matrix_length*5+fracture_length*5
    matrix_length*5+fracture_length*4
    (hr-hf)/2
    (hr-hf)/2
    (hr+hf)/2
    (hr+hf)/2];
% f6 = [3
%       4
%       matrix_length*6+fracture_length*5
%       matrix_length*6+fracture_length*6 
%       matrix_length*6+fracture_length*6
%       matrix_length*6+fracture_length*5
%       (hr-hf)/2
%       (hr-hf)/2
%       (hr+hf)/2
%       (hr+hf)/2];
% f7 = [3
%       4
%       matrix_length*7+fracture_length*6
%       matrix_length*7+fracture_length*7 
%       matrix_length*7+fracture_length*7
%       matrix_length*7+fracture_length*6
%       (hr-hf)/2
%       (hr-hf)/2
%       (hr+hf)/2
%       (hr+hf)/2];
% f8 = [3
%       4
%       matrix_length*8+fracture_length*7
%       matrix_length*8+fracture_length*8 
%       matrix_length*8+fracture_length*8
%       matrix_length*8+fracture_length*7
%       (hr-hf)/2
%       (hr-hf)/2
%       (hr+hf)/2
%       (hr+hf)/2];
% f9 = [3
%       4
%       matrix_length*9+fracture_length*8
%       matrix_length*9+fracture_length*9 
%       matrix_length*9+fracture_length*9
%       matrix_length*9+fracture_length*8
%       (hr-hf)/2
%       (hr-hf)/2
%       (hr+hf)/2
%       (hr+hf)/2];
% f10 = [3
%       4
%       matrix_length*10+fracture_length*9
%       matrix_length*10+fracture_length*10 
%       matrix_length*10+fracture_length*10
%       matrix_length*10+fracture_length*9
%       (hr-hf)/2
%       (hr-hf)/2
%       (hr+hf)/2
%       (hr+hf)/2];
w = [3
    4
    0
    lm*11+lf*10 
    lm*11+lf*10
    0
    (hr/2)-wr
    (hr/2)-wr
    (hr/2)+wr
    (hr/2)+wr];
gd = [m,f1,f2,f3,f4,f5,w];
ns = char('m','f1','f2','f3','f4','f5','w');
ns = ns';
sf = '(m-(f1+f2+f3+f4+f5)+(f1+f2+f3+f4+f5))-w';
[g,bt] = decsg(gd,sf,ns);

end
