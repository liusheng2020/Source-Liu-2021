function f=funlam(lam,dta)
%load skcm.mat;
S1=load('skcm.mat');
%load sknm.mat;
S2=load('sknm.mat');
%load dtam.mat;
S3=load('dtam.mat');
f=(sqrt(sum(((S1.skc+lam*(S2.skn-S1.skc)).^2)))').^2-S3.dta^2;