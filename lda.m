%Linear discriminant analysis training error rate is [0.88%].
%Linear discriminant analysis test error rate is [24%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the cat
%and dog sample mean vectors as well as the sample covariance matrix 
%(which is assumed to be equal for cats and dogs). 
%It also takes in a data matrix Xrun and produces a vector of
%label guesses yguess, corresponding to the ML rule for
%jointly Gaussian vectors with different means and the same 
%covariance matrix.
function yguess = lda(Xtrain,ytrain,Xrun)

[rowXrun colXrun] = size(Xrun);
yguess = zeros(rowXrun, 1);

ntrain = length(ytrain);

ntrainCat = 0;
ntrainDog = 0;
% 
for i = 1:ntrain
    if ytrain(i) == -1
        ntrainCat = ntrainCat + 1;
    elseif ytrain(i) == 1
        ntrainDog = ntrainDog + 1;
    end
end

catMatrix = Xtrain(find(ytrain == 1), :);
dogMatrix = Xtrain(find(ytrain == -1), :);

covCat = cov(catMatrix);
covDog = cov(dogMatrix);
covMatrix = (1/(ntrain - 2)) * (((ntrainCat - 1) * covCat) + ((ntrainDog - 1) * covDog));
inverse_covMatrix = pinv(covMatrix);

[avgcatC avgdogD] = average_pet(Xtrain,ytrain);

leftLDA = 2 * inverse_covMatrix * transpose(avgdogD - avgcatC);
rightLDA = (avgdogD * inverse_covMatrix * transpose(avgdogD)) - (avgcatC * inverse_covMatrix * transpose(avgcatC));

for j = 1:rowXrun
    if Xrun(j,:) * leftLDA >= rightLDA
        yguess(j,1) = 1;
    elseif Xrun(j,:) * leftLDA < rightLDA
        yguess(j,1) = -1;
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