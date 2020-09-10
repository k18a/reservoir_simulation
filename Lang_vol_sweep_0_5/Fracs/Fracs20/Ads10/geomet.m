function g = geomet(lm, hr, hf, lf, wr)

n_frac = 20
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
f6 = [3
      4
      matrix_length*6+fracture_length*5
      matrix_length*6+fracture_length*6 
      matrix_length*6+fracture_length*6
      matrix_length*6+fracture_length*5
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f7 = [3
      4
      matrix_length*7+fracture_length*6
      matrix_length*7+fracture_length*7 
      matrix_length*7+fracture_length*7
      matrix_length*7+fracture_length*6
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f8 = [3
      4
      matrix_length*8+fracture_length*7
      matrix_length*8+fracture_length*8 
      matrix_length*8+fracture_length*8
      matrix_length*8+fracture_length*7
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f9 = [3
      4
      matrix_length*9+fracture_length*8
      matrix_length*9+fracture_length*9 
      matrix_length*9+fracture_length*9
      matrix_length*9+fracture_length*8
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f10 = [3
      4
      matrix_length*10+fracture_length*9
      matrix_length*10+fracture_length*10 
      matrix_length*10+fracture_length*10
      matrix_length*10+fracture_length*9
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f11 = [3
      4
      matrix_length*11+fracture_length*10
      matrix_length*11+fracture_length*11 
      matrix_length*11+fracture_length*11
      matrix_length*11+fracture_length*10
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f12 = [3
      4
      matrix_length*12+fracture_length*11
      matrix_length*12+fracture_length*12 
      matrix_length*12+fracture_length*12
      matrix_length*12+fracture_length*11
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f13 = [3
      4
      matrix_length*13+fracture_length*12
      matrix_length*13+fracture_length*13 
      matrix_length*13+fracture_length*13
      matrix_length*13+fracture_length*12
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f14 = [3
      4
      matrix_length*14+fracture_length*13
      matrix_length*14+fracture_length*14 
      matrix_length*14+fracture_length*14
      matrix_length*14+fracture_length*13
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f15 = [3
      4
      matrix_length*15+fracture_length*14
      matrix_length*15+fracture_length*15 
      matrix_length*15+fracture_length*15
      matrix_length*15+fracture_length*14
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f16 = [3
      4
      matrix_length*16+fracture_length*15
      matrix_length*16+fracture_length*16 
      matrix_length*16+fracture_length*16
      matrix_length*16+fracture_length*15
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f17 = [3
      4
      matrix_length*17+fracture_length*16
      matrix_length*17+fracture_length*17 
      matrix_length*17+fracture_length*17
      matrix_length*17+fracture_length*16
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f18 = [3
      4
      matrix_length*18+fracture_length*17
      matrix_length*18+fracture_length*18 
      matrix_length*18+fracture_length*18
      matrix_length*18+fracture_length*17
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f19 = [3
      4
      matrix_length*19+fracture_length*18
      matrix_length*19+fracture_length*19 
      matrix_length*19+fracture_length*19
      matrix_length*19+fracture_length*18
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f20 = [3
      4
      matrix_length*20+fracture_length*19
      matrix_length*20+fracture_length*20 
      matrix_length*20+fracture_length*20
      matrix_length*20+fracture_length*19
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
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
gd = [m,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,w];
ns = char('m','f1','f2','f3','f4','f5','f6','f7','f8','f9','f10','f11','f12','f13','f14','f15','f16','f17','f18','f19','f20','w');
ns = ns';
sf = '(m-(f1+f2+f3+f4+f5+f6+f7+f8+f9+f10+f11+f12+f13+f14+f15+f16+f17+f18+f19+f20)+(f1+f2+f3+f4+f5+f6+f7+f8+f9+f10+f11+f12+f13+f14+f15+f16+f17+f18+f19+f20))-w';
[g,bt] = decsg(gd,sf,ns);

end
