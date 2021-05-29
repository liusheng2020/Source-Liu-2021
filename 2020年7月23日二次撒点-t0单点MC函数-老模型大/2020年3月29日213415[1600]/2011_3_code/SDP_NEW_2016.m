
tic

u=[]; ys=[]; d=[]; D=[];
Q=(xigma*cspeed)^(-2)*diag(ones(anchors_n,1));
k_2016=1/(8*(xigma*cspeed)^(-2));
G=(eye(anchors_n)-k_2016*ones(anchors_n,1)*ones(anchors_n,1)'*Q)'*(Q)*(eye(anchors_n)-k_2016*ones(anchors_n,1)*ones(anchors_n,1)'*Q);
% G=(eye(anchors_n)-1/anchors_n*1/sum(1/diserr.^2)*ones(anchors_n,1)*ones(anchors_n,1)'*Q)'*Q*(eye(anchors_n)-1/anchors_n*1/sum(1/diserr.^2)*ones(anchors_n,1)*ones(anchors_n,1)'*Q);

% G=(eye(anchors_n)-1/sum(1/diserr.^2)*ones(anchors_n,1)*ones(anchors_n,1)'*Q)'*Q*(eye(anchors_n)-1/sum(1/diserr.^2)*ones(anchors_n,1)*ones(anchors_n,1)'*Q);
% cvx_solver sedumi
cvx_begin SDP quiet
 cvx_solver sedumi
cvx_precision best

    variable u(2,1);
    variable ys(1,1);
    variable d(anchors_n,1);
    variable D(anchors_n,anchors_n) symmetric;
%     minimize(trace(D*G)-2*d'*G*Ri+*trace(D));
    minimize(trace(D*G)-2*Di'*G*d+yita*trace(D));
    subject to
%     [1,d';d,D]>=0;
%     [eye(2),u;u',ys]>=0;
    [1,d';d,D]==semidefinite(anchors_n+1);
    [eye(2),u;u',ys]==semidefinite(3);
    for m=1:anchors_n
            D(m,m)==(ys-2*all_nodes.all(:,m)'*u+all_nodes.all(:,m)'*all_nodes.all(:,m));
%             D(m,m)==(ys-2*u'*all_nodes.all(:,m)+all_nodes.all(:,m)'*all_nodes.all(:,m));
            norm(u-all_nodes.all(:,m))<=d(m);
        for mm=m+1:anchors_n
            D(m,mm)>=abs(ys-u'*(all_nodes.all(:,m)+all_nodes.all(:,mm))+all_nodes.all(:,m)'*all_nodes.all(:,mm));
        end
    end
cvx_end
LocSDP_NEW_2016(:,kk)=u;
t=toc;
T_2016(kk,kkk)=t;
