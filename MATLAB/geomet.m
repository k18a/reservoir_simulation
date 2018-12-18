function g = geomet(lm, h, lf, wr)

lm = 20;
h = 100;
lf = 0.1;
wr = 0.05;

m1 = [3
    4
    lm*0
    lm*1 
    lm*1
    lm*0
    h*0
    h*0
    h*1
    h*1];
f1 = [3
    4
    lm*1+lf*0
    lm*1+lf*1 
    lm*1+lf*1
    lm*1+lf*0
    h*0
    h*0
    h*1
    h*1];
m2 = [3
    4
    lm*1+lf*1
    lm*2+lf*1 
    lm*2+lf*1
    lm*1+lf*1
    h*0
    h*0
    h*1
    h*1];
f2 = [3
    4
    lm*2+lf*1
    lm*2+lf*2 
    lm*2+lf*2
    lm*2+lf*1
    h*0
    h*0
    h*1
    h*1];
m3 = [3
    4
    lm*2+lf*2
    lm*3+lf*2 
    lm*3+lf*2
    lm*2+lf*2
    h*0
    h*0
    h*1
    h*1];
f3 = [3
    4
    lm*3+lf*2
    lm*3+lf*3 
    lm*3+lf*3
    lm*3+lf*2
    h*0
    h*0
    h*1
    h*1];
m4 = [3
    4
    lm*3+lf*3
    lm*4+lf*3 
    lm*4+lf*3
    lm*3+lf*3
    h*0
    h*0
    h*1
    h*1];
f4 = [3
    4
    lm*4+lf*3
    lm*4+lf*4 
    lm*4+lf*4
    lm*4+lf*3
    h*0
    h*0
    h*1
    h*1];
m5 = [3
    4
    lm*4+lf*4
    lm*5+lf*4 
    lm*5+lf*4
    lm*4+lf*4
    h*0
    h*0
    h*1
    h*1];
f5 = [3
    4
    lm*5+lf*4
    lm*5+lf*5 
    lm*5+lf*5
    lm*5+lf*4
    h*0
    h*0
    h*1
    h*1];
m6 = [3
    4
    lm*5+lf*5
    lm*6+lf*5 
    lm*6+lf*5
    lm*5+lf*5
    h*0
    h*0
    h*1
    h*1];
f6 = [3
      4
      lm*6+lf*5
      lm*6+lf*6 
      lm*6+lf*6
      lm*6+lf*5
      h*0
      h*0
      h*1
      h*1];
m7 = [3
      4
      lm*6+lf*6
      lm*7+lf*6 
      lm*7+lf*6
      lm*6+lf*6
      h*0
      h*0
      h*1
      h*1];
f7 = [3
      4
      lm*7+lf*6
      lm*7+lf*7 
      lm*7+lf*7
      lm*7+lf*6
      h*0
      h*0
      h*1
      h*1];
m8 = [3
      4
      lm*7+lf*7
      lm*8+lf*7 
      lm*8+lf*7
      lm*7+lf*7
      h*0
      h*0
      h*1
      h*1];
f8 = [3
      4
      lm*8+lf*7
      lm*8+lf*8 
      lm*8+lf*8
      lm*8+lf*7
      h*0
      h*0
      h*1
      h*1];
m9 = [3
      4
      lm*8+lf*8
      lm*9+lf*8 
      lm*9+lf*8
      lm*8+lf*8
      h*0
      h*0
      h*1
      h*1];
f9 = [3
      4
      lm*9+lf*8
      lm*9+lf*9 
      lm*9+lf*9
      lm*9+lf*8
      h*0
      h*0
      h*1
      h*1];
m10 = [3
      4
      lm*9+lf*9
      lm*10+lf*9 
      lm*10+lf*9
      lm*9+lf*9
      h*0
      h*0
      h*1
      h*1];
f10 = [3
      4
      lm*10+lf*9
      lm*10+lf*10 
      lm*10+lf*10
      lm*10+lf*9
      h*0
      h*0
      h*1
      h*1];
m11 = [3
       4
       lm*10+lf*10
       lm*11+lf*10 
       lm*11+lf*10
       lm*10+lf*10
       h*0
       h*0
       h*1
       h*1];
w = [3
    4
    0
    lm*11+lf*10 
    lm*11+lf*10
    0
    (h/2)-wr
    (h/2)-wr
    (h/2)+wr
    (h/2)+wr];
gd = [m1,f1,m2,f2,m3,f3,m4,f4,m5,f5,m6,f6,m7,f7,m8,f8,m9,f9,m10,f10,m11,w];
ns = char('m1','f1','m2','f2','m3','f3','m4','f4','m5','f5','m6','f6','m7','f7','m8','f8','m9','f9','m10','f10','m11','w');
ns = ns';
sf = '(m1+f1+m2+f2+m3+f3+m4+f4+m5+f5+m6+f6+m7+f7+m8+f8+m9+f9+m10+f10+m11)-w';
[g,bt] = decsg(gd,sf,ns);

end
