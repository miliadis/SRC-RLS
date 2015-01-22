function [ V,P ] = makeVandP( groundtruth_train,trainData )

classes = unique(groundtruth_train);

for j = 1 : length(classes)
    idx = find(groundtruth_train == classes(j));    
    P(:,j) = mean(trainData(:,idx), 2);
    V(:,idx) = trainData(:,idx) - repmat(P(:,j),1,length(idx));    
end

end

