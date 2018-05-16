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
load('D:\JPGOW\CH result\CHMatrixDist2','MatrixDist_all');
strSavePath='D:\JPGOW\CH result\result.txt';
JPGOWFunc_GenInriaRstDat(MatrixDist_all,imgNames,imgClass,strSavePath);




