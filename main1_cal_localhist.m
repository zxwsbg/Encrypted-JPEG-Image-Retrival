%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Copyright (c) 2018--2088 BoWen_Shi. All rights reserved.%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Nanjing University of Information Science & Technology%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Nuist_ACM-ICPC team member%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Think_Spirit 2017%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;

%% �����趨
strImgFolder = 'D:\jpg1\';
retrival_type='CH';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
localFeatureSelectStep  = 1;%% 
imgNum = 1491;
clusterNum              = 100;%% Ŀǰ100����á�
maxIter                 = 300;%% ��ʱ�����������
clusterDistanceType     = 'cityblock';%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
globalFeatureDistanceType = 'cityblock';%% cityblock ��euclideanͨ��Ҫ�á�
strInriaDataFileSavePath = 'E:\INRIA HOLIDAYS DATASET\eval_holidays';

%% ����ֲ�ֱ��ͼ
[imgNames,localHistograms,localHistograms_Y,localHistograms_U,localHistograms_V,runningTime] = JPGOWFunc_GenLocalBlockHistogram(strImgFolder);
strDataSave = 'D:\JPGOW\Encrypted-JPEG-Image-Retrival\';
strDataSave = [strDataSave retrival_type];
strDataSave = [strDataSave 'LocalHistograms'];
save([strDataSave '.mat'],'imgNames','localHistograms','localHistograms_Y','localHistograms_U','localHistograms_V','runningTime', '-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
