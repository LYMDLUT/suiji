
function y=GaussRandomNumbers_3(N,Mean,Variance)%�Աຯ��������˹�ֲ�
for j=1:N
    y(j)=0.0;
    for k =1:12
        x(k)=rand();
        y(j)=y(j)+x(k);
    end
end
for j=1:N
    y(j)=Variance*(y(j)-6)+Mean;
end
end


