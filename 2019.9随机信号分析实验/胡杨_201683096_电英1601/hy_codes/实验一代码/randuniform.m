
function s=randuniform(M,b,r,first,num)%����num��
s=zeros(1,num);%���ɾ�ֵΪ���һά������
s(1)=first;%�����ֵ,����,first=12357
for i=2:num
    s(i)=mod(s(i-1)*r+b,M);%���ͬ�෨���������
end
s=s/M;%Ϊʲô���ﲻֱ��дs=s(i)��%������������ά�ȡ�
%s=s(i)




