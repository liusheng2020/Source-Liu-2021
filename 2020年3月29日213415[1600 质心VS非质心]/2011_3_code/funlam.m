function f=funlam(lam,dta)
load skcm.mat;
load sknm.mat;
load dtam.mat;
f=(sqrt(sum(((skc+lam*(skn-skc)).^2)'))').^2-dta^2;