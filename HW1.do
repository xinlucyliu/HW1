/* Type these commands to install the "estout" package: 

ssc install estout

Also: Note you can type help [command] into Stata to get help on any command. 
*/

* Read in data: 
insheet using assignment1-research-methods.csv, comma names clear

* Label your variables
label variable EliteSchoolCandidate "Elite School"
label variable calledback "called back"
label variable malecandidate "Candidate Gender"

* Run regression: 
reg calledback EliteSchoolCandidate malecandidate

* Store regression
eststo regression_two


**********************************
* FOR PEOPLE USING MICROSOFT: 
global tableoptions "bf(%15.2gc) sfmt(%15.2gc) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"
esttab regression_two using Elite-Experiment-Table-two.rtf, $tableoptions keep(EliteSchoolCandidate malecandidate) 
