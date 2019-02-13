function Phi=DeltaBasis_ycomp(y,v)
Phi=zeros(length(v),length(y));

c = length(unique(y));
cnum = zeros(c,1);
count = 1;
ylist = unique(y);
for yy = 1:c
    cnum(count) = sum(y == ylist(count));
    count = count + 1;
end
cnuminv = 1./cnum;
%keyboard
for yy=1:c
  Phi((v==yy),(y==yy))=cnuminv(yy);
end
