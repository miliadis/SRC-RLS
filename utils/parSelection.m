function [ fr ] = parSelection( method,gt, store_normz )

if strcmp(method,'esrc')
    fr.lambda_l1 = 0.001;
    fr.table = [store_normz.trainData store_normz.V];    
    
    % no need to change
    fr.extra = size(store_normz.trainData,2);
    fr.gt = gt;
end

if strcmp(method,'cr-rls')
    fr.lambda_ls = 0.001;    
    fr.table = store_normz.trainData;    
    fr.inverse = fr.table;
    P = computeInverse(fr);
    fr.P = P;    
    fr.gt = gt;
end

if strcmp(method,'src+rls')    
    fr.lambda_l1 = 0.005;
    fr.lambda_ls = 0.001;    
    fr.table = [store_normz.trainData store_normz.V];    
    
    % no need to change    
    fr.gt = gt;
end

end

