load coordinates.mat;
%tr·½·¨
tic
x0=[200;-200];
[x3,val,k]=trustmdis(x0);
LocTRdis2(:,kk)=x3;
t=toc;
T3(kk,1)=t;
K3(kk,1)=k;