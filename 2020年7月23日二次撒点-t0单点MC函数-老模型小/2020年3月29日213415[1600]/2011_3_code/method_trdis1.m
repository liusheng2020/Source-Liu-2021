load coordinates.mat;
%tr·½·¨
tic
x0=[200;200];
[x2,val,k]=trustmdis(x0);
LocTRdis1=x2;
t=toc;
% T2(kk,1)=t;
% K2(kk,1)=k;