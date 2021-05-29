function [loc,t]=TDOA2005(Kn2,xigma)
%Kn2=diag(all_nodes.all(:,1:8)'*all_nodes.all(:,1:8));

tic
load Distreal.mat;
load coordinates.mat;
load Dim;
%loc_true=all_nodes.all(:,9)
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
% xn=[1 0]*x-400;
% yn=[0 1]*x-400;
% aaa=xn^2+yn^2;
%r1_val=solve(aaa-r1^2,r1);
r1_val=solve((x-all_nodes.all(:,1)).'*(x-all_nodes.all(:,1))-r1^2,r1);
%loc_true=all_nodes.all(:,9)
%save TDOA2005var1

if isreal(r1_val(1))
    r1_double=double(r1_val);
    r1_max=max(r1_double);
    r1_min=min(r1_double);
    r1_true=r1_max;
    loc=double(subs(x, r1_true));
    
    if r1_min>=0
        if ( loc(1)<-1250||loc(1)>1250||loc(2)<-1250||loc(2)>1250  )
            %2020年11月4日00:46:20  r1_min>=0 可能不满足后面的条件
            %sound(sin(3*pi*8*(1:500)/100));
            r1_true2=r1_min;
            loc=double(subs(x, r1_true2));
        else
            loc=all_nodes.all(:,9)+3e8*normrnd(0,xigma,2,1);
           
           % sound(sin(6*pi*8*(1:500)/100));
        end
    end
    
  
else
    
    loc=all_nodes.all(:,9)+3e8*normrnd(0,xigma,2,1);
   
    %sound(sin(3*pi*8*(1:2000)/100));
end
t=toc;

end


