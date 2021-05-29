function He=Hessdis(y)
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
f=mean(Di'-c(1,:),2);
I=eye(2);
p=[0 0;0 0];
for m=1:anchors_n
    p=p+(a(:,m)*a(:,m)'-c(1,m)^2*I)/c(1,m)^3;
end
pmean=p/anchors_n;
h1=[0 0;0 0];
h2=[0 0;0 0];
for m=1:anchors_n
    g=d(:,m)-e;
    h1=h1+g*g';
    h2=h2+(Di(m,1)-c(1,m)-f)*((a(:,m)*a(:,m)'-c(1,m)^2*I)/c(1,m)^3-pmean);
end
He=2*(h1+h2);
% 
% 
% I=eye(2);
% c=bsxfun(@minus,x',Ai);%x-A
% b=sqrt(sum((c.^2)'))';%||x-A||
% [m,n]=size(c);g=[0 0;0 0];
% % cita=disstd/10;
% % cita=disstd;
% h=sqrt(b.^2+cita^2);
% 
% for k=1:m
%     d=c(k,:)'*c(k,:);
%     e=d/h(k,1)^2;
%     f=Ri-h;
%     g=g+e-f(k,1)/(h(k,1)^3)*(I*h(k,1)^2-d);
% end
% He=2*g;
