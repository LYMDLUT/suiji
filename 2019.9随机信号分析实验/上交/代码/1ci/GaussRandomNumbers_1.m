function [xr,xi]=GaussRandomNumbers_1(N,Mean,Variance)
for n=1:N
    a=sqrt(2.0*log(rand()));
    b=2*pi*rand();
    xr(n)=Variance*a*cos(b)+Mean;
    xi(n)=Variance*a*sin(b)+Mean;
end