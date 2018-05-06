function [] = JPGOWFunc_GenInriaRstDat(Features,imgNames,imgClass,distanceType,strSavePath)
    disp('In JPGOWFunc_GenInriaRstDat...');
    tic;
    imgNum = size(Features,1);
    classNum = size(imgClass,1);


    for classIdx = 1:classNum
        queryImageName = strcat(int2str(1000 + classIdx -1),'00.jpg');
        for imgIdx = 1:imgNum
            if queryImageName == imgNames{imgIdx}
                queryFeature= Features(imgIdx,:);
            end
        end
        %%%%%%%%%%%%%%
        similarDistance = pdist2(queryFeature,Features,distanceType);% 
        [~,Idx]=sort(similarDistance);% similarDistance is a 1-D vector

        strRst{classIdx} = queryImageName;
        for rankedImgIdx = 1:10
            strIdx = int2str(rankedImgIdx-1);
            strRst{classIdx} = [strRst{classIdx},strIdx,imgNames(Idx(rankedImgIdx))];
        end 
        
        %%%%%%%%%%%%%%%%%
        thisClass = imgClass{classIdx};
        thisClassNum = size(thisClass,2);  
        for rankedImgIdx = 11:imgNum
            for thisClassIdx = 1:thisClassNum
                if strcmp( imgNames{Idx(rankedImgIdx)},thisClass{thisClassIdx} )
                    strIdx = int2str(rankedImgIdx-1);
                    strRst{classIdx} = [strRst{classIdx},strIdx,imgNames(Idx(rankedImgIdx))];
                end
            end
        end

    end
    %% make file
    fid = fopen(strSavePath,'w');
    for classIdx = 1:classNum
        temp = strRst{classIdx};
        thisClassNum = size(temp,2);
        for j =1:thisClassNum
           fprintf(fid,'%s ',temp{j}); 
        end
        fprintf(fid,'\n');
    end
    fclose(fid);
    toc
end


