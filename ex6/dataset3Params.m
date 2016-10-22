function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% Initialize error variable with a very big value, also error = inf; is correct
error = 100000000000000;

x1 = [1 2 1]; x2 = [0 4 -1];

% Set up the values of C and sigma i want to try.
temp1 = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];	

% Train and evaluate (on cross validation set) for all the values of C and sigma
% and choose those values, which give you the min error on the validation set.
for i = 1:size(temp1)
	C_check = temp1(i);
	for j = 1:size(temp1)
		sigma_check = temp1(j);
		model= svmTrain(X, y, C_check, @(x1, x2) gaussianKernel(x1, x2, sigma_check));
		predictions = svmPredict(model, Xval);
		error_check = mean(double(predictions ~= yval))
		if (error_check < error)
			error = error_check;
			C = C_check;
			sigma = sigma_check;
		end
	end	
end

% =========================================================================

end
