function[x4,t,k]= method_trdisn(Loc_Monte_carlo)
%tr·½·¨
tic
[x4,val,k]=trustmdis(Loc_Monte_carlo);
t=toc;

% LocTRdisn_zhixin(:,kk)=x4;
% T_TR_zhixin(kk,kkk)=t;
% K_TR_zhixin(kk,kkk)=k;