function [ label,residuals ] = runESRC( pars,test_ins )

table = [pars.tableplain pars.Vor];
obs = test_ins.plain_normz;
% opts.tau = pars.lambda_l1;
% opts.delx_mode = 'chol';
% xp = l1homotopy_v1(table, test_ins.normz, opts);
% xp = xp.x_out;

% xp = irls(table,test_ins.normz,pars.lambda_l1);

xp = solveX(table,obs,1,pars.lambda_l1);

obs = obs - table(:,pars.extra+1:end)*xp(pars.extra+1:end);

classes = unique(pars.gt);
for j = 1 : size(classes,2)
    idx = find(pars.gt == classes(j));
    residuals(j) = norm(obs-table(:,idx)*xp(idx),2);
    %residuals(j) = norm(mtest.normz-table(:,idx)*xp(idx),2)^2/sum(xp(idx).*xp(idx));
end

[val,label] = min(residuals);

end
