load coordinates.mat;
%tr·½·¨
tic
x0=[-600;-600];
[x9,val,k]=trustmdis(x0);
LocTRdis8(:,kk)=x9;
t=toc;
T9(kk,1)=t;
K9(kk,1)=k;