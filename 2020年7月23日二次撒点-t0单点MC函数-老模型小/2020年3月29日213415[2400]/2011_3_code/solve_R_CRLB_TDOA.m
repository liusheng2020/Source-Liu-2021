function [out]=solve_R_CRLB_TDOA(xigma)
%Xu, E., Ding, Z., & Dasgupta, S. (2010). Robust and low complexity source localization in wireless sensor networks using time difference of arrival measurement. IEEE Wireless Communications and Networking Conference, WCNC, 1–5. https://doi.org/10.1109/WCNC.2010.5506637
%公式14
load Distreal.mat;
load coordinates.mat;
nodes_n=9;%所有节点数
anchors_n=8;%锚点数
cspeed=3e8;
%out=zeros(8,1);

%for i=1:anchors_n
for i=1:1
    Fisher=zeros(2,2);
    for ks=1:2
        for ls=1:2
            
            %for j=i+1:anchors_n
            for j=setdiff([ 1:8] ,i)
                Fisher(ks,ls)=((2*xigma^2*cspeed^2)^(-1))*...
                    ((all_nodes.all(ks,i)-(all_nodes.all(ks,nodes_n)))/Distreal(i)-...
                    (all_nodes.all(ks,j)-(all_nodes.all(ks,nodes_n)))/Distreal(j))*...
                    ((all_nodes.all(ls,i)-(all_nodes.all(ls,nodes_n)))/Distreal(i)-...
                    (all_nodes.all(ls,j)-(all_nodes.all(ls,nodes_n)))/Distreal(j))+...
                    Fisher(ks,ls);
            end
        end
    end
    
    CRLB=inv(Fisher);
    out(i)=sqrt(sum(diag(CRLB)));
    
end

end








