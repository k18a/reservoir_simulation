function g = geomet(lm, hr, hf, lf, wr)

n_frac = 50
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
f21 = [3
      4
      matrix_length*21+fracture_length*20
      matrix_length*21+fracture_length*21 
      matrix_length*21+fracture_length*21
      matrix_length*21+fracture_length*20
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f22 = [3
      4
      matrix_length*22+fracture_length*21
      matrix_length*22+fracture_length*22 
      matrix_length*22+fracture_length*22
      matrix_length*22+fracture_length*21
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f23 = [3
      4
      matrix_length*23+fracture_length*22
      matrix_length*23+fracture_length*23 
      matrix_length*23+fracture_length*23
      matrix_length*23+fracture_length*22
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f24 = [3
      4
      matrix_length*24+fracture_length*23
      matrix_length*24+fracture_length*24 
      matrix_length*24+fracture_length*24
      matrix_length*24+fracture_length*23
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f25 = [3
      4
      matrix_length*25+fracture_length*24
      matrix_length*25+fracture_length*25 
      matrix_length*25+fracture_length*25
      matrix_length*25+fracture_length*24
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f26 = [3
      4
      matrix_length*26+fracture_length*25
      matrix_length*26+fracture_length*26 
      matrix_length*26+fracture_length*26
      matrix_length*26+fracture_length*25
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f27 = [3
      4
      matrix_length*27+fracture_length*26
      matrix_length*27+fracture_length*27 
      matrix_length*27+fracture_length*27
      matrix_length*27+fracture_length*26
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f28 = [3
      4
      matrix_length*28+fracture_length*27
      matrix_length*28+fracture_length*28 
      matrix_length*28+fracture_length*28
      matrix_length*28+fracture_length*27
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f29 = [3
      4
      matrix_length*29+fracture_length*28
      matrix_length*29+fracture_length*29 
      matrix_length*29+fracture_length*29
      matrix_length*29+fracture_length*28
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f30 = [3
      4
      matrix_length*30+fracture_length*29
      matrix_length*30+fracture_length*30 
      matrix_length*30+fracture_length*30
      matrix_length*30+fracture_length*29
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f31 = [3
      4
      matrix_length*31+fracture_length*30
      matrix_length*31+fracture_length*31 
      matrix_length*31+fracture_length*31
      matrix_length*31+fracture_length*30
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f32 = [3
      4
      matrix_length*32+fracture_length*31
      matrix_length*32+fracture_length*32 
      matrix_length*32+fracture_length*32
      matrix_length*32+fracture_length*31
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f33 = [3
      4
      matrix_length*33+fracture_length*32
      matrix_length*33+fracture_length*33 
      matrix_length*33+fracture_length*33
      matrix_length*33+fracture_length*32
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f34 = [3
      4
      matrix_length*34+fracture_length*33
      matrix_length*34+fracture_length*34 
      matrix_length*34+fracture_length*34
      matrix_length*34+fracture_length*33
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f35 = [3
      4
      matrix_length*35+fracture_length*34
      matrix_length*35+fracture_length*35 
      matrix_length*35+fracture_length*35
      matrix_length*35+fracture_length*34
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f36 = [3
      4
      matrix_length*36+fracture_length*35
      matrix_length*36+fracture_length*36 
      matrix_length*36+fracture_length*36
      matrix_length*36+fracture_length*35
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f37 = [3
      4
      matrix_length*37+fracture_length*36
      matrix_length*37+fracture_length*37 
      matrix_length*37+fracture_length*37
      matrix_length*37+fracture_length*36
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f38 = [3
      4
      matrix_length*38+fracture_length*37
      matrix_length*38+fracture_length*38 
      matrix_length*38+fracture_length*38
      matrix_length*38+fracture_length*37
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f39 = [3
      4
      matrix_length*39+fracture_length*38
      matrix_length*39+fracture_length*39 
      matrix_length*39+fracture_length*39
      matrix_length*39+fracture_length*38
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f40 = [3
      4
      matrix_length*40+fracture_length*39
      matrix_length*40+fracture_length*40 
      matrix_length*40+fracture_length*40
      matrix_length*40+fracture_length*39
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f41 = [3
      4
      matrix_length*41+fracture_length*40
      matrix_length*41+fracture_length*41 
      matrix_length*41+fracture_length*41
      matrix_length*41+fracture_length*40
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f42 = [3
      4
      matrix_length*42+fracture_length*41
      matrix_length*42+fracture_length*42 
      matrix_length*42+fracture_length*42
      matrix_length*42+fracture_length*41
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f43 = [3
      4
      matrix_length*43+fracture_length*42
      matrix_length*43+fracture_length*43 
      matrix_length*43+fracture_length*43
      matrix_length*43+fracture_length*42
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f44 = [3
      4
      matrix_length*44+fracture_length*43
      matrix_length*44+fracture_length*44 
      matrix_length*44+fracture_length*44
      matrix_length*44+fracture_length*43
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f45 = [3
      4
      matrix_length*45+fracture_length*44
      matrix_length*45+fracture_length*45 
      matrix_length*45+fracture_length*45
      matrix_length*45+fracture_length*44
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f46 = [3
      4
      matrix_length*46+fracture_length*45
      matrix_length*46+fracture_length*46 
      matrix_length*46+fracture_length*46
      matrix_length*46+fracture_length*45
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f47 = [3
      4
      matrix_length*47+fracture_length*46
      matrix_length*47+fracture_length*47 
      matrix_length*47+fracture_length*47
      matrix_length*47+fracture_length*46
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f48 = [3
      4
      matrix_length*48+fracture_length*47
      matrix_length*48+fracture_length*48 
      matrix_length*48+fracture_length*48
      matrix_length*48+fracture_length*47
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f49 = [3
      4
      matrix_length*49+fracture_length*48
      matrix_length*49+fracture_length*49 
      matrix_length*49+fracture_length*49
      matrix_length*49+fracture_length*48
      (hr-hf)/2
      (hr-hf)/2
      (hr+hf)/2
      (hr+hf)/2];
f50 = [3
      4
      matrix_length*50+fracture_length*49
      matrix_length*50+fracture_length*50 
      matrix_length*50+fracture_length*50
      matrix_length*50+fracture_length*49
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
gd = [m,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f22,f23,f24,f25,f26,f27,f28,f29,f30,f31,f32,f33,f34,f35,f36,f37,f38,f39,f40,f40,f41,f42,f43,f44,f45,f46,f47,f48,f49,f50,w];
ns = char('m','f1','f2','f3','f4','f5','f6','f7','f8','f9','f10','f11','f12','f13','f14','f15','f16','f17','f18','f19','f20','f21','f22','f23','f24','f25','f26','f27','f28','f29','f30','f31','f32','f33','f34','f35','f36','f37','f38','f39','f40','f41','f42','f43','f44','f45','f46','f47','f48','f49','f50','w');
ns = ns';
sf = '(m-(f1+f2+f3+f4+f5+f6+f7+f8+f9+f10+f11+f12+f13+f14+f15+f16+f17+f18+f19+f20+f21+f22+f23+f24+f25+f26+f27+f28+f29+f30+f31+f32+f33+f34+f35+f36+f37+f38+f39+f40+f41+f42+f43+f44+f45+f46+f47+f48+f49+f50)+(f1+f2+f3+f4+f5+f6+f7+f8+f9+f10+f11+f12+f13+f14+f15+f16+f17+f18+f19+f20+f21+f22+f23+f24+f25+f26+f27+f28+f29+f30+f31+f32+f33+f34+f35+f36+f37+f38+f39+f40+f41+f42+f43+f44+f45+f46+f47+f48+f49+f50))-w';
[g,bt] = decsg(gd,sf,ns);

end
