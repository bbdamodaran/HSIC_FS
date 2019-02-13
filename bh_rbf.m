function [K] = bh_rbf(X1,sigma,X2)
%bh_rbf Summary of this function goes here
%   Detailed explanation goes here

if nargin==1
    sigma=1;  % default sigma
end


if nargin==2
    [m,n]=size(X1);
    % n=size(x1,1);
    K=repmat(diag(X1*X1')',m,1)+repmat(diag(X1*X1'),1,m)-2*(X1*X1');
elseif nargin>2
    [m,n]=size(X1);
    [p,q]=size(X2);
    K=repmat(diag(X2*X2')',m,1)+repmat(diag(X1*X1'),1,p)-2*(X1*X2');
else
    disp 'error, wrong number of arguments to rbf function'
end
K=exp((-1/(2*sigma))*K);


end

