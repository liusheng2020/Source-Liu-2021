
tic
format long e
ym=[];ysm=[];t0m=[];tsm=[];
cvx_begin sdp quiet
    cvx_solver sedumi
cvx_precision best
    variable ym(2,1);
    variable ysm(1,1);
    variable t0m(1,1);
    variable tsm(1,1);
    variable Citam(1,1);

    minimize(Citam);
    subject to
    [1,t0m;t0m,tsm]>=0;
    [eye(2),ym;ym',ysm]>=0;
    for i=1:anchors_n
         tsm-2*Di(i,1)*t0m+Di(i,1)^2-(ysm-2*all_nodes.all(:,i)'*ym+all_nodes.all(:,i)'*all_nodes.all(:,i))<=Citam
       % tsm-2*ti(i,1)*t0m+ti(i,1)^2-(ysm-2*all_nodes.all(:,i)'*ym+all_nodes.all(:,i)'*all_nodes.all(:,i))/cspeed^2<=citam
          tsm-2*Di(i,1)*t0m+Di(i,1)^2-(ysm-2*all_nodes.all(:,i)'*ym+all_nodes.all(:,i)'*all_nodes.all(:,i))>=-Citam
       %tsm-2*ti(i,1)*t0m+ti(i,1)^2-(ysm-2*all_nodes.all(:,i)'*ym+all_nodes.all(:,i)'*all_nodes.all(:,i))/cspeed^2>=-citam
    end
cvx_end
LocMMA(:,kk)=ym;
t=toc;
T_MMA(kk,kkk)=t;