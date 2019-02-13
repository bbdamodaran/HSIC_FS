function [KS] = bh_surrogatekernel(X1,X2,sigma)
%bh_surrogatekernel Summary of this function goes here
%   X1 is the samples belongs to the particular class
%   X2 is the samples belongs to the another class
%   sigma band width parameter of the kernel
%% surrogate kernel of X1 on the samples of X2
if nargin<3
sigma=size(X1,2);
end

KX2=bh_rbf(X2,sigma);
CK=bh_rbf(X1,sigma,X2);

% surrogate kernel
scalingfact=0.0001;
KX2=KX2+eye(size(KX2,1))*scalingfact;
inK=invChol_mex(KX2);
KS=CK*inK*CK';



end

