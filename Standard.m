clc
clear all
C=[1 2 3];
A=[2 3 1; -1 -4 1; -1 2 -3];
B=[4;3;7];
sign=[0 0 1];
S=eye(size(A,1));
P=find(sign>0)
S(P,:)=-S(P,:);
mat=[A S B]


