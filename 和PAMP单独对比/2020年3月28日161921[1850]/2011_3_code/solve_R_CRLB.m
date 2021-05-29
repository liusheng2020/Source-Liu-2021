% %xigma_vector=[5/3*10^-9:-0.5/3*10^-9:5/3*10^-10]'
% xigma_vector=[1.666666666666667e-09
%      9.372355419839151e-10
%      5.270462766947299e-10
%      2.963799016731538e-10
%      1.666666666666667e-10
%      9.372355419839151e-11]
% load coordinates.mat;
% nodes_n=9;%所有节点数
% anchors_n=8;%锚点数
% cspeed=3e8;
R_CRLB=zeros(length(xigma_vector),1);
 for ii=1:length(xigma_vector)
     Crlb=zeros(3,3);C=[];    
   for i=1:anchors_n
        Crlb(1,1)=(all_nodes.all(1,i)-all_nodes.all(1,nodes_n))^2/norm(all_nodes.all(:,i)-all_nodes.all(:,nodes_n))^2/(xigma_vector(ii)^2*cspeed^2)+Crlb(1,1);
        Crlb(2,2)=(all_nodes.all(2,i)-all_nodes.all(2,nodes_n))^2/norm(all_nodes.all(:,i)-all_nodes.all(:,nodes_n))^2/(xigma_vector(ii)^2*cspeed^2)+Crlb(2,2);
        Crlb(1,2)=(all_nodes.all(1,i)-all_nodes.all(1,nodes_n))*(all_nodes.all(2,i)-all_nodes.all(2,nodes_n))/norm(all_nodes.all(:,i)-all_nodes.all(:,nodes_n))^2/(xigma_vector(ii)^2*cspeed^2)+Crlb(1,2);
        Crlb(2,1)=Crlb(1,2);
        Crlb(1,3)=(all_nodes.all(1,i)-all_nodes.all(1,nodes_n))/norm(all_nodes.all(:,i)-all_nodes.all(:,nodes_n))/(xigma_vector(ii)^2*cspeed)+Crlb(1,3);
        Crlb(3,1)=Crlb(1,3);
        Crlb(2,3)=(all_nodes.all(2,i)-all_nodes.all(2,nodes_n))/norm(all_nodes.all(:,i)-all_nodes.all(:,nodes_n))/(xigma_vector(ii)^2*cspeed)+Crlb(2,3);
        Crlb(3,2)=Crlb(2,3);
    end
Crlb(3,3)=anchors_n/xigma_vector(ii)^2;
C=inv(Crlb);
CRLB=C(1,1)+C(2,2);
R_CRLB(ii)=CRLB^(1/2);

 end
