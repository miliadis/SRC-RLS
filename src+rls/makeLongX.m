function [ new_xp ] = makeLongX( size_table,kappa,gt_ids,classes,ind, xp_tmp )

new_xp = zeros(size_table,1);
max_col = 0;

for hh=1:kappa
    idx_columns = find(gt_ids == classes(ind(hh)));
    len = length(idx_columns);
    new_xp(idx_columns(1):max(idx_columns)) = xp_tmp(max_col+1:max_col+len);
    max_col = max_col+len;
end

end

