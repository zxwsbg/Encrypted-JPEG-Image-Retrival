%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Copyright (c) 2018--2088 BoWen_Shi. All rights reserved.%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Nanjing University of Information Science & Technology%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Nuist_ACM-ICPC team member%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Think_Spirit 2017%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;

%% 参数设定
strImgFolder = 'D:\jpg1\';
retrival_type='CH';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
localFeatureSelectStep  = 1;%% 
imgNum = 1491;
clusterNum              = 100;%% 目前100是最好。
maxIter                 = 300;%% 有时候可以收敛。
clusterDistanceType     = 'cityblock';%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
globalFeatureDistanceType = 'cityblock';%% cityblock 比euclidean通常要好。
strInriaDataFileSavePath = 'E:\INRIA HOLIDAYS DATASET\eval_holidays';

%% 计算局部直方图
[imgNames,localHistograms,localHistograms_Y,localHistograms_U,localHistograms_V,runningTime] = JPGOWFunc_GenLocalBlockHistogram(strImgFolder);
strDataSave = 'D:\JPGOW\Encrypted-JPEG-Image-Retrival\';
strDataSave = [strDataSave retrival_type];
strDataSave = [strDataSave 'LocalHistograms'];
save([strDataSave '.mat'],'imgNames','localHistograms','localHistograms_Y','localHistograms_U','localHistograms_V','runningTime', '-v7.3');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
