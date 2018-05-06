%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%Copyright (c) 2018--2088 BoWen_Shi. All rights reserved.%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function maxminValue=JPGOWFunc_Calc_dist(AllStd,one,two) %%%one为当前图像，j为待比较图像
%%%%%%%allstd似乎没用到

[m]=size(one,1);
[n]=size(two,1);
minValue=[];

%temp1=repmat(AllStd,m,1); 
temp2 = zeros(m,n);
for i=1:m
% temp2=abs(repmat(one(i,:),m,1)-two)./temp1;
    for j=1:n
        for k=1:5
            temp2(i,j) = temp2(i,j)+abs(one(i,k)-two(j,k)/(1++0.000001+one(i,k)+two(j,k)));
        end
    end
minValue=[minValue;min(sum(temp2,2))];
end
maxminValue=sum(minValue);
end