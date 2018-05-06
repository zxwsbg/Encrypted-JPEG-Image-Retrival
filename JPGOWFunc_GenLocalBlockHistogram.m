%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Copyright (c) 2018--2088 BoWen_Shi. All rights reserved.%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Nanjing University of Information Science & Technology%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Nuist_ACM-ICPC team member%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Think_Spirit 2017%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [imgNames,localHistograms,localHistograms_Y,localHistograms_U,localHistograms_V,runningTime] = JPGOWFunc_GenLocalBlockHistogram(strImgFolder)
%% �����趨
disp('In JPGOWFunc_GenLocalBlockHistogram...');
dirOutput = dir(fullfile(strImgFolder,'*.jpg'));
imgNames={dirOutput.name};
imageNum = size(imgNames,2);
%imageNum = 1491;
localHistograms = cell(imageNum,1);%%%  imageNum
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
for imgIdx = 1:imageNum %%%  imageNum
    %% ��ȡͼƬ
    disp(imgIdx);
    InputImageName = strcat(strImgFolder,imgNames{imgIdx});
    
    %% ����ÿ��ͼƬÿ�������ά��������
    jobj = jpeg_read(InputImageName);
    
    %% Y����
    dct=jobj.coef_arrays{1};
    dct(1:8:end,1:8:end)=0;
    Local=blkproc(dct,[8 8],'ComputeZero4'); 
    length = size(Local,1)*size(Local,2);
    LocalInfo_Y=zeros(length/5,5);
    [LocalInfo_Y(:,1),LocalInfo_Y(:,2),LocalInfo_Y(:,3),LocalInfo_Y(:,4),LocalInfo_Y(:,5)]=JPGOWFunc_GetImageAcInfo(InputImageName,'Y',Local);
    
    %% U����
    dct=jobj.coef_arrays{2};
    dct(1:8:end,1:8:end)=0;
    Local=blkproc(dct,[8 8],'ComputeZero4'); 
    length = size(Local,1)*size(Local,2);
    LocalInfo_U=zeros(length/5,5);
    [LocalInfo_U(:,1),LocalInfo_U(:,2),LocalInfo_U(:,3),LocalInfo_U(:,4),LocalInfo_U(:,5)]=JPGOWFunc_GetImageAcInfo(InputImageName,'U',Local);

    %% V����
    dct=jobj.coef_arrays{3};
    dct(1:8:end,1:8:end)=0;
    Local=blkproc(dct,[8 8],'ComputeZero4'); 
    length = size(Local,1)*size(Local,2);
    LocalInfo_V=zeros(length/5,5);
    [LocalInfo_V(:,1),LocalInfo_V(:,2),LocalInfo_V(:,3),LocalInfo_V(:,4),LocalInfo_V(:,5)]=JPGOWFunc_GetImageAcInfo(InputImageName,'V',Local);

    %% ��ÿ��ͼƬ��YUV�����������Ե����������ϲ�,�ֱ�洢
    localHistofOneImg_Y = LocalInfo_Y;
    localHistofOneImg_U = LocalInfo_U;
    localHistofOneImg_V = LocalInfo_V;
    localHistofOneImg = LocalInfo_Y;
    localHistofOneImg = [LocalInfo_U;LocalInfo_V];
    localHistograms_Y{imgIdx} = localHistofOneImg_Y;
    localHistograms_U{imgIdx} = localHistofOneImg_U;
    localHistograms_V{imgIdx} = localHistofOneImg_V;
    localHistograms{imgIdx} = localHistofOneImg;
 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

runningTime = toc;
disp('End of JPGOWFunc_GenLocalBlockHistogram.');
end
