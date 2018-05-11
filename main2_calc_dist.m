%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Copyright (c) 2018--2088 BoWen_Shi. All rights reserved.%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Nanjing University of Information Science & Technology%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Nuist_ACM-ICPC team member%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Think_Spirit 2017%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;

%% �����趨
strImgFolder = 'D:\jpg\';
retrival_type='CH';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dirOutput = dir(fullfile(strImgFolder,'*.jpg'));
imgNames={dirOutput.name};
imageNum = size(imgNames,2)
localFeatureSelectStep  = 1;%% 
clusterNum              = 100;%% Ŀǰ100����á�
maxIter                 = 300;%% ��ʱ�����������
clusterDistanceType     = 'cityblock';%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
globalFeatureDistanceType = 'cityblock';%% cityblock ��euclideanͨ��Ҫ�á�
strInriaDataFileSavePath = 'E:\INRIA HOLIDAYS DATASET\eval_holidays';

%% ��ȡÿ��ͼƬ����������ֱ��ͼ
strDataLoad = 'D:\JPGOW\Encrypted-JPEG-Image-Retrival\';
strDataLoad = [strDataLoad retrival_type];
strDataLoad = [strDataLoad 'LocalHistograms'];
data = load(strDataLoad);

%% ˳�����ȫ�ֱ�׼��,��Ȼ��������û���õõ�,���Ͼ����������
% temp_Y=[];
% temp_U=[];
% temp_V=[];
% tic;
% for i=1:imageNum
%     localHistograms_Y=cell2mat(data.localHistograms_Y(i));
%     localHistograms_U=cell2mat(data.localHistograms_U(i));
%     localHistograms_V=cell2mat(data.localHistograms_V(i));
%     temp_Y = [temp_Y;localHistograms_Y(:,1)];
%     temp_U = [temp_U;localHistograms_U(:,1)];
%     temp_V = [temp_V;localHistograms_V(:,1)];
% end
% toc;
 AllStd_Y=0;
 AllStd_U=0;
 AllStd_V=0;
 
%% ��ÿһ��ͼ��������ͼƬ�Ƚϣ���������ǵľ���
%%���ڱȽϵĲ��Գ��ԣ�a��b�ľ��� �� b��a�ľ��� �����ǲ�ͬ��
tic;
for i=1:imageNum-1
    for j=i+1:imageNum
        MatrixDist_Y(i,j)=JPGOWFunc_Calc_dist(AllStd_Y,cell2mat(data.localHistograms_Y(i)),cell2mat(data.localHistograms_Y(j)));
        MatrixDist_Y(j,i)=JPGOWFunc_Calc_dist(AllStd_Y,cell2mat(data.localHistograms_Y(j)),cell2mat(data.localHistograms_Y(i)));
        MatrixDist_U(i,j)=JPGOWFunc_Calc_dist(AllStd_U,cell2mat(data.localHistograms_U(i)),cell2mat(data.localHistograms_U(j)));
        MatrixDist_U(j,i)=JPGOWFunc_Calc_dist(AllStd_U,cell2mat(data.localHistograms_U(j)),cell2mat(data.localHistograms_U(i)));
        MatrixDist_V(i,j)=JPGOWFunc_Calc_dist(AllStd_V,cell2mat(data.localHistograms_V(i)),cell2mat(data.localHistograms_V(j)));
        MatrixDist_V(j,i)=JPGOWFunc_Calc_dist(AllStd_V,cell2mat(data.localHistograms_V(j)),cell2mat(data.localHistograms_V(i)));
    end
    disp(['��',num2str(i),'����ɣ�']);
end
runningTime=toc;

%% ��Ȩ���,w��ʾȨ��
w1=1;
w2=1;
w3=1;
MatrixDist_all = MatrixDist_Y*w1+MatrixDist_U*w2+MatrixDist_V*w3;

%% �洢���
strDataSave = 'D:\JPGOW\Encrypted-JPEG-Image-Retrival\';
strDataSave = [strDataSave retrival_type];
strDataSave = [strDataSave 'MatrixDist'];
save([strDataSave '.mat'],'MatrixDist_Y','MatrixDist_all','MatrixDist_U','MatrixDist_V','runningTime', '-v7.3');
