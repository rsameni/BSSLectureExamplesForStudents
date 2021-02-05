function main() 
    %%part 1 
    disp('---begin part 1')
    C = [4,1;1,3];
    [eig_vals,eig_vec ] = getEig(C);
    [true_eig_vec,true_eig_val] = eig(C);
    disp('Calculated eigen values') 
    disp(eig_vals)
    disp('Expected eigen values') 
    disp(true_eig_val)
    disp('Calculated eigen vectors') 
    disp(eig_vec)
    disp('Expected eigen vectors')
    disp(true_eig_vec)
    %%part 2: calculate eigen value using power method 
     eig_val=powerEsti(C,true)
end 


function [eig_vals,eig_vec]=getEig(C) 
    I = eye(size(C));
    L = sym('L')  
    %%Use system of equation to find eigen value 
    eq = det(C - (I.*L));
    S = solve(eq ==0,L);
    eig_vals = eval(S);
    %try a similar apporach for
    x_val =1; 
    eig_vec = [1,1];
    for i =1:length(eig_vals)
       lambd =  eig_vals(i); 
       A = C - I*lambd; 
       A = [rref(A),ones(2,1)];
       v = A(1,1:2) ;
       eig_vec(1,i) = x_val; 
       eig_vec(2,i) = v(2)*x_val;
       eig_vec(:,i) = eig_vec(:,i)/ norm(eig_vec(:,i));
    end
end

function f_eig_val=powerEsti(C,doPlot)
guess = randn(2,1); 
num_iter = 20; 
eig_val = zeros(1,num_iter);
guess_pred = zeros(2,num_iter);
for i =1:num_iter
   guess = C*guess; 
   guess = guess/norm(guess); 
   guess_pred(:,i) = guess;
   eig_val(i) =  ((C*guess)'*guess)/(guess'*guess);
end
    if doPlot== true 
        figure(1) 
        
        plot(1:num_iter,eig_val)
        title('Eigen value estimation over time')
        xlabel('Iteration')
        ylabel('Value')
        figure(2) 
        plot(1:num_iter,guess_pred(1,:)) 
        hold on 
        plot(1:num_iter,guess_pred(2,:))
        xlabel('Iteration')
        ylabel('value')
        legend('eigen vector comp 1','eigen vector comp 2','Location','southeast')
    end
    f_eig_val = eig_val(end); 
end



