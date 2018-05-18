%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Copyright (c) 2018--2088 BoWen_Shi. All rights reserved.%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Nanjing University of Information Science & Technology%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Nuist_ACM-ICPC team member%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Think_Spirit 2017%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;

%% 参数设定
clc;
clear;
imgInfo = load('D:\JPGOW\CH result\InriaImageClassInfo.mat');
imgNames = imgInfo.imgNames;
imgClass = imgInfo.imgClass;
load('D:\JPGOW\CH result\图片间距离\CHMatrixDist0.01_1.mat','MatrixDist_all');
strSavePath='D:\JPGOW\CH result\程航结果\result0.01_1.dat';
JPGOWFunc_GenInriaRstDat(MatrixDist_all,imgNames,imgClass,strSavePath);




