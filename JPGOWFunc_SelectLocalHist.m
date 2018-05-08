function [seleted_Local_Hist] = JPGOWFunc_SelectLocalHist(localHistograms,step)
disp('In BOEWFunc_SelectLocalHistForCluster...');
    tic;
    imgNum = size(localHistograms,1);
    totalNum = 0;
    for imgIdx = 1:imgNum
        localHistOfOneImg = localHistograms{imgIdx};
        totalNum = totalNum + size(localHistOfOneImg,1);
        histNum = size(localHistOfOneImg,1);
        selectedIdx = 1:step:histNum;
        localHistograms{imgIdx} = localHistOfOneImg(selectedIdx,:);
    end
    seletedLocalHistForCluster = cell2mat(localHistograms);
    NumOfLocalFeatureInCluster = size(seletedLocalHistForCluster,1)
    totalNum
    clear localHistograms;
    time = toc;
    
end