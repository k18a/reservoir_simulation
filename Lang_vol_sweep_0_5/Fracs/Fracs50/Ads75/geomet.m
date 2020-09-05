function g = geomet(lm, hr, hf, lf, wr)

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
    lm*1+lf*0
    lm*1+lf*1 
    lm*1+lf*1
    lm*1+lf*0
    (hr-hf)/2
    (hr-hf)/2
    (hr+hf)/2
    (hr+hf)/2];
f2 = [3
    4
    lm*2+lf*1
    lm*2+lf*2 
    lm*2+lf*2
    lm*2+lf*1
    (hr-hf)/2
    (hr-hf)/2
    (hr+hf)/2
    (hr+hf)/2];
f3 = [3
    4
    lm*3+lf*2
    lm*3+lf*3 
    lm*3+lf*3
    lm*3+lf*2
    (hr-hf)/2
    (hr-hf)/2
    (hr+hf)/2
    (hr+hf)/2];
f4 = [3
    4
    lm*4+lf*3
    lm*4+lf*4 
    lm*4+lf*4
    lm*4+lf*3
    (hr-hf)/2
    (hr-hf)/2
    (hr+hf)/2
    (hr+hf)/2];
f5 = [3
    4
    lm*5+lf*4
    lm*5+lf*5 
    lm*5+lf*5
    lm*5+lf*4
    (hr-hf)/2
    (hr-hf)/2
    (hr+hf)/2
    (hr+hf)/2];
f6 = [3
      4
      lm*6+lf*5
      lm*6+lf*6 
      lm*6+lf*6
      lm*6+lf*5
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f7 = [3
      4
      lm*7+lf*6
      lm*7+lf*7 
      lm*7+lf*7
      lm*7+lf*6
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f8 = [3
      4
      lm*8+lf*7
      lm*8+lf*8 
      lm*8+lf*8
      lm*8+lf*7
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f9 = [3
      4
      lm*9+lf*8
      lm*9+lf*9 
      lm*9+lf*9
      lm*9+lf*8
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f10 = [3
      4
      lm*10+lf*9
      lm*10+lf*10 
      lm*10+lf*10
      lm*10+lf*9
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
gd = [m,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,w];
ns = char('m','f1','f2','f3','f4','f5','f6','f7','f8','f9','f10','w');
ns = ns';
sf = '(m-(f1+f2+f3+f4+f5+f6+f7+f8+f9+f10)+(f1+f2+f3+f4+f5+f6+f7+f8+f9+f10))-w';
[g,bt] = decsg(gd,sf,ns);

end
