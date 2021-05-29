load coordinates.mat;
% Distreal=zeros(anchors_n,1);%每个未知节点与每个锚点间的真实距离
% Disttest=zeros(anchors_n,1);%每个未知节点与每个锚点间的测量距离
% diserr=zeros(anchors_n,1);
% ti=zeros(anchors_n,1);
% Di=zeros(anchors_n,1);
% diserr=abs(normrnd(0,xigma,anchors_n,1));
% % diserr=[0.0334318483602162,0.155895363150364,0.0611627771915978,0.0149294190297533,0.00294536542990504,0.0204294628368670,0.0236751776945787,0.152923342030388]';

% for i=1:all_nodes.anchors_n                      %未知节点j的纵坐标all_nodes.all(j,2)
% 	Distreal(i,1)=norm(all_nodes.all(:,i)-all_nodes.all(:,nodes_n));       
%     Disttest(i,1)=Distreal(i,1)+diserr(i);%真实值加上测量误差       
%     ti(i,1)=Disttest(i,1)/cspeed+t0;
%     Di(i,1)=Disttest(i,1)+d0;
% end
% 
% save tim.mat ti;
% save Dim.mat Di;
% enta=alfa*mean(Di,1)/cspeed^2;
y=[];ys=[];tao=[];Q=[];G=[];
G=eye(anchors_n)-ones(anchors_n,1)*ones(1,anchors_n)/anchors_n;
cvx_begin sdp
    variable y(2,1);
    variable ys(1,1);
    variable tao(anchors_n,1);
%     variable Q(anchors_n,anchors_n);
    variable Q(anchors_n,anchors_n) semidefinite;
    cvx_solver sedumi
    minimize(trace(G'*G*(Q-2*Di*tao'+Di*Di'))+enta*sum(sum(Q,1),2));
    subject to
    [Q,tao;tao',1]>=0;
    [eye(2),y;y',ys]>=0;
    for m=1:anchors_n
        Q(m,m)==[all_nodes.all(:,m);-1]'*[eye(2),y;y',ys]*[all_nodes.all(:,m);-1];
        for mm=m+1:anchors_n
            Q(m,mm)>=abs([all_nodes.all(:,m);-1]'*[eye(2),y;y',ys]*[all_nodes.all(:,mm);-1]);
        end
    end
cvx_end
LocSDP(:,kk)=y;






%SDR方法
% enta=alfa*mean(ti,1)
% y=[];ys=[];tao=[];Q=[];
% G=eye(anchors_n)-ones(anchors_n,1)*ones(1,anchors_n);
% cvx_begin sdp
%     variable y(2,1);
%     variable ys(1,1);
%     variable tao(anchors_n,1);
%     % variable Q(anchors_n,anchors_n);
%     variable Q(anchors_n,anchors_n) semidefinite;
%     cvx_solver sedumi
%     minimize(trace(G'*G*(Q-2*ti*tao'+ti*ti'))+enta*sum(sum(Q,1),2));
% % minimize(trace(G'*G*(Q-2*ti*tao'+ti*ti'))+enta*(sum((sum(Q))')));
%     subject to
%     [Q,tao;tao',1]>=0;
%     [eye(2),y;y',ys]>=0;
%     for m=1:anchors_n
%         Q(m,m)==[all_nodes.all(:,m);-1]'*[eye(2),y;y',ys]*[all_nodes.all(:,m);-1]/cspeed^2;
%         for mm=m+1:anchors_n
%             Q(m,mm)>=abs([all_nodes.all(:,m);-1]'*[eye(2),y;y',ys]*[all_nodes.all(:,mm);-1])/cspeed^2;
%         end
%     end
% cvx_end
% y
% tao
% ys
% LocSDP(:,kk)=y;

%tr方法
% x0=[0;0];
% [x1,val,k]=trustm(x0);
% LocTR(:,kk)=x1;
% 
% %tr方法
% x0=[0;0];
% [x3,val,k]=trustmdis(x0);
% LocTRdis(:,kk)=x3;




% %方法4 SDR
% c=[];C=[];g=[];G=[];xigma=[];
% xigma=diag(ones(1,anchors_n)*disstd);
% 
% cvx_begin sdp
% 
%     variable c(2,1);
%     variable g(anchors_n,1);
%     variable G(anchors_n,anchors_n) semidefinite;
%     variable C(2,2) semidefinite;
%     cvx_solver sedumi 
%     minimize(trace([G,g;g',1]*[inv(xigma),-inv(xigma)*Ri;-Ri'*inv(xigma),Ri'*inv(xigma)*Ri]));
%     subject to
%     [G,g;g',1]>=0;
%     [C,c;c',1]>=0;
%     for m=1:anchors_n
%         G(m,m)==trace([C,c;c',1]*[eye(2),-Ai(m,:)';-Ai(m,:),sum(Ai(m,:).^2,2)]);
%     end
% cvx_end
% LocSDR(kk,:)=c';

% load timsdr.mat;
% T4(kk,1)=runtime;

