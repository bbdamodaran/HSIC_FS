# HSIC_FS
This repository contains the matlab codes of Sparse HSIC Feature Selection Method. This method is developed for high dimensional hyperspectral images, but it can be used any high dimensional datasets.

For details of the method, please see the following paper

BB Damodaran, N Courty, S Lefevre, "[Sparse Hilbert Schmidt Independence Criterion and Surrogate-Kernel-Based Feature Selection for Hyperspectral Image Classification](https://hal.archives-ouvertes.fr/hal-01447452v2/document)", IEEE TGRS, Vol.55 (4), April 2017

To run the code, please see: "demo_SparseHSIC_Lasso.mat"

Usage:
Data --> Samples in the form NxP, where N is the no. of observations, and P is the no. of features (variables)
label --> class label in the form Nx1
lambda --> sparse (Lasso) coefficient


[DesignMat,TargetMat] = bh_ClassHSIC_ObjTerm(Data,label);

% solve the lasso model in eqn 11

[alpha1, status, MSE] =bh_ClassLasso_Solve(DesignMat,TargetMat,lambda);

Following results, the selected features by our method

[Sel_Features]= find(alpha1~=0)

