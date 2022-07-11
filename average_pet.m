%This function takes in a data matrix X and a label
%vector y and outputs the average cat image and average dog image.
function [avgcat avgdog] = average_pet(X,y)

[rowX colX] = size(X);
catSum = zeros(1, colX);
dogSum = zeros(1, colX);

catCounter = 0;
dogCounter = 0;

for i = 1:length(y)
    if y(i) == -1
        catSum = catSum + X(i, :);
        catCounter = catCounter + 1;
    elseif y(i) == 1
        dogSum = dogSum + X(i, :);
        dogCounter = dogCounter + 1;
    end
end

avgcat = catSum/catCounter;
avgdog = dogSum/dogCounter;


%Your code should go above this line.
if (size(avgcat,1)~=1) 
    error("The variable avgcat is not a row vector.")
end
if (size(avgcat,2)~=size(X,2))
    error("The variable avgcat does not have the same number of columns as the data matrix input.")
end
if (size(avgdog,1)~=1) 
    error("The variable avgdog is not a row vector.")
end
if (size(avgdog,2)~=size(X,2)) 
    error("The variable avgdog does not have the same number of columns as the data matrix input.")
end
end