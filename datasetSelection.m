function [ data ] = datasetSelection( dataset,  rounds )

if strcmp(dataset,'yale')    
    load('YaleB_32x32_ivpl.mat');
    load(['data/YALE/YaleB_10train/' num2str(rounds) '.mat']);    
    data.imgs = imgs;
    data.gt = gtids;
    data.testIdx = testIdx;
    data.trainIdx = trainIdx;
    data.dataset = dataset;
end

if strcmp(dataset,'ar')    
    load('AR_32x32_ivpl.mat');
    load(['data/AR/AR_10Train/' num2str(rounds) '.mat']);    
    data.imgs = imgs;
    data.gt = gtids;
    data.testIdx = testIdx;
    data.trainIdx = trainIdx;
    data.dataset = dataset;
end

end

