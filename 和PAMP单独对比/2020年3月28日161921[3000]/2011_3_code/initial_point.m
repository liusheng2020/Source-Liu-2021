load coordinates.mat
load Dim.mat
tic
Ai=all_nodes.all(:,1:anchors_n);
A=zeros(anchors_n,5);b=zeros(anchors_n,1);
%A=[-2*Ai',ones(anchors_n,1)];
A=[-2*Ai',2*cspeed^2*ti,-cspeed^2*ones(anchors_n,1),ones(anchors_n,1)];
%A1=zeros(3,1);
A1=zeros(5,1);
for bh=1:anchors_n
    b(bh,:)=Di(bh,1)^2-all_nodes.all(1,bh)^2-all_nodes.all(2,bh)^2;%norm(Ai(:,bh))^2;   
end
AT=A';
A1(:,1)=inv(AT*A)*AT*b;
LocLS(:,kk)=A1(1:2,1);
t=toc;
T1(kk,1)=t;
    
    
    
    