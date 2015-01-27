function [ train,test,accuracy,groundtruth_train,groundtruth_test] = initialize( data )

train = data.imgs(:,data.trainIdx);
test = data.imgs(:,data.testIdx);
groundtruth_train = data.gt(data.trainIdx);
groundtruth_test = data.gt(data.testIdx);
accuracy = zeros(size(groundtruth_test,2),1);

end

