        y=[]; ys=[]; tao=[]; Q=[]; G=[];
        G=eye(anchors_n)-ones(anchors_n,1)*ones(1,anchors_n)/anchors_n;
        tic
        cvx_begin  sdp quiet
        % cvx_begin  sdp
        cvx_solver SeDuMi
        cvx_precision best
         %cvx_precision high
         %cvx_precision default
         %cvx_precision medium
        %cvx_precision low
       
        variable y(2,1);
        variable ys(1,1)
        variable tao(anchors_n,1);
        variable Q(anchors_n,anchors_n) symmetric
        
        minimize(trace(G'*G*(Q-2*Ri*tao'+Ri*Ri'))+enta*sum(Q(:)));
        %     minimize(trace(G'*G*(Q-2*ti*tao'+ti*ti'))+enta*sum(Q(:)));
        subject to
        %     [Q,tao;tao',1]>=0;
        %     [eye(2),y;y',ys]>=0;
        [Q,tao;tao',1]==semidefinite(anchors_n + 1);
        [eye(2),y;y',ys]==semidefinite(3);
        for m=1:anchors_n
            Q(m,m)==[all_nodes.all(:,m);-1]'*[eye(2),y;y',ys]*[all_nodes.all(:,m);-1];
        end
        for m=1:anchors_n-1
            for mm=m+1:anchors_n-m
            %for mm=m+1:anchors_n
                Q(m,mm)>=abs([all_nodes.all(:,m);-1]'*[eye(2),y;y',ys]*[all_nodes.all(:,mm);-1]);
            end
        end
        cvx_end;
        t=toc;
        Loc2LS(:,kk)=y;
        T_2LS(kk,kkk)=t;