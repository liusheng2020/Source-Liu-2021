load coordinates.mat;
%tr·½·¨
tic
x0=[-200;200];
[x4,val,k]=trustmdis(x0);
LocTRdis3(:,kk)=x4;
t=toc;
T4(kk,1)=t;
K4(kk,1)=k;