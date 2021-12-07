%Linear discriminant analysis training error rate is [1.2%].
%Linear discriminant analysis test error rate is [18%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the cat
%and dog sample mean vectors as well as the sample covariance matrix 
%(which is assumed to be equal for cats and dogs). 
%It also takes in a data matrix Xrun and produces a vector of
%label guesses yguess, corresponding to the ML rule for
%jointly Gaussian vectors with different means and the same 
%covariance matrix.
function yguess = lda(Xtrain,ytrain,Xrun)
[avgcat, avgdog] = average_pet(Xtrain,ytrain);
[dogIndex val] = find(ytrain == 1);
[catIndex val] = find(ytrain == -1);
dogMat = Xtrain(dogIndex,:);
catMat = Xtrain(catIndex,:);
covDog = cov(dogMat);
covCat = cov(catMat);
poolCov = 1/(length(ytrain)-2)*(length(find(ytrain == -1))*covCat + length(find(ytrain == 1))*covDog);
invPoolCov = pinv(poolCov);
term1 = invPoolCov*(transpose(avgdog) - transpose(avgcat));
term2 = avgdog*invPoolCov*transpose(avgdog) - avgcat*invPoolCov*transpose(avgcat);
for i = 1:height(Xrun)
    if (2*(Xrun(i,:))*term1) >= term2
        yguess(i,1) = 1;
    else
        yguess(i,1) = -1;
    end
end