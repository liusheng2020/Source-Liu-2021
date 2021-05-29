function square_random(square_L,nodes_n,anchors_n)
% deploy the sensor nodes over a square sensing region
% square_L: the length of the side of a square
% nodes_n: the number of nodes, including anchors and normal nodes
% anchors_n: the number of anchors
%   if anchors_n<1, it means the ratio;
%   if anchors_n>1, it means the number
    if anchors_n<1
  
        anchors_n=round(nodes_n*anchors_n);  % translate the ratio
    end

    all_nodes.square_L=square_L;
    all_nodes.nodes_n=nodes_n;
    all_nodes.anchors_n=anchors_n; 
% 	all_nodes.all=unifrnd(-square_L/2,square_L/2,nodes_n,2); %true coordinates
    %all_nodes.all=[400,400;400,-400;-400,400;-400,-400;800,800;800,-800;-800,800;-800,-800;30,10]';
    %all_nodes.all=[400,400;400,-400;-400,400;-400,-400;800,800;800,-800;-800,800;-800,-800;unifrnd(-square_L/2,square_L/2,1,2)]';
    all_nodes.all=[400,400;400,-400;-400,400;-400,-400;800,800;800,-800;-800,800;-800,-800;1350,10]';
    save coordinates.mat all_nodes;
end
