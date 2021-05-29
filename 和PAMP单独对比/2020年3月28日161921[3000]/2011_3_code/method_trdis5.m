load coordinates.mat;
%tr·½·¨
tic
x0=[600;600];
[x6,val,k]=trustmdis(x0);
LocTRdis5(:,kk)=x6;
t=toc;
T6(kk,1)=t;
K6(kk,1)=k;