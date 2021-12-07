%This function takes in a data matrix X and a label
%vector y and outputs the average cat image and average dog image.
function [avgcat, avgdog] = average_pet(X,y)
cat = find(y==-1);
dog = find(y==1);
avgcat = mean(X([transpose(cat)],:));
avgdog = mean(X([transpose(dog)],:));