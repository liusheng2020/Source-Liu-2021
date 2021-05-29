function createfigure(ymatrix1)
%CREATEFIGURE(YMATRIX1)
%  YMATRIX1:  bar 矩阵数据

%  由 MATLAB 于 15-Mar-2020 14:20:09 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 使用 bar 的矩阵输入创建多行
bar1 = bar(ymatrix1);
set(bar1(6),'DisplayName','0dB');
set(bar1(5),'DisplayName','5dB');
set(bar1(4),'DisplayName','10dB');
set(bar1(3),'DisplayName','15dB');
set(bar1(2),'DisplayName','20dB');
set(bar1(1),'DisplayName','25dB');

% 创建 ylabel
ylabel('单位：s');

box(axes1,'on');
% 设置其余坐标轴属性
set(axes1,'XTick',[1 2 3 4 5],'XTickLabel',...
    {'Monte carlo-非质心','Monte carlo-质心','The proposed MC-TR-非质心','The proposed MC-TR-质心','2LS'});
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.172523182672718 0.642226591136203 0.0512445088841381 0.268324599840254]);

