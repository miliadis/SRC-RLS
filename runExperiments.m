% =========================================================================
%   Michael Iliadis, Leonidas Spinoulas, Albert Berahas, Haohong Wang and
%   Aggelos K. Katsaggelos
%
%
% Written by Michael Iliadis @ NU-IVPL
% March, 2014.
% =========================================================================

clearvars;
clc;
close all;

%% PARAMETERS
method = 'src+rls'; % 'cr-rls', 'esrc', 'src+rls'
dataset = 'yale'; % 'yale' or 'ar'

%% START EXPERIMENTAL ROUNDS
fr.numberOfRounds = 10;
fr.dataset = dataset;
fr.method = method;
for rounds=1:fr.numberOfRounds
    
    %% Dataset selection
    data = datasetSelection(fr.dataset,rounds);
    
    %% Initializations
    [train,test,accuracy,groundtruth_train,groundtruth_test] = ...
        initialize( data);
    
    %% Normalize data
    store_normz = normalize_data(groundtruth_train,train,test);
    
    %% Create method's parameters
    pars = parSelection(fr.method,groundtruth_train,store_normz);
    
    %% RUN Face Recognition
    parfor ii=1:size(store_normz.testData,2)
        warning('off','all');
        
        test = store_normz.testData(:,ii);
        [label,residuals] = runFR(method,pars,test);
        
        % Create accuracy
        if label==groundtruth_test(ii)
            accuracy(ii) = 1;
            fprintf('%d right!\n', ii);
        else
            fprintf('%d wrong! %d place: %d\n', ii,groundtruth_test(ii),find(groundtruth_test(ii)==residuals));
        end
    end
    
    acc(rounds) = mean(accuracy);
    fprintf('%d round rec. rate %.2f\n', rounds,acc(rounds)*100);
end

%% PRINT FINAL RECOGNITION RATE
meanAcc = mean(acc);
stdAcc = std(acc);
fprintf('Recognition rate: %.2f and Std: %.2f\n', meanAcc*100,stdAcc*100);