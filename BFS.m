clc;
clear all;
C=[2 3 4 7];
A=[2 3 -1 4; 1 2 6 -7];
B=[8;3];
n=size(A,2);
m=size(A,1);

if n>m
    ncm=nchoosek(n,m);
    P=nchoosek(1:n,m);
    s=[];
    for i=1:ncm
        Y=zeros(n,1)
        P(i,:)
        SA=A(:,P(i,:))
        X=inv(SA)*B;
        if all(X>=0 & X~=inf & X~=-inf)
          Y(P(i,:))=X;
           s=[s Y];
        end
    end
    Z=C*s;
    [obj,index]=max(Z);
    bf=s(:,index);
end
