%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Copyright (c) 2018--2088 BoWen_Shi. All rights reserved.%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Nanjing University of Information Science & Technology%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Nuist_ACM-ICPC team member%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Think_Spirit 2017%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function maxminValue=JPGOWFunc_Calc_dist(AllStd,one,two) %%%oneΪ��ǰͼ��jΪ���Ƚ�ͼ��
%% allstd�ƺ�û�õ�,��һ���ǳ�ʼ��
%temp1=repmat(AllStd,m,1); 
m = size(one,1);
n = size(two,1);
minValue=[];

%% �������one����ѡ��һЩ�飬�����̫��
num1=0.05;  %%��¼���ѡȡ1/20�Ŀ�
num1=round(num1*m); %%num��¼���ȡ�Ŀ������
p=randperm(m,num1);  %����һ�д�1��n�������е�num��������num����Ҳ�ǲ���ͬ��
p=sort(p,2);
selected_local_hist=[];

%% selected_local_histΪ���ѡ�����Ĳ��־���
for i=1:num1
    selected_local_hist=[selected_local_hist;one(p(i),:)];
end
     
%% �������two����ѡ��һЩ�飬�����̫��
num2=0.05;
num2=round(num2*n); %%num��¼���ȡ�Ŀ������
p=randperm(n,num2);  %����һ�д�1��n�������е�num��������num����Ҳ�ǲ���ͬ��
p=sort(p,2);
cmp_local_hist=[];

%% cmp_local_histΪ���ѡ�����Ĳ��־���
for i=1:num2
    cmp_local_hist=[cmp_local_hist;two(p(i),:)];
end

%% ����������ʽ��2����
for i=1:num1
% temp2=abs(repmat(one(i,:),m,1)-two)./temp1;
temp = repmat(selected_local_hist(i,:),num2,1);
temp2=abs(temp-cmp_local_hist)./abs(1+0.000001+temp+cmp_local_hist);
minValue=[minValue;min(sum(temp2,2))];
end
maxminValue=sum(minValue);

end