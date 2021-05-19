data kick;
infile '/folders/myfolders/project_1/kick.csv' dlm=',' firstobs=2 dsd;

informat goal best12.;
informat launched ddmmyyyyw.;
informat  pledged best12.;
informat backers best12.;
informat usd_pledged_real best12.;
informat usd_goal_real best12.;
informat time_launched ;

input goal launched pledged backers usd_pledged_real usd_goal_real time_launched; 

data kick;
 set kick;
 drop launched time_launched;

/* Hypo testing */
 
proc sort data = kick;;
by goal;
run;

proc corr data=kick;
 var goal usd_goal_real ;
run;

proc corr data=kick;
 var pledged usd_pledged_real ;
run;


/* Regression */

proc reg data = kick;
	model backers = goal pledged usd_pledged_real usd_goal_real ;
run;

 
