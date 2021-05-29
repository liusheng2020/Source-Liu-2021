for p = 1:Itermax_a
    val_sub = 0;
    %% Recording
    for i = 1:anchors_n
        val_sub = val_sub + 1/2 * ((c * (ti(i,1) - t0_kk) - norm(all_nodes.all(:,i) - y_k))^2);
    end
    %% 内循环跳出条件
    grad = zeros(2,1);
    for i = 1:anchors_n
        grad = grad + (c * (ti(i,1) - t0_kk) - norm(all_nodes.all(:,i) - y_k)) * (all_nodes.all(:,i) - y_k)/(norm(all_nodes.all(:,i) - y_k));
    end
    if (norm(grad) < eps_p)
         break;
    end
    %% 搜索方向
    d = -grad;
    %% 计算合适步长
    yn = 0;
    alpha_a = 1;                                                        %初始步长
    yn = y_k + alpha_a * d;
    fn_sub = 0;
    for i = 1:anchors_n
        fn_sub =  fn_sub + 1/2 *((c * (ti(i,1) - t0_kk) - norm(all_nodes.all(:,i) - yn))^2);
    end
    while (fn_sub > val_sub + alpha_a * sigma * grad' * d )                   %Armijo控制条件
        alpha_a = alpha_a * 0.618;                                    %以0.618迭代
        yn = y_k + alpha_a * d;                                       %用新步长更新值判断是否满足控制条件
        fn_sub = 0;
        for i = 1:anchors_n
            fn_sub =  fn_sub + 1/2 *((c * (ti(i,1) - t0_kk) - norm(all_nodes.all(:,i) - yn))^2);
        end
    end
    %% 更新y值         
     y_kk =  y_k + alpha_a * d;                                           %使用得到的新步长更新值
     break
end
y_bb = y_kk;
y_ini = y_k;
y_new = y_kk;