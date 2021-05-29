load coordinates.mat;
%tr·½·¨
tic
x0=[-200;-200];
[x5,val,k]=trustmdis(x0);
LocTRdis4(:,kk)=x5;
t=toc;
T5(kk,1)=t;
K5(kk,1)=k;