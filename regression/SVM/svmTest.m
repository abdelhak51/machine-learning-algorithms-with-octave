
clear; close all; clc;

%% loading and dividing the dataset
data = xlsread('myData.xlsx');
X=data(:,1:8);
y1=data(:,9);
y2=data(:,10);
indx=randperm(768);
X_train=X(indx(1:538),:);
Y1_trainLabels=y1(indx(1:538),:);
Y2_trainLabels=y2(indx(1:538),:);
X_test=X(indx(539:end),:);
Y1_testLabels=y1(indx(539:end),:);
Y2_testLabels=y2(indx(539:end),:);

%% CV partition
c1 = cvpartition(Y1_trainLabels,'KFold','Stratify',true);
c2 = cvpartition(Y2_trainLabels,'KFold','Stratify',true);

%% feature selection
opts = statset('display','iter');
regF1 = @(X_train, Y1_trainLabels, X_test, Y1_testLabels)...
    sum(predict(fitrsvm(X_train, Y1_trainLabels,'KernelFunction','gaussian'), X_test) ~= Y1_testLabels);

[fs, history] = sequentialfs(regF1, X_train, Y1_trainLabels, 'cv', c1, 'options', opts,'nfeatures',4);
%% Best hyperparameter
X_train_w_best_feature = X_train(:,fs);
Md1 = fitrsvm(X_train_w_best_feature,Y1_trainLabels,'KernelFunction','gaussian','OptimizeHyperparameters','auto',...
      'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
      'expected-improvement-plus','ShowPlots',true));

regF2 = @(X_train, Y2_trainLabels, X_test, Y2_testLabels)...
    sum(predict(fitrsvm(X_train, Y2_trainLabels,'KernelFunction','gaussian'), X_test) ~= Y2_testLabels);

[fs1, history] = sequentialfs(regF2, X_train, Y2_trainLabels, 'cv', c2, 'options', opts,'nfeatures',4);

X_train_w_best_feature = X_train(:,fs1);

Md2 = fitrsvm(X_train_w_best_feature,Y2_trainLabels,'KernelFunction','gaussian','OptimizeHyperparameters','auto',...
      'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
      'expected-improvement-plus','ShowPlots',true));

%% Final test with test set
X_test_w_best_feature = X_test(:,fs);
test_accuracy_1 = sum((predict(Md1,X_test_w_best_feature) == Y1_testLabels))/length(Y1_testLabels)*100

X_test1_w_best_feature = X_test(:,fs1);
test_accuracy_2 = sum((predict(Md2,X_test1_w_best_feature) == Y2_testLabels))/length(Y2_testLabels)*100
