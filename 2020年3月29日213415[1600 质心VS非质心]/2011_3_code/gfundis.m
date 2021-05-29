function gf=gfundis(y)
load coordinates.mat;
load citam.mat;
load Dim.mat;
load anchors_nm.mat;
cspeed=3e8;
a=bsxfun(@minus,all_nodes.all(:,1:anchors_n),y);    %xi-y 2Xanchors_n
b=sqrt(sum(a.^2));%||xi-y|| 1Xanchors_n
c=sqrt(b.^2+cita^2); % sqrt(||xi-y||^2+cita^2) 1Xanchors_n
d=bsxfun(@rdivide,a,c);%(xi-y)/sqrt(||xi-y||^2+cita^2) 2Xanchors_n
e=sum(d,2)/(anchors_n);%2X1
f=mean(Di-c');
gf=[0;0];
for m=1:anchors_n
    gf=gf+(Di(m,1)-c(1,m)-f)*(d(:,m)-e);
end
gf=gf*2;





% c=bsxfun(@minus,x',Ai);%x-Ai
% %gf=sum((4*((sqrt(sum((c.^2)'))').^2-Ri).*c)',2);%bsxfun(@times,a,b)
% b=sqrt(sum((c.^2)'))';%得到一个列向量||x-Ai||
% % cita=disstd/10;
% % cita=disstd;
% f=sqrt(b.^2+cita^2);
% d=bsxfun(@times,(Ri-f),c);%(Ri-||x-ai||)*(x-ai)
% 
% e=bsxfun(@rdivide,d,f);%3X2
% 1./b;
% gf=sum(-2*e)';   %1X2
