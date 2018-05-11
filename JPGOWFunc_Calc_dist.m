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

%% �����ѡ��һЩ�飬�����̫��
num=0.05;  %%��¼���ѡȡ1/20�Ŀ�
num=round(num*m); %%num��¼���ȡ�Ŀ������
p=randperm(m,num);  %����һ�д�1��n�������е�num��������num����Ҳ�ǲ���ͬ��
p=sort(p,2);
selected_local_hist=[];

%% selected_local_histΪ���ѡ�����Ĳ��־���
for i=1:num
    selected_local_hist=[selected_local_hist;one(p(i),:)];
end
     
%% ����������ʽ��2����
for i=1:num
% temp2=abs(repmat(one(i,:),m,1)-two)./temp1;
temp = repmat(selected_local_hist(i,:),n,1);
temp2=abs(temp-two)./abs(1+0.000001+temp+two);
minValue=[minValue;min(sum(temp2,2))];
end
maxminValue=sum(minValue);

end