%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Copyright (c) 2018--2088 BoWen_Shi. All rights reserved.%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Nanjing University of Information Science & Technology%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Nuist_ACM-ICPC team member%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Think_Spirit 2017%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function maxminValue=JPGOWFunc_Calc_dist(AllStd,one,two) %%%oneΪ��ǰͼ��jΪ���Ƚ�ͼ��
%%%%%%%allstd�ƺ�û�õ�

%temp1=repmat(AllStd,m,1); 
temp2=pdist2(one,two,'cityblock');
minValue=[minValue;min(sum(temp2,2))];
maxminValue=sum(minValue);
end