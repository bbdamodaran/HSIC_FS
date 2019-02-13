function [alpha,status,MSE] = bh_ClassLasso_Solve(DM,TM,lambda)
%%
% This function solves the Lasso problem
   % DM  -- design matrix in the Lasso function
   % TM  -- target matrix in the Lasso function
   % lambda  -- parameter to control the sparsity in the Lasso function
   
   %   ||TM- \sum_i \alpha_i DM_i ||^2 + lambda |\alpha|

  % Output
     % alpha  -- sparse coefficient vector
%%
 
 
% %Solve Lasso problem.

if nargin==3
    % solve using matlab solver
    [wtmp, status]=lasso(DM, TM,'Lambda',lambda); 
    alpha=wtmp; 
    MSE = norm(TM-DM*alpha)^2;
elseif nargin==2
    [wtmp, status]=lasso(DM, TM);
    alpha=wtmp; 
 end
