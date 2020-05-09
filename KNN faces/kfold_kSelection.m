load faceDataBase

features =featuresTrain;
class = classTrain;

together = [features class];
[r2,c2]=size(together);
shuf = randperm(r2);
together = together(shuf,:);

features = together(:,1:10304);
class = together(:, 10305:10305);

[r, c] = size(features);
test = zeros(r,1);
train = test;

train = boolean(train);
test = boolean(test);

foldno = 72;
foldsize = r/foldno;

for i=1:r
    train(i,1)=1;
end

max = 0.00;
maxk = 0.00;
for k=1:15
    acc = 0.00;
    for i=1:foldno
        for j = 1:foldsize
            train((i-1)*foldsize+j,1) = 0;
            test((i-1)*foldsize+j,1) = 1;
        end
            
        featuresTrain2 = features(train,:);
        classTrain2 = class(train,:);
        
        featuresTest2 = features(test,:);
        classTest2 = class(test,:);
        
        kNNmodel = fitcknn(featuresTrain2, classTrain2,'NumNeighbors',k);
        predicted = predict(kNNmodel, featuresTest2);
        
        
        cp = classperf(class);
        classperf(cp, predicted, test);
        acc = acc+cp.CorrectRate;
          
        for j = 1:foldsize
            train((i-1)*foldsize+j,1) = 1;
            test((i-1)*foldsize+j,1) = 0;
        end
    end
    
    ans3 = acc/double(foldno);
    
    if (ans3 > max)
        max = ans3;
        maxk = k;
    end
    
    disp(sprintf('k = %d, acc = %0.6f, ans = %0.6f', k, acc, ans3));
end
sprintf('best k = %d, accuracy for that k = %6f', maxk, max)