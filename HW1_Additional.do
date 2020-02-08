/* Type these commands to install the "estout" package: 

ssc install estout

Also: Note you can type help [command] into Stata to get help on any command. 
*/

* Read in data: 
insheet using assignment1-research-methods.csv, comma names clear
gen male_elite= malecandidate*eliteschoolcandidate

* Label your variables
label variable eliteschoolcandidate "Elite School"
label variable calledback "called back"
label variable recruiteriswhite "Recruiter Race"
label variable recruiterismale "Recruiter Gender"
label variable malecandidate "Candidate Gender"
label variable bigcompanycandidate "Company Size"
label variable male_elite "Candidate Gender * Elite School"



reg calledback eliteschoolcandidate
eststo regression_one 

reg calledback recruiteriswhite recruiterismale bigcompanycandidate malecandidate eliteschoolcandidate 
eststo regression_two 

reg calledback recruiteriswhite recruiterismale bigcompanycandidate malecandidate eliteschoolcandidate male_elite
eststo regression_three


**********************************
* FOR PEOPLE USING MICROSOFT: 
global tableoptions "bf(%15.2gc) sfmt(%15.2gc) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"
esttab regression_one regression_two regression_three using Elite-Experiment-Three-Table.rtf, $tableoptions keep(recruiteriswhite recruiterismale bigcompanycandidate malecandidate eliteschoolcandidate male_elite) 
