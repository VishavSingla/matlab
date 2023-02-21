clc
clear all;
c=[3 2];
A=[2 4;3 5];
b=[8;15];
x1=0:1:max(b)
x21=(b(1)-A(1,1)*x1)/A(1,2)
x22=(b(2)-A(2,1)*x1)/A(2,2)
%plot(x1,x21,x1,x22)
x21=max(0,x21)
x22=max(0,x22)
plot(x1,x21,x1,x22)

c1=find(x1==0)
c2=find(x21==0)
Line1=[x1([c2 c1]);x21([c2 c1])]'
c3=find(x22==0)
Line2=[x1([c3 c1]);x22([c3 c1])]'
corpt=unique([Line1;Line2],'rows')

% To find the point of intersection

pt=[0;0];
for i=1:size(A,1)
    a1=A(i,:)
    b1=b(i,:)
    for j=i+1:size(A,1)
        a2=A(j,:)
        b2=b(j,:)
        a4=[a1;a2]
        b4=[b1;b2]
        X=a4\b4
        pt=[pt X]
    
    end
end
    % Write all corner points
    ptt=pt'
    allpt=[ptt;corpt];
    points=unique(allpt,'rows')
%     feasible region
for i=1:size(points,1)
    const1(i)=A(1,1)*points(i,1)+A(1,2)*points(i,2)-b(1)
    const2(i)=A(2,1)*points(i,1)+A(2,2)*points(i,2)-b(2)
end
s1=find(const1<0)
s2=find(const2<0)
S=unique([s1 s2])
points(S,:)=[]
%s3=find(points(:,1),0)
%s4=find(points(:,2),0)
%points(s3,:)=[]
%points(s4,:)=[]
% objective value and points
value=points*c'
[obj,index]=min(value)
X1=points(index,1)
X2=points(index,2)
fprintf('Objective value is %f at(%f,%f)',obj,X1,X2);