tic
W=(xigma*cspeed)^(-2)*diag(ones(anchors_n,1));
U=[eye(anchors_n),ones(anchors_n,1)];

cvx_begin sdp  quiet
   cvx_solver sedumi
cvx_precision best
    variable x(2,1);
    variable z(1,1);
    variable h(anchors_n+1,1);
    variable H(anchors_n+1,anchors_n+1);
   
 
     minimize trace(W*(U*H*U'-2*U*h*Di'+Di*Di'));
     subject to
    [H,h;h',1]==semidefinite(anchors_n + 2);
    [eye(2),x;x',z]>=0;
    for gg=1:anchors_n
        H(gg,gg)==[all_nodes.all(:,gg);-1]'*[eye(2),x;x',z]*[all_nodes.all(:,gg);-1]
    end
 cvx_end
 LocSDP_NEW_2013(:,kk)=x;
 t=toc;
 T_2013(kk,kkk)=t;
 