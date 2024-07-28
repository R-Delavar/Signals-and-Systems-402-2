%data = readtable('diabetes-training.csv'); 
data = readtable('diabetes-validation.csv'); 

features = data(:, 1:end-1); 
trueLabels = table2array(data(:, end)); 
predictedLabels = trainedModel.predictFcn(features);

correctPredictions = predictedLabels == trueLabels;

accuracy = sum(correctPredictions) / size(data, 1);

disp(['Accuracy: ', num2str(accuracy * 100), '%']);
