function [ trainData,testData,V,Pmean,mean_x ] = goEigenface( disc_set,disc_value,mean_img,train,test,Vtmp,Ptmp )

% % steps 1 and 2: find the mean image and the mean-shifted input images
%mean_face_train = mean(train, 2);
%train = train - repmat(mean_face_train, 1, size(train,2));

%train = normc(train);
%test = normc(test);

trainData  =  disc_set'*train;

%mean_face_test = mean(test, 2);
%test = test - repmat(mean_face_train, 1, size(test,2));
testData  =  disc_set'*test;

%mean_face_V = mean(Vtmp, 2);
%Vtmp = Vtmp - repmat(mean_face_V, 1, size(Vtmp,2));
V = disc_set'*Vtmp;

Pmean = disc_set'*Ptmp;

mean_x       =    disc_set'*mean_img;

end

