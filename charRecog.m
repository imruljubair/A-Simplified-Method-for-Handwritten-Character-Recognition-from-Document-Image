function charRecog()

delete files/base.xls
delete files/samples.xls

total_training_images = 286;
number_of_types = 26;
total_sample_images = 3;

trainingChar(total_training_images);

trainingData = load('files/base.xls');


testingChar(total_sample_images);

sampleData = load('files/samples.xls');

t = 64;

groupData = determineGroupChar(total_training_images, number_of_types, t);

classC = knnclassify(sampleData, trainingData, groupData);

disp(['After KNN classification ( groups for images ' int2str(1:total_sample_images) ' )']);

disp(classC);

figure;

for m = 1:total_sample_images
    X = imread(['samples3/' int2str(m) '.jpg']);
    subplot(1, total_sample_images, m);
    imshow(X);
    title(classC(m));
    
end

end