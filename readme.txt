Sparse Representation and Least Squares-Based Classification in Face Recognition

This is the code to reproduce the results of the paper 
"Sparse Representation and Least Squares-Based Classification in Face Recognition"
published in EUSIPCO 2014

---------------------------------------------------------------------------
Usage:

1) add to the path the entire "SRC-RLS" folder
2) run "runExperiments.mat"

---------------------------------------------------------------------------
More info:

By default the experiments reproduce the SRC+RLS results on YaleB dataset.
Data of YaleB and AR are provided to reproduce the results of the paper

If you want to choose another dataset change the variable "dataset" 
If you want to choose another FR classifier change the variable "method"

---------------------------------------------------------------------------
Adding your own Face Recognition classifier:

If you want to add your classifier, modify:

runFR.m:  add another if statement for your classifier, and provide the code 
	  of your classifier. Output should be the label of the identity estimated
          by the classifier		

pasSelection.m:   add another if for your classifier and specify the necessary 
                  parameters.

---------------------------------------------------------------------------

BSD Licence. 