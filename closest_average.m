%Closest average training error rate is [20%].
%Closest average test error rate is [19%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess, corresponding to whether
%each row of Xtest is closer to the average cat or average dog.
function yguess = closest_average(Xtrain,ytrain,Xrun)

[avgcatC avgdogD] = average_pet(Xtrain, ytrain);

% xrunLength = length(Xrun(:,1));
[rowXrun colXrun] = size(Xrun);
yguess = zeros(rowXrun, 1);

for i = 1:rowXrun 
    normCat = norm(Xrun(i,:) - avgcatC(1,:));
    normDog = norm(Xrun(i,:) - avgdogD(1,:));
    if normCat > normDog
        yguess(i) = 1;
    elseif normCat <= normDog
        yguess(i) = -1;
    end
end

%Your code should go above this line.
if (~iscolumn(yguess))
    error("yguess is not a column vector.")
elseif (length(yguess)~=size(Xrun,1))
    error("Length of yguess is not equal to the number of rows in Xrun.")
elseif (sum(unique(abs(ytrain))~=1))
    warning("Some elements in ytrain are not +1 or -1.")
elseif (sum(unique(abs(yguess))~=1))
    warning("Some elements in yguess are not +1 or -1.")
end
end