function [xk,val,k]=trustmdis(x0)
%功能: 牛顿型信赖域方法求解无约束优化问题 min f(x)
%输入: x0是初始迭代点
%输出: xk是近似极小点, val是近似极小值, k是迭代次数
n=length(x0);  x=x0; dta=1;
eta1=0.15; eta2=0.75;  dtabar=2.0;
tau1=0.5; tau2=4.0; epsilon=1e-3;
k=0;  Bk=Hessdis(x);  %Bk=eye(n);
%while(k<1500000000000) 
    while(k<150)%2020年3月12日12:20:16刘胜
    gk=gfundis(x);

    if(norm(gk)<epsilon)
        break;
    end
    d=trustqdis(gk,Bk,dta);   

    deltaq=-qkdis(x,d);  %模型函数的下降量
    deltaf=fundis(x)-fundis(x+d);%目标函数的下降量
    rk=deltaf/deltaq;  %比值
    if(rk<=eta1)
        dta=tau1*dta;
    else if (rk>=eta2&&norm(d)==dta)
            dta=min(tau2*dta,dtabar);
        else
            dta=dta;
        end
    end
    if(rk>eta1)
        x0=x;     x=x+d;   
        Bk=Hessdis(x);
%         [D p]=chol(Bk);%p=0矩阵正定
%         if p~=0
%             disp(['方法6：RLS初始点1第',num2str(k),'次迭代Bk非正定']);
%         end     
    end
    k=k+1;
end
xk=x;
val=fundis(xk);
% plot3(xx,xy,xz,'-ro');