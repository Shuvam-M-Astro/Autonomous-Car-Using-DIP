clc
clear all;
a1 =[13,21,20;12,23,10;7,22,5;5,20,18;6,15,13;10,13,22;5,17,14;13,17,18];
a2 =[11.4642,54.2322;3.0492,48.0348;7.3656,24.2946;16.4934,14.3946;41.8176,17.4438;53.0046,39.7782;31.0464,12.7512;30.7494,55.2222];
[M,N]=size(a1);
[M1,N1]=size(a2);
i=1;
j=1;
while (i<=15&&j<=8)
l(i,1) = a1(j,1);
l(i,2) = a1(j,2);
l(i,3) = a1(j,3);
l(i,4) = 1;
l(i,5) = 0;
l(i,6) = 0;
l(i,7) = 0;
l(i,8) = 0;
l(i,9) = -a2(j,1)*a1(j,1);
l(i,10) = -a2(j,1)*a1(j,2);
l(i,11) = -a2(j,1)*a1(j,3);
l(i+1,1) = 0;
l(i+1,2) = 0;
l(i+1,3) = 0;
l(i+1,4) = 0;
l(i+1,5) = a1(j,1);
l(i+1,6) = a1(j,2);
l(i+1,7) = a1(j,3);
l(i+1,8) = 1;
l(i+1,9) = -a2(j,2)*a1(j,1);
l(i+1,10) = -a2(j,2)*a1(j,2);
l(i+1,11) = -a2(j,2)*a1(j,3);
i=i+2;
j=j+1;
endwhile
b =[11.4642;54.2322;3.0492;48.0348;7.3656;24.2946;16.4934;14.3946;41.8176;17.4438;53.0046;39.7782;31.0464;12.7512;30.7494;55.2222];
x = l\b;
x1 =[13,21,20;12,23,10;7,22,5;5,20,18;6,15,13;10,13,22;5,17,14;13,17,18];
for i=1:8
R(i) = x(9,1)*x1(i,1) + x(10,1)*x1(i,2) +x(11,1)*x1(i,3) + 1;
endfor
U0 = 29.9376;
V0 = 39.9168;
for i=1:8
E1(i) = a2(i,1) - U0;
N2(i) = a2(i,2) - V0;
r(i) = E1(i).^(2) + N2(i).^(2);
endfor
i=1;
j=1;
while (i<=15&&j<=8)
l(i,1) = a1(j,1);
l(i,2) = a1(j,2);
l(i,3) = a1(j,3);
l(i,4) = 1;
l(i,5) = 0;
l(i,6) = 0;
l(i,7) = 0;
l(i,8) = 0;
l(i,9) = -a2(j,1).*a1(j,1);
l(i,10) = -a2(j,1).*a1(j,2);
l(i,11) = -a2(j,1).*a1(j,3);
l(i,12) = E1(1,j).*r(1,j).*R(1,j);
c = r(1,j).^(2);
l(i,13) = E1(1,j).*R(1,j).*c;
d = r(1,j).^(3);
l(i,14) = E1(1,j).*R(1,j).*d;
e = [E1(1,j).^(2)].*2;
f = r(1,j);
l(i,15) = R(1,j).*[f+e];
l(i,16) = E1(1,j).*N2(1,j).*R(1,j);
l(i+1,1) = 0;
l(i+1,2) = 0;
l(i+1,3) = 0;
l(i+1,4) = 0;
l(i+1,5) = a1(j,1);
l(i+1,6) = a1(j,2);
l(i+1,7) = a1(j,3);
l(i+1,8) = 1;
l(i+1,9) = -a2(j,2).*a1(j,1);
l(i+1,10) = -a2(j,2).*a1(j,2);
l(i+1,11) = -a2(j,2).*a1(j,3);
l(i+1,12) = N2(1,j).*r(1,j).*R(1,j);
h = r(1,j).^(2);
l(i+1,13) = N2(1,j).*R(1,j).*h;
k = r(1,j).^(3);
l(i+1,14) = N2(1,j).*R(1,j).*k;
l(i+1,15) = E1(1,j).*N2(1,j).*R(1,j);
m = r(1,j);
n = [N2(1,j).^(2)].*2;
l(i+1,16) = R(1,j).*[m+n];
i=i+2;
j=j+1;
endwhile
x2 = l\b; % value of DLT parameters for the first camera
% finding DLT parameters for the second camera
a1 =[13,21,20;12,23,10;7,22,5;5,20,18;6,15,13;10,13,22;5,17,14;13,17,18];
a3 =[9.9,59.4;4.158,29.7;7.7022,33.66;14.9292,13.8996;46.6092,15.5826;48.1932,39.6;31.68,11.385;10.7514,48.9456];
i=1;
j=1;
while (i<=15&&j<=8)
  l1(i,1) = a1(j,1);
  l1(i,2) = a1(j,2);
  l1(i,3) = a1(j,3);
  l1(i,4) = 1;
  l1(i,5) = 0;
  l1(i,6) = 0;
  l1(i,7) = 0;
  l1(i,8) = 0;
  l1(i,9) = -a3(j,1)*a1(j,1);
  l1(i,10) = -a3(j,1)*a1(j,2);
  l1(i,11) = -a3(j,1)*a1(j,3);
  l1(i+1,1) = 0;
  l1(i+1,2) = 0;
  l1(i+1,3) = 0;
  l1(i+1,4) = 0;
  l1(i+1,5) = a1(j,1);
  l1(i+1,6) = a1(j,2);
  l1(i+1,7) = a1(j,3);
  l1(i+1,8) = 1;
  l1(i+1,9) = -a3(j,2)*a1(j,1);
  l1(i+1,10) = -a3(j,2)*a1(j,2);
  l1(i+1,11) = -a3(j,2)*a1(j,3);
  i=i+2;
  j=j+1;
  
  

  
  
