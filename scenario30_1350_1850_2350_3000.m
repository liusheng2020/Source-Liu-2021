all_nodes.all=[400,400;400,-400;-400,400;-400,-400;800,800;800,-800;-800,800;-800,-800;...
    1350,10;1850,10;2350,10;3000,10]';
scatter(all_nodes.all(1,1:8),all_nodes.all(2,1:8),25,'sk','filled')
axis([-1000,3400,-1000,1000])
set(gcf,'Position',[100 100 675 300]);
set(gca,'Position',[.1 .15 .88 .83]);
grid on
hold on
scatter(30,10,20,'xr')
scatter(all_nodes.all(1,9),all_nodes.all(2,9),20,'dr')
scatter(all_nodes.all(1,10),all_nodes.all(2,10),20,'pr')
scatter(all_nodes.all(1,11),all_nodes.all(2,11),20,'*')
scatter(all_nodes.all(1,12),all_nodes.all(2,12),20,'or')




legend('Anchor node','[30,10]','[1350,10]','[1850,10]','[2350,10]','[3000,10]')
%title('Anchor-source deployment used as in [2011,Xu et al]')
ylabel('y: m');
xlabel('x: m');
%% 导出到pdf
%
set(gcf,'Units','Inches');
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
filename = 'fig12-1121'; % 设定导出文件名
print(gcf,filename,'-dpdf','-r0')
close(gcf)
%}