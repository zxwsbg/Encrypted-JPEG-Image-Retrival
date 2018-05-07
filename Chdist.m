%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Copyright (c) 2018--2088 BoWen_Shi. All rights reserved.%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Nanjing University of Information Science & Technology%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Nuist_ACM-ICPC team member%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Think_Spirit 2017%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [D,I]=Chdist(X, Y) %%程航计算距离的方法
[nx,p] = size(X);
[ny,py] = size(Y);
outClass = superiorfloat(X,Y);
for i = 1:ny
    dsq = zeros(nx,1,outClass);
    for q = 1:py
        dsq = dsq + abs(X(:,q) - Y(i,q)/1+X(:,q) - Y(i,q)+0.000001);
    end
    
    if ~isempty(radius)
        [D{i},I{i}] = radiusSort(dsq,radius);
    elseif isempty(smallestLargestFlag)
        D(:,i) = dsq;
    else
        [D(:,i),I(:,i)] = partialSort(dsq,smallestLargestFlag);
    end
end