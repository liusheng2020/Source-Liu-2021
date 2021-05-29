load coordinates.mat;
%tr·½·¨
tic
x0=[600;-600];
[x7,val,k]=trustmdis(x0);
LocTRdis6(:,kk)=x7;
t=toc;
T7(kk,1)=t;
K7(kk,1)=k;