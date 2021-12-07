%Perceptron training error rate is [0%]
%Perceptron test error rate is [20%]

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to the decision rule corresponding
%to a very simple one-layer neural network: the perceptron. 
%It also takes in a data matrix Xrun and produces a vector of label
%guesses yguess, corresponding to the sign of the linear prediction.
function yguess = perceptron(Xtrain,ytrain,Xrun)
term1 = pinv(transpose(Xtrain)*Xtrain)*transpose(Xtrain)*ytrain;
for i = 1:height(Xrun)
    if Xrun(i,:)*term1 >= 0
        yguess(i,1) = 1;
    else
        yguess(i,1) = -1;
    end
end
end