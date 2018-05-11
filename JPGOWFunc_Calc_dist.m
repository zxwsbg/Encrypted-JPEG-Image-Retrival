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

%% 随机化对one矩阵选出一些块，否则块太多
num1=0.05;  %%记录随机选取1/20的块
num1=round(num1*m); %%num记录随机取的块的数量
p=randperm(m,num1);  %返回一行从1到n的整数中的num个，且这num个数也是不相同的
p=sort(p,2);
selected_local_hist=[];

%% selected_local_hist为随机选出来的部分矩阵
for i=1:num1
    selected_local_hist=[selected_local_hist;one(p(i),:)];
end
     
%% 随机化对two矩阵选出一些块，否则块太多
num2=0.05;
num2=round(num2*n); %%num记录随机取的块的数量
p=randperm(n,num2);  %返回一行从1到n的整数中的num个，且这num个数也是不相同的
p=sort(p,2);
cmp_local_hist=[];

%% cmp_local_hist为随机选出来的部分矩阵
for i=1:num2
    cmp_local_hist=[cmp_local_hist;two(p(i),:)];
end

%% 进行论文中式子2计算
for i=1:num1
% temp2=abs(repmat(one(i,:),m,1)-two)./temp1;
temp = repmat(selected_local_hist(i,:),num2,1);
temp2=abs(temp-cmp_local_hist)./abs(1+0.000001+temp+cmp_local_hist);
minValue=[minValue;min(sum(temp2,2))];
end
maxminValue=sum(minValue);

end