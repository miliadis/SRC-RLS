function [ store_normz ] = normalize_data( groundtruth_train,train,test )

%% create esrc data
[V,P] = makeVandP( groundtruth_train,train );

%% go to eigenfaces
[disc_set,disc_value,mean_img]  =  eigenFace(train,300);
[trainData,testData,V,P,mean_img] = goEigenface(disc_set,disc_value,mean_img,train,test,V,P);

store.trainData = trainData;
store.testData = testData;
store.V = V;
store.P = P;

%% normalize data to l2-norm
store_normz = normalizel2(store);


end

