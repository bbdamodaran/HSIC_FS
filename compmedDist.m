function sigma = compmedDist(X)

size1=size(X,1);
if size1>5000
    rp= randperm(size1);
    Xmed = X(rp(1:5000),:);
    size1 = 5000;
else
    Xmed = X;
end
G = sum((Xmed.*Xmed),2);
Q = repmat(G,1,size1);
R = repmat(G',size1,1);
dists = Q + R - 2*Xmed*Xmed';
dists = dists-tril(dists);
dists=reshape(dists,size1^2,1);
dists=sqrt(dists);
%sigma = sqrt(0.5*median(dists(dists>0)));  %rbf_dot has factor of two in kernel
%sigma = sqrt(0.5)*median(dists(dists>0));
sigma = median(dists(dists>0));
%  sigma = prctile(dists(dists>0),5);
%  sigma = prctile(dists(dists>0),10);

