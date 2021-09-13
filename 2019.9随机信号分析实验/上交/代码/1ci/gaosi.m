t=GaussRandomNumbers_3(10000,3,4);   %调用自编的函数产生高斯分布随机数

p=zeros(1,4);   %用实验内容1中相同的方法求出四阶矩和最值
for i =1:10000
       p(1)=p(1)+t(i);
       p(2)=p(2)+t(i)^2;
       p(3)=p(3)+t(i)^3;
       p(4)=p(4)+t(i)^4;
end
p=p/10000;

q=zeros(1,2);
q(1)=t(1);
q(2)=t(1);
for j= 1:10000
    if(q(1)<t(j))
        q(1)=t(j);
    end
    if(q(2)>t(j))
        q(2)=t(j);
    end
end
        



histfit(t,100),title("高斯分布直方图");%w为了更清楚地表示直方图，调用histfit函数，并设置100个区间。
