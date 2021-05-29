all_nodes.all=[400,400;400,-400;-400,400;-400,-400;800,800;800,-800;-800,800;-800,-800;30,10]';
scatter(all_nodes.all(1,1:8),all_nodes.all(2,1:8),25,'k','filled')
axis([-1000,3700,-1000,1000])
grid on
hold on
scatter(all_nodes.all(1,9),all_nodes.all(2,9),25,'r')
scatter(test_m(1,:),test_m(2,:),8,'b','filled')
scatter(Loc_Monte_carlo(1,1:200),Loc_Monte_carlo(2,1:200),10,'r','*')
legend('Anchor node','Source node')
title('Anchor-source deployment used as in [2011,Xu et al]')
ylabel('单位：m');
xlabel('单位：m');

