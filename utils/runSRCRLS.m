function [ identity,resi ] = runSRCRLS( pars,test_ins )

table = pars.table;
y = test_ins;

classes = unique(pars.gt);

%% FIRST RECOVERY
xp = solveX(table,y,1,pars.lambda_l1);

%% find the kappa smallest residuals and create new table
ind = chooseClasses( pars.gt,xp );
new_table = createNewTable( table,pars.gt,classes,ind,length(ind));

%% SECOND RECOVERY
xp_tmp = solveX(new_table,y,2,pars.lambda_ls);

%% make long X with nonzeros
new_xp = makeLongX( size(table,2),length(ind),pars.gt,classes,ind,xp_tmp(1:size(new_table,2)) );

%% find identity

classes = unique(pars.gt);
for j = 1 : size(classes,2)
    idx = find(pars.gt == classes(j));
    residuals(j) = norm(y-table(:,idx)*new_xp(idx),2);
end

[val,identity] = min(residuals);
resi = residuals;
