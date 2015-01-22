function [ ind,kk ] = chooseClasses( gt_ids,xp )

ind = [];

classes = unique(gt_ids);
kk=1;
for jj=1:size(classes,2)
    idx = gt_ids == classes(jj);
    if find(xp(idx)>0)
    %if find(abs(xp(idx))>0)
        ind(kk) = jj;
        kk = kk+1;
    end
end

end

