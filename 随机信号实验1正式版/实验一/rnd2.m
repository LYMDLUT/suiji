function [s]= rnd2(m,a,num);
%% 
% x=rand(1,num);
% y=rand(1,num);
M=1048576;
b=1;
r=2045;
first1=12357;
first2=12359;
x=randuniform(M,b,r,first1,num);
y=randuniform(M,b,r,first2,num);
y1=sqrt((-2)*log(x)).*cos(2*pi*y);
s=a*y1+m;
figure
hist(s,100);
title('变换法高斯');
