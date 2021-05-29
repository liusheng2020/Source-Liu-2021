load coordinates.mat;
%tr·½·¨
tic
x0=[0;0];
[x1,val,k]=trustmdis(x0);
LocTRdis(:,kk)=x1;
t=toc;
T1(kk,1)=t;
K1(kk,1)=k;





