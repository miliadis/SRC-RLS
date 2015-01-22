function [ new_table ] = createNewTable( table,gt_ids,classes,ind, kappa )

new_table = [];
for aa=1:kappa
    idx_columns = find(gt_ids == classes(ind(aa)));    
    get_train = table(:,idx_columns(1):max(idx_columns));    
    new_table = [new_table get_train];    
end
end

