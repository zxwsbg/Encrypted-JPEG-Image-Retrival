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
imgNum = 10;
clusterNum              = 100;%% 目前100是最好。
maxIter                 = 300;%% 有时候可以收敛。
clusterDistanceType     = 'cityblock';%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
globalFeatureDistanceType = 'cityblock';%% cityblock 比euclidean通常要好。
strInriaDataFileSavePath = 'E:\INRIA HOLIDAYS DATASET\eval_holidays';

%% 读取每张图片的特征向量直方图
strDataLoad = 'D:\JPGOW\Encrypted-JPEG-Image-Retrival\';
strDataLoad = [strDataLoad retrival_type];
strDataLoad = [strDataLoad 'LocalHistograms'];
data = load(strDataLoad);

%% 顺手算个全局标准差,虽然后来发现没有用得到,但毕竟是输入参数
temp_Y=[];
temp_U=[];
temp_V=[];
for i=1:imgNum
    localHistograms_Y=cell2mat(data.localHistograms_Y(i));
    localHistograms_U=cell2mat(data.localHistograms_U(i));
    localHistograms_V=cell2mat(data.localHistograms_V(i));
    temp_Y = [temp_Y;localHistograms_Y(:,1)];
    temp_U = [temp_U;localHistograms_U(:,1)];
    temp_V = [temp_V;localHistograms_V(:,1)];
end
AllStd_Y=std(temp_Y,0,1);
AllStd_U=std(temp_U,0,1);
AllStd_V=std(temp_V,0,1);

%% 
%%将每一幅图都与其他图片比较，计算出他们的距离
%%由于比较的不对称性，a和b的距离 与 b和a的距离 可能是不同的
tic;
for i=1:imgNum-1
    for j=i+1:imgNum
        MatrixDist_Y(i,j)=JPGOWFunc_Calc_dist(AllStd_Y,cell2mat(data.localHistograms_Y(i)),cell2mat(data.localHistograms_Y(j)));
        MatrixDist_Y(j,i)=JPGOWFunc_Calc_dist(AllStd_Y,cell2mat(data.localHistograms_Y(j)),cell2mat(data.localHistograms_Y(i)));
        MatrixDist_U(i,j)=JPGOWFunc_Calc_dist(AllStd_U,cell2mat(data.localHistograms_U(i)),cell2mat(data.localHistograms_U(j)));
        MatrixDist_U(j,i)=JPGOWFunc_Calc_dist(AllStd_U,cell2mat(data.localHistograms_U(j)),cell2mat(data.localHistograms_U(i)));
        MatrixDist_V(i,j)=JPGOWFunc_Calc_dist(AllStd_V,cell2mat(data.localHistograms_V(i)),cell2mat(data.localHistograms_V(j)));
        MatrixDist_V(j,i)=JPGOWFunc_Calc_dist(AllStd_V,cell2mat(data.localHistograms_V(j)),cell2mat(data.localHistograms_V(i)));
    end
    disp(['第',num2str(i),'副完成！']);
end
runningTime=toc;

%% 加权求和,w表示权重
w1=1;
w2=1;
w3=1;
MatrixDist_all = MatrixDist_Y*w1+MatrixDist_U*w2+MatrixDist_V*w3;

%% 存储结果
strDataSave = 'D:\JPGOW\Encrypted-JPEG-Image-Retrival\';
strDataSave = [strDataSave retrival_type];
strDataSave = [strDataSave 'MatrixDist'];
save([strDataSave '.mat'],'MatrixDist_Y','MatrixDist_all ','MatrixDist_U','MatrixDist_V','runningTime', '-v7.3');
