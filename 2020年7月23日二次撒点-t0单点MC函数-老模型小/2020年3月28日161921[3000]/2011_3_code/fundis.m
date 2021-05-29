function ff=fundis(y)
load coordinates.mat;
load citam.mat;
load Dim.mat;
load anchors_nm.mat;
cspeed=3e8;
a=bsxfun(@minus,all_nodes.all(:,1:anchors_n),y);    %xi-y 2Xanchors_n
b=sqrt(sum(a.^2));%||xi-y|| 1Xanchors_n
c=sqrt(b.^2+cita^2); % sqrt(||xi-y||^2+cita^2) 1Xanchors_n
f=mean(Di-c');
ff=0;
for m=1:anchors_n
    ff=ff+(Di(m,1)-c(1,m)-f)^2;
end
ff=ff;