endwhile
b =[9.9;59.4;4.158;29.7;7.7022;33.66;14.9292;13.8996;46.6092;15.5826;48.1932;39.6;31.68;11.385;10.7514;48.9456];
x = l1\b;
x1 =[13,21,20;12,23,10;7,22,5;5,20,18;6,15,13;10,13,22;5,17,14;13,17,18];
for i=1:8
R1(i) = x(9,1)*x1(i,1) + x(10,1)*x1(i,2) +x(11,1)*x1(i,3) + 1;
endfor
U0 = 29.9376;
V0 = 39.9168;
for i=1:8
E2(i) = a2(i,1) - U0;
N3(i) = a2(i,2) - V0;
r1(i) = E1(i).^(2) + N2(i).^(2);
endfor
i=1;
j=1;
while (i<=15&&j<=8)
l1(i,1) = a1(j,1);
l1(i,2) = a1(j,2);
l1(i,3) = a1(j,3);
l1(i,4) = 1;
l1(i,5) = 0;
l1(i,6) = 0;
l1(i,7) = 0;
l1(i,8) = 0;
l1(i,9) = -a3(j,1).*a1(j,1);
l1(i,10) = -a3(j,1).*a1(j,2);
l1(i,11) = -a3(j,1).*a1(j,3);
l1(i,12) = E2(1,j).*r1(1,j).*R1(1,j);
c = r1(1,j).^(2);
l1(i,13) = E2(1,j).*R1(1,j).*c;
d = r1(1,j).^(3);
l1(i,14) = E2(1,j).*R1(1,j).*d;
e = [E2(1,j).^(2)].*2;
f = r1(1,j);
l1(i,15) = R1(1,j).*[f+e];
l1(i,16) = E2(1,j).*N3(1,j).*R1(1,j);
l1(i+1,1) = 0;
l1(i+1,2) = 0;
l1(i+1,3) = 0;
l1(i+1,4) = 0;
l1(i+1,5) = a1(j,1);
l1(i+1,6) = a1(j,2);
l1(i+1,7) = a1(j,3);
l1(i+1,8) = 1;
l1(i+1,9) = -a3(j,2).*a1(j,1);
l1(i+1,10) = -a3(j,2).*a1(j,2);
l1(i+1,11) = -a3(j,2).*a1(j,3);
l1(i+1,12) = N3(1,j).*r1(1,j).*R1(1,j);
h = r1(1,j).^(2);
l1(i+1,13) = N3(1,j).*R1(1,j).*h;
k = r1(1,j).^(3);
l1(i+1,14) = N3(1,j).*R1(1,j).*k;
l1(i+1,15) = E2(1,j).*N3(1,j).*R1(1,j);
m = r1(1,j);
n = [N3(1,j).^(2)].*2;
l1(i+1,16) = R1(1,j).*[m+n];
i=i+2;
j=j+1;
endwhile
x3 = l1\b; %DLT value for the second camera
E3 = -28.8648;
N4 = -12.276;
r2 = E3^2 + N4^2;
p = [(x2(12,1)*r2+[r2^2]*x2(13,1)+x2(14,1)*(r2)^6)];
q = [r2+[E3.^2].*2];
delta_u1_1 = p.*E3 + q.*x2(15,1)+[E3.*N4].*x2(16,1)
w = [r2+[N4.^2].*2];
delta_v1_1 = p.*N4+ w.*x2(16,1)+[E3.*N4].*x2(15,1)
E4 = -28.7262;
N5 = -10.2168;
r3 = E4^2 + N5^2;
s = [(x3(12,1)*r3+
[r3^2]*x3(13,1)+x3(14,1)*(r3)^6)];
t = [r2+[E4.^2].*2];
delta_u1_2 = s.*E4 + t.*x3(15,1)+[E4.*N5].*x3(16,1)
y = [r2+[N5.^2].*2];
delta_v1_2 = p.*N5+ w.*x3(16,1)+[E4.*N5].*x3(15,1)
u = 1.1088-delta_u1_1;
v = 27.6408-delta_v1_1;
u1 = 1.2474-delta_u1_2;
v1 = 29.7 - delta_v1_2;
x4 = [u.*x2(9,1)-x2(1,1),u*x2(10,1)-x2(2,1),u.*x2(11,1)-x2(3,1);v.*x2(9,1)-x2(5,1),v*x2(10,1)-x2(6,1),v.*x2(11,1)-x2(7,1);u1.*x3(9,1)-x3(1,1),u1*x3(10,1)-x3(2,1),u1.*x3(11,1)-x3(3,1);v1.*x3(9,1)-x3(5,1),v1*x3(10,1)-x3(6,1),v1.*x3(11,1)-x3(7,1)];
bb =[x2(4,1)-u;x2(8,1)-v;x3(4,1)-u1;x3(8,1)-v1];
xx = x4\bb
