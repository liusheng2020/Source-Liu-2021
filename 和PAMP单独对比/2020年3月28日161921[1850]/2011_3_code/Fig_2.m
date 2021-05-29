clear all;
close all;
clc;%%%%%%%%%%%%%%%%%%%%%
S=[ 10 10 -10 -10 ; 10 -10 10 -10  ];%传感器坐标的观测
M=size(S,2);%返回第二维的尺寸（列）
u0=[-4,-4]';%源节点位置
cvx_solver SeDuMi

c=3e8;
L=5;L0=0;%%%%% penalty factor  
NN=5;
N=10;% 蒙特卡洛次数
U=[eye(M) ones(M,1)];
Q=eye(M)-1/M*ones(M,1)*ones(1,M);
t0=(1+3*rand)*1e-8*c;


for K=1:NN
   K %方差
pd=10^((K-5));
k= pd*eye(M);
G=(Q )' * inv(k) * (Q);
% G=(eye(M)-1/M*ones(M,1)*ones(1,M) )' * inv(k) * (eye(M)-1/M*ones(M,1)*ones(1,M));
MSE=0;
MSE1=0;

for n=1:N
 n
for i=1:M
    h1(:,i)=[(u0-S(:,i))/norm(u0-S(:,i));c];
end
I1=h1*inv(k)*h1';
CRB_TOA=inv(I1);
MSE=MSE+trace( CRB_TOA(1:2,1:2) ) ;
   
%数据的产生
r=zeros(M,1);
for i=1:M
    r(i)=norm(S(:,i)-u0)+t0+ (sqrt(pd)*randn );%
end
  
%%%%%%%%%%%%%%%%%%%  
%%%%%%%%%%%%%%%%%%%%%
XX=[];
cf=zeros(L,1);
for m=1:L
    eita=10^(m-L+L0);   %控制eita从10e-4到10e0

cvx_begin  quiet  
variables y(2,1) ys 
variable d(M,1)
variable D(M,M)   symmetric 
minimize ( trace(G*D)-2*d'*G*r + eita*trace(D) )
subject to

[1 d'; d D]==semidefinite(M+1);
[eye(2) y;y' ys]==semidefinite(3);
for i=1:M
    D(i,i)==(ys-2*S(:,i)'*y+S(:,i)'*S(:,i) );
     norm(y-S(:,i))<=d(i);
end
for i=1:M-1
    for j=i+1:M
        D(i,j)>=abs(   ys-y'*(S(:,i)+S(:,j))+S(:,i)'*S(:,j)  );
    end
end
cvx_end

disp(['DRBE1 is ' cvx_status])

d0=zeros(M,1);
for i=1:M
    d0(i)=norm(y-S(:,i));
end
cf(m)=(r-d0)'*G*(r-d0);
XX=[XX,y];

end


for m=1:L-1
    if cf(m+1)<cf(1)
        cf(1)=cf(m+1);
        XX(:,1)=XX(:,m+1);
    else 
    end
end

u=XX(:,1);
MSE1=MSE1+norm(u0-u)^2;

end

RMSE1(K)=sqrt((MSE1/N));


end






