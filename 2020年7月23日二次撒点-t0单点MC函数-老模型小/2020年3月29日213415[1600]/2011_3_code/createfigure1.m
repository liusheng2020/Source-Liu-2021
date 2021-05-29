function createfigure1(X1, Y1, S1, C1, X2, Y2, C2, X3, Y3, S2, C3, X4, Y4, S3, X5, Y5, C4, X6, Y6, C5, X7, Y7, C6, X8, Y8, X9, Y9, X10, Y10, X11, Y11)
%CREATEFIGURE1(X1, Y1, S1, C1, X2, Y2, C2, X3, Y3, S2, C3, X4, Y4, S3, X5, Y5, C4, X6, Y6, C5, X7, Y7, C6, X8, Y8, X9, Y9, X10, Y10, X11, Y11)
%  X1:  scatter x
%  Y1:  scatter y
%  S1:  scatter s
%  C1:  scatter c
%  X2:  scatter x
%  Y2:  scatter y
%  C2:  scatter c
%  X3:  scatter x
%  Y3:  scatter y
%  S2:  scatter s
%  C3:  scatter c
%  X4:  scatter x
%  Y4:  scatter y
%  S3:  scatter s
%  X5:  scatter x
%  Y5:  scatter y
%  C4:  scatter c
%  X6:  scatter x
%  Y6:  scatter y
%  C5:  scatter c
%  X7:  scatter x
%  Y7:  scatter y
%  C6:  scatter c
%  X8:  scatter x
%  Y8:  scatter y
%  X9:  scatter x
%  Y9:  scatter y
%  X10:  scatter x
%  Y10:  scatter y
%  X11:  scatter x
%  Y11:  scatter y

%  由 MATLAB 于 13-May-2021 21:59:17 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 scatter
scatter(X1,Y1,S1,C1,'DisplayName','Anchor node','MarkerFaceColor','flat',...
    'MarkerEdgeColor','none',...
    'Marker','square');

% 创建 scatter
scatter(X2,Y2,X2,C2,'DisplayName','Source node');

% 创建 scatter
scatter(X3,Y3,S2,C3,'DisplayName','Monte carlo node',...
    'MarkerFaceColor','flat',...
    'MarkerEdgeColor','none');

% 创建 scatter
scatter(X4,Y4,S3,C2,'DisplayName','1','MarkerFaceColor','flat',...
    'MarkerEdgeColor','none');

% 创建 scatter
scatter(X5,Y5,S3,C4,'DisplayName','2','MarkerFaceColor','flat',...
    'MarkerEdgeColor','none');

% 创建 scatter
scatter(X6,Y6,S3,C5,'DisplayName','3','MarkerFaceColor','flat',...
    'MarkerEdgeColor','none');

% 创建 scatter
scatter(X7,Y7,S3,C6,'DisplayName','4','MarkerFaceColor','flat',...
    'MarkerEdgeColor','none');

% 创建 scatter
scatter(X8,Y8,S3,C1,'DisplayName','5','MarkerFaceColor','flat',...
    'MarkerEdgeColor','none');

% 创建 scatter
scatter(X9,Y9,S3,C3,'DisplayName','6及以上','MarkerFaceColor','flat',...
    'MarkerEdgeColor','none');

% 创建 scatter
scatter(X10,Y10,S3,C3,'MarkerFaceColor','flat','MarkerEdgeColor','none');

% 创建 scatter
scatter(X11,Y11,S3,C3,'MarkerFaceColor','flat','MarkerEdgeColor','none');

% 创建 xlabel
xlabel('m');

% 创建 ylabel
ylabel('m');

grid(axes1,'on');
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.148588414799217 0.343540728685768 0.236749111710926 0.356807501663065]);

