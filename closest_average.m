%Closest average training error rate is [19%].
%Closest average test error rate is [20%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess, corresponding to whether
%each row of Xtest is closer to the average cat or average dog.
function yguess = closest_average(Xtrain,ytrain,Xrun)
[avgcat, avgdog] = average_pet(Xtrain,ytrain);
yguess = zeros(height(Xrun),1);
for i = 1:height(Xrun)
    Dcat = norm(Xrun(i,:) - avgcat);
    Ddog = norm(Xrun(i,:) - avgdog);
    if Dcat > Ddog
        yguess(i,1) = 1;
    elseif Dcat <= Ddog
        yguess(i,1) = -1;
    end
end