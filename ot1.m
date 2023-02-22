clc
clear all

C=[3 2];
A=[2 4; 3 5];
B=[8;15];

% A(1,1)*x1 + A(1,2)*x21 = B(1);
% A(2,1)*x1 + A(2,2)*x22 = B(2);

x1 = 0:1:max(B);
x21 = (B(1)-A(1,1)*x1)/A(1,2);
x22 = (B(2)-A(2,1)*x1)/A(2,2);

x21 = max(0,x21);
x22 = max(0,x22);

%plot(x1,x21,x1,x22)

c1 = find(x1==0)
c2 = find(x21==0)
Line1=[x1([c2 c1]); x21([c2 c1])]'
c3 = find(x22==0)
Line2=[x1([c3 c1]); x22([c3 c1])]'
corpt=unique([Line1;Line2],'rows')
pt=[0;0];
for i=1:size(A,1)
    A1=A(i,:)
    B1=B(i,:)
    for j=i+1:size(A,1)
        A2=A(j,:)
        B2=B(j,:)
        A4=[A1;A2]
        B4=[B1;B2]
        X=A4\B4
        pt=[pt X]
    end
end
ptt=pt'
allpt=unique([corpt;ptt],'rows')

for i=1:size(allpt,1)
    const1(i)=A(1,1)*allpt(i,1)+A(1,2)*allpt(i,2)-B(1)
    const2(i)=A(2,1)*allpt(i,1)+A(2,2)*allpt(i,2)-B(2)
end

s1=find(const1>0)
s2=find(const2>0)
S=unique([s1 s2])
allpt(S,:)=[]

value=allpt*C'

[obj,index]=max(value)
X1=allpt(index,1)
X2=allpt(index,2)

fprintf('Objective value is %f at (%f,%f)',obj,X1,X2);
