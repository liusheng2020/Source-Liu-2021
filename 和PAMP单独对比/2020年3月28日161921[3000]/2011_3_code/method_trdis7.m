load coordinates.mat;
%tr·½·¨
tic
x0=[-600;600];
[x8,val,k]=trustmdis(x0);
LocTRdis7(:,kk)=x8;
t=toc;
T8(kk,1)=t;
K8(kk,1)=k;