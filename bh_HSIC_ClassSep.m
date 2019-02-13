function [KH,LH] = bh_HSIC_ClassSep(Data,label)
%%
% this function computes the HSIC class separability measure
   % -- Data  --training data samples of the form nsamples x nfeatures
   % -- label  -- corresponding label of the training samples
   
  % Output
     % KH  -- is the design matrix in the feature selection model
     % LH  -- is the target matrix in the feature selection model

%%
globalsigma = 1
dimension_wise_sigma=0
%classwise_sigma=1
%
[n,d] = size(Data);
Nclass=length(unique(label));

if globalsigma
    sigma=compmedDist(Data);
    fprintf('median dist = %f\n', sigma)
    sigma=sigma^2; % gamma = 1/(2*sigma^2)
    fprintf('sigma is = %f \n', sigma)
end


%H = eye(Nclass) - 1/Nclass*ones(Nclass); % centeralizing matrix
H=eye(Nclass);
%KH=zeros(Nclass*Nclass,d);
KS=cell(Nclass,Nclass);HSICM=zeros(Nclass,Nclass);
K=cell(Nclass,1);
if dimension_wise_sigma
    sigma=compmedDist(Data(:,loop));
    sigma=1/(2*sigma^2); % gamma = 1/(2*sigma^2)
    if isnan(sigma)
        sigma = 4.27e-16;
    end
end

for i=1:Nclass
    i_index=(label==i);

    [K{i}]=bh_rbf(Data(i_index,:),sigma);
    for j=1:Nclass
        j_index=(label==j);

        [KS{i,j}]=bh_surrogatekernel(Data(i_index,:),Data(j_index,:),sigma);

        % HSIC measure
        HSICM(i,j)=bh_HSIC(KS{i,j},K{i});

    end

end

tmp=HSICM; 

tmp=H*tmp*H;


KH=tmp;


  I=(1/Nclass)*eye(Nclass);   % target matrix
  %I=eye(Nclass);              % target matrix
  I=H*I*H;
  
  LH=I(:);
 

