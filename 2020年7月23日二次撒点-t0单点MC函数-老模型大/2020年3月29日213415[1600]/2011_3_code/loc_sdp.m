 function [Y] = loc_sdp(Ri,disstd)

% anchors_n=3;
% % all_nodes.all=[-0.5,0;-0.5,8;11.5,8;11.5,0;0,0];
% all_nodes.all=[3087275.68645857,19683550.0913056;3087331.14821674,19683085.6729796;3087066.99721065,19683214.1997575;3087239.08929026,19683310.6495869];
Ai=[];
% disstd=0.01;
Ai=all_nodes.all(1:anchors_n,:);
% % anchors_n=size(Ri,2);
% % load Rim.mat
% % enta=6.18*10^-5;
% Y=[]; ys=[]; tao=[]; Q=[]; G=[];
% G=eye(all_nodes.anchors_n)-ones(all_nodes.anchors_n,1)*ones(1,all_nodes.anchors_n)/all_nodes.anchors_n;
% tic
% cvx_solver SeDuMi
% cvx_begin sdp
%     variable Y(2,1);
%     variable ys(1,1);
%     variable tao(all_nodes.anchors_n,1);
%     variable Q(all_nodes.anchors_n,all_nodes.anchors_n) semidefinite;
%     minimize(trace(G'*G*(Q-2*Ri*tao'+Ri*Ri'))+sum(Q(:)));
% %     minimize(trace(G'*G*(Q-2*Ri*tao'+Ri*Ri'))+enta*sum(Q(:)));
%     subject to
%     [Q,tao;tao',1]>=0;
%     [eye(2),Y;Y',ys]>=0;
% for m=1:all_nodes.anchors_n
%         Q(m,m)==[(all_nodes.all(m,:))';-1]'*[eye(2),Y;Y',ys]*[(all_nodes.all(m,:))';-1];
% for mm=m+1:all_nodes.anchors_n
%        Q(m,mm)>=abs([(all_nodes.all(m,:))';-1]'*[eye(2),Y;Y',ys]*[(all_nodes.all(m,:))';-1]);
% end
% end
% cvx_end
% t=toc;
% T3(kk,1)=t;

c=[];C=[];g=[];G=[];xigma=[];
xigma=diag(ones(1,anchors_n)*disstd);
cvx_begin sdp
    variable c(2,1);
    variable g(anchors_n,1);
    variable G(anchors_n,anchors_n) semidefinite;
    variable C(2,2) semidefinite;
    cvx_solver sedumi 
    minimize(trace([G,g;g',1]*[inv(xigma),-inv(xigma)*Ri;-Ri'*inv(xigma),Ri'*inv(xigma)*Ri]));
    subject to
    [G,g;g',1]>=0;
    [C,c;c',1]>=0;
    for m=1:anchors_n
        G(m,m)==trace([C,c;c',1]*[eye(2),-Ai(m,:)';-Ai(m,:),sum(Ai(m,:).^2,2)]);
    end
cvx_end
Y=c;