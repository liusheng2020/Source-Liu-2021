function ff=fun(y)
load coordinates.mat;
load citam.mat;
load tim.mat;
load anchors_nm.mat;
cspeed=3e8;
%y=[30;11]
a=bsxfun(@minus,all_nodes.all(:,1:anchors_n),y);    %xi-y 2Xanchors_n
b=sqrt(sum(a.^2));%||xi-y|| 1*anchors_n
c=sqrt(b.^2+cita^2); % sqrt(||xi-y||^2+cita^2) 1Xanchors_n
f=mean(ti-c'/cspeed);
ff=0;
for m=1:anchors_n
    ff=ff+(ti(m,1)-c(1,m)/cspeed-f)^2;
end