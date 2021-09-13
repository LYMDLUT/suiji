function[s1]=rnd2(mn,a,num)%中心极限累加法,mn表示均值，a表示标准差，num表示数据点数
[s1]=zeros(1,num);
for k=1:12
    x=rand(1,num);
    [s1]=[s1]+x;
end
[s1]=a^2*([s1]-6)+mn