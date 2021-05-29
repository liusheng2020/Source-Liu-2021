clc
clear all
close all
 
x = 0;  % 初始数据
y = 0;  % 初始数据
figure(1)

plot(x,y,'^r');
%axis([0,10,0,10])
grid on
%hold on    % 若之前的图像不想保留，则把hold on注释掉
xlabel('x');
ylabel('y');
for i=1:10
    x = x + 1;   % 更新后数据
    y = y + 1;   % 更新后数据
    plot(x, y, '^r');
    axis([0,10,0,10])
    grid on
    %hold on    % 若之前的图像不想保留，则把hold on注释掉
    pause(0.5);
end