%Nearest neighbor training error rate is [0%].
%Nearest neighbor test error rate is [21%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess. Each guess is found
%by searching through Xtrain to find the closest row, and then 
%outputting its label.
function yguess = nearest_neighbor(Xtrain,ytrain,Xrun)
for i = 1:height(Xrun)
    for j = 1:height(Xtrain)
        D(j) = norm(Xrun(i,:) - Xtrain(j,:));
    end
    [M, smallestIndex] = min(D);
    yguess(i,1) = ytrain(smallestIndex);
end
end