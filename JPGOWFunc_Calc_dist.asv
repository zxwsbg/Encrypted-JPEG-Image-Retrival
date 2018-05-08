%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Copyright (c) 2018--2088 BoWen_Shi. All rights reserved.%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Nanjing University of Information Science & Technology%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Nuist_ACM-ICPC team member%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Think_Spirit 2017%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function maxminValue=JPGOWFunc_Calc_dist(AllStd,one,two) %%%one为当前图像，j为待比较图像
%% allstd似乎没用到,这一段是初始化
%temp1=repmat(AllStd,m,1); 
m = size(one,1);
n = size(two,1);
minValue=[];

%% 随机化选出一些块，否则块太多
num = 0.1;  %%记录随机选取1/10的块

temp1=repmat(AllStd,m,1); 

%% 
for i=1:m
% temp2=abs(repmat(one(i,:),m,1)-two)./temp1;
temp = repmat(one(i,:),n,1);
temp2=abs(temp-two)./abs(1+0.000001+temp+two);
minValue=[minValue;min(sum(temp2,2))];
end
maxminValue=sum(minValue);

end