function [ label,debug ] = runFR( method,pars,test_ins )

classes = unique(pars.gt);

if strcmp(method,'esrc')
    [cl,residuals] = runESRC( pars,test_ins );
    label = classes(cl);
    [val_deb debug] = sort(residuals);
end

if strcmp(method,'cr-rls')
    [cl,residuals] = runCRRLS(pars,test_ins);
    label = classes(cl);
    [val_deb debug] = sort(residuals);
end

if strcmp(method,'src+rls')
    [cl,residuals] = runSRCRLS( pars,test_ins );
    label = classes(cl);
    [val_deb debug] = sort(residuals);
end


end

