% Demo file of Sparse HSIC Feature Selection method
%%
% If you are using this code, please cite the following paper
% Sparse Hilbert Schmidt Independence Criterion and Surrogate-Kernel-Based
% Feature Selection for Hyperspectral Image Classification, IEEE TGRS,
% Vol.55 (4), April 2017
% BB Damodaran 

%%
clc
clear all
old_dir =pwd;
cd('D:\PhDWork\IISTRSLABSystem13\Training samples')
F=load('HYDICE-Trainingsamples-c7.mat');
Data=F.Data;
label=Data(:,end);
Data=Data(:,1:end-1);
cd(old_dir)
Data=bh_normalize(Data);

lambda=0.001

% design and target matrix in eqn 11
[DesignMat,TargetMat] = bh_ClassHSIC_ObjTerm(Data,label);
% solve the lasso model in eqn 11
[alpha1, status, MSE] =bh_ClassLasso_Solve(DesignMat,TargetMat,lambda);
[Sel_Features]= find(alpha1~=0)