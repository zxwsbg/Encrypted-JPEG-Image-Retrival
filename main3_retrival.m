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
localFeatureSelectStep  = 1;
imgNum = 1491;
clusterNum              = 100;
maxIter                 = 300;
clusterDistanceType     = 'cityblock';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
globalFeatureDistanceType = 'cityblock';
strInriaDataFileSavePath = 'E:\INRIA HOLIDAYS DATASET\eval_holidays';

%% 读取各图片间的距离(之前计算过的信息)
strDataLoad= 'D:\JPGOW\Encrypted-JPEG-Image-Retrival\';
strDataLoad= [strDataLoadretrival_type];
strDataLoad= [strDataLoad'MatrixDist4'];
load([strDataLoad'.mat'],'MatrixDist_Y','MatrixDist_U','MatrixDist_V','runningTime', '-v7.3');

%% 




