function [x,t]=TDOA2005(Kn2)
%Kn2=diag(all_nodes.all(:,1:8)'*all_nodes.all(:,1:8));
tic
load Distreal.mat;
load coordinates.mat;
load Dim;

nodes_n=9;%所有节点数
anchors_n=8;%锚点数
cspeed=3e8;



c=zeros(7,1);
d=zeros(7,1);
H=zeros(7,2);
 for i=1:all_nodes.anchors_n-1
     c(i)=-(Di(i+1)-Di(1));
     H(i,:)=[all_nodes.all(:,i+1)-all_nodes.all(:,1)]';
     d(i)=1/2*(Kn2(i+1)-Kn2(1)-c(i)^2);
 end
syms  r1 xm ym
%H*[xm;ym]+Dn1*r1-d
x=inv((H'*H))*H'*(r1*c+d);
r1=solve((x-all_nodes.all(:,1))'*(x-all_nodes.all(:,1))-r1^2,r1);
r1=double(r1);
r1_max=max(r1);
r1_min=min(r1);
if r1_min>=0
    sound(sin(2*pi*8*(1:1000)/100));
end
r1_true=r1_max;
%r1=r1_true
%x=double(x)
x=double(subs(x, r1_true));
%loc_true=all_nodes.all(:,9)
 t=toc;
end


