%Face dataset

load faceDataBase


[train, test] = crossvalind('holdOut',groups,0.80);

testData=data(test,:);
trainData=data(train,:);
trainClass=groups(train);
originalTestClass=groups(test);

% predictionClass = knnclassify(testData, trainData, trainClass);
% 
% cp = classperf(groups);
% classperf(cp,predictionClass,test);
% cp.CorrectRate
% 

%using PCA

[pc,co_ordinateOnPc,variance] = pca(trainData);


numValidPc=sum(variance>0);
[n,p] = size(testData);
testDataCenter = testData - repmat(mean(trainData,1),n,1); %subtract train mean image from test face
validPc=pc(:,1:numValidPc);



testDataOnPc=testDataCenter*validPc;
trainDataOnPc=co_ordinateOnPc(:,1:numValidPc);


testData=testDataOnPc(:,1:40);
trainData=trainDataOnPc(:,1:40);
trainClass=groups(train);
originalTestClass=groups(test);

predictionClass = knnclassify(testData, trainData, trainClass);

cp = classperf(groups);
classperf(cp,predictionClass,test);
cp.CorrectRate
