function [LocalMean,LocalVariance,LocalNumNonZero,LocalMeanRunZero,LocalVarianceRunZero]=JPGOWJPGOWFunc_GetImageAcInfo(inputfile,component,Local)
%isquantization=0����Ҫ������=1������
%LocalMean��ʾblock��AC��ֵ,LocalVariance��ʾBlock��AC����,LocalNumNonZero��ʾ���з���ĸ�����

switch lower(component)
    case 'y'
%         fun1 = @(x) mean(ComputeZero(x));
        LocalMean=Local(:,1:5:end);       
        LocalMean=LocalMean(:);
        LocalVariance=Local(:,2:5:end);
        LocalVariance=LocalVariance(:);
        LocalNumNonZero=Local(:,3:5:end);
        LocalNumNonZero=LocalNumNonZero(:);
        LocalMeanRunZero=Local(:,4:5:end);
        LocalMeanRunZero=LocalMeanRunZero(:);
        LocalVarianceRunZero=Local(:,5:5:end);
        LocalVarianceRunZero=LocalVarianceRunZero(:);
               
    case 'u'
%         fun1 = @(x) mean(ComputeZero(x));
        LocalMean=Local(:,1:5:end);       
        LocalMean=LocalMean(:);
        LocalVariance=Local(:,2:5:end);
        LocalVariance=LocalVariance(:);
        LocalNumNonZero=Local(:,3:5:end);
        LocalNumNonZero=LocalNumNonZero(:);
        LocalMeanRunZero=Local(:,4:5:end);
        LocalMeanRunZero=LocalMeanRunZero(:);
        LocalVarianceRunZero=Local(:,5:5:end);
        LocalVarianceRunZero=LocalVarianceRunZero(:);
                 
    case 'v'
%         fun1 = @(x) mean(ComputeZero(x));
        LocalMean=Local(:,1:5:end);       
        LocalMean=LocalMean(:);
        LocalVariance=Local(:,2:5:end);
        LocalVariance=LocalVariance(:);
        LocalNumNonZero=Local(:,3:5:end);
        LocalNumNonZero=LocalNumNonZero(:);
        LocalMeanRunZero=Local(:,4:5:end);
        LocalMeanRunZero=LocalMeanRunZero(:);
        LocalVarianceRunZero=Local(:,5:5:end);
        LocalVarianceRunZero=LocalVarianceRunZero(:);
                  
end
end




