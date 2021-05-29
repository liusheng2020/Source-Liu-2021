function  d=trustq(gk,Bk,dta)
% 功能: 求解信赖域子问题:  min qk(d)=gk'*d+0.5*d'*Bk*d, s.t. ||d||<=delta
%输入:  gk是xk处的梯度, Bk是第k次近似Hesse阵, dta是当前信赖域半径
%输出:  d, val分别是子问题的最优点和最优值, lam是乘子值, k是迭代次数.

  alfk=gk'*gk/(gk'*Bk*gk);
  skc=-alfk*gk;
  
  nskc=norm(skc);
  skn=-inv(Bk)*gk;
  nskn=norm(skn);
  if nskc>=dta
      d=-dta*gk/(norm(gk));
  else if nskn>dta
          save skcm.mat skc;
          save sknm.mat skn;
          save dtam.mat dta;
          dta
          lam=fsolve(@funlam,0);
          d=skc+lam*(skn-skc);          
      else
          d=-inv(Bk)*gk;
      end
  end
