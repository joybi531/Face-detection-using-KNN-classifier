load('faceDataBase.mat','-mat');

%predictionClass = knnclassify(featuresTest, featuresTrain, classTrain);

kNNmodel = fitcknn(featuresTrain, classTrain,'NumNeighbors',10);
predictionClass=predict(kNNmodel,featuresTest);

cp = classperf(classTest,predictionClass);
cp.CorrectRate