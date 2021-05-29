%%% 子问题目标函数 %%%%%%%%%%%%%
function qd=qk(x,d)
gk=gfun(x);  Bk=Hess(x);
qd=gk'*d+0.5*d'*Bk*d;