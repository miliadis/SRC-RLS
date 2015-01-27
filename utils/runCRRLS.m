function [identity,resi] = runCRRLS( pars,test_ins )

table = pars.table;
y = test_ins;

xp = pars.P*y;

classes = unique(pars.gt);
for j = 1 : size(classes,2)
    idx = find(pars.gt == classes(j));
    %residuals(j) = norm(y-table(:,idx)*xp(idx),2)^2/sum(xp(idx).*xp(idx));
    residuals(j) = norm(y-table(:,idx)*xp(idx),2);
end

[val,identity] = min(residuals);
resi = residuals;

end

