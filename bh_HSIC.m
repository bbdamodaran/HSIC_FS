function [HSIC]=bh_HSIC(K1,K2)
% HSIC function measures the independence between two kernels using the
% Hilbert-Schmidt Norm of the cross-covariance operator.

%%
m1=size(K1,1);m2=size(K2,1);
if m1~=m2
    disp 'error, the dimension of kernel matrix should be same'
else
     H=eye(m1)-(1/m1);
%      H=eye(m1);
    HSIC=((m1-1)^-2)*trace(K1*H*K2*H);
    
%     HSIC=((m1 )^-1)*trace(K1*H*K2*H)
    



end