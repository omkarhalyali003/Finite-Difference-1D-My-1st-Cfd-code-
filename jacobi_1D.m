
% 1D problem finite difference

clear all;
close all;
clc

%%

n = 5;
L = 1;
h = L/(n-1);

%% initi

y(1) = 0;
y(n) = 1;

y_new(1) = 0;
y_new(n) = 1;

err = 1;
final_err = 1e-6;
iter = 0;
err_hist = zeros(1,100);   

%% calculation

while err > final_err
    for i = 2:n-1
        y_new(i) = (y(i+1)+y(i-1))/2;
    end

err = 0;

for i = 2:n-1;
   
    err = err + abs(y(i) - y_new(i));
end

    iter = iter + 1

    err_his(iter) = err;

    
    y = y_new;
end

%% plot 
semilogy(1:iter, err_his(1:iter), '-o')
xlabel('Iteration')
ylabel('Error (log scale)')
title('Convergence of Jacobi iteration')
grid on
