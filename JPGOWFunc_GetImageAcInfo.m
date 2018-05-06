function [LocalMean,LocalVariance,LocalNumNonZero,LocalMeanRunZero,LocalVarianceRunZero]=JPGOWJPGOWFunc_GetImageAcInfo(inputfile,component,Local)
%isquantization=0不需要量化，=1量化。
%LocalMean表示block中AC均值,LocalVariance表示Block中AC方差,LocalNumNonZero表示块中非零的个数。

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




