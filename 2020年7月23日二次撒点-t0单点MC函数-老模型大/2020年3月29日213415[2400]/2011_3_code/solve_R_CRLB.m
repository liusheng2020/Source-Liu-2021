function [R_CRLB_kk_kkk]=solve_R_CRLB(xigma)
% %xigma_vector=[5/3*10^-9:-0.5/3*10^-9:5/3*10^-10]'
% xigma_vector=[1.666666666666667e-09
%      9.372355419839151e-10
%      5.270462766947299e-10
%      2.963799016731538e-10
%      1.666666666666667e-10
%      9.372355419839151e-11]
 load coordinates.mat;
 nodes_n=9;%所有节点数
 anchors_n=8;%锚点数
 cspeed=3e8;

    Fisher=zeros(3,3); 
   for i=1:anchors_n
        Fisher(1,1)=(all_nodes.all(1,i)-all_nodes.all(1,nodes_n))^2/norm(all_nodes.all(:,i)-all_nodes.all(:,nodes_n))^2/(xigma^2*cspeed^2)+Fisher(1,1);
        Fisher(2,2)=(all_nodes.all(2,i)-all_nodes.all(2,nodes_n))^2/norm(all_nodes.all(:,i)-all_nodes.all(:,nodes_n))^2/(xigma^2*cspeed^2)+Fisher(2,2);
        Fisher(1,2)=(all_nodes.all(1,i)-all_nodes.all(1,nodes_n))*(all_nodes.all(2,i)-all_nodes.all(2,nodes_n))/norm(all_nodes.all(:,i)-all_nodes.all(:,nodes_n))^2/(xigma^2*cspeed^2)+Fisher(1,2);
        Fisher(2,1)=Fisher(1,2);
        Fisher(1,3)=(all_nodes.all(1,i)-all_nodes.all(1,nodes_n))/norm(all_nodes.all(:,i)-all_nodes.all(:,nodes_n))/(xigma^2*cspeed)+Fisher(1,3);
        Fisher(3,1)=Fisher(1,3);
        Fisher(2,3)=(all_nodes.all(2,i)-all_nodes.all(2,nodes_n))/norm(all_nodes.all(:,i)-all_nodes.all(:,nodes_n))/(xigma^2*cspeed)+Fisher(2,3);
        Fisher(3,2)=Fisher(2,3);
    end
Fisher(3,3)=anchors_n/xigma^2;
C=inv(Fisher);
R_CRLB_kk_kkk=sqrt(C(1,1)+C(2,2));

 end
