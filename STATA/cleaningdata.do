clear
cd "/Users/akim/Documents/Data for DataFest 2019/"
set more off 	
clear
/*
import delimited rpe
save "rpe.dta", replace
import delimited wellness, clear
save "wellness.dta", replace
import delimited standardized_fatigue_scores_v2, clear
save "standardized_fatigue_scores_v2.dta", replace
use "standardized_fatigue_scores_v2.dta", clear

save "standardized_fatigue_scores_v2.dta", replace
*/


use "rpe.dta", clear
merge m:m date playerid using "wellness.dta"
rename _merge _merge1
save "combined.dta", replace
use "combined.dta", clear
drop fatigue
merge m:m playerid date using "standardized_fatigue_scores_v2.dta"
drop if _merge1!= 3
drop _merge1
drop if acuteload=="NA"
save "combined.dta", replace

use "combined.dta", clear
drop _merge
drop if training =="no"
drop training
drop sessiontype duration rpe sessionload dailyload acuteload chronicload objectiverating focusrating bestoutofmyself soreness desire bedtime waketime monitoringscore nutritionadjustment usgmeasurement usg trainingreadiness
save "updated.dta", replace
use "updated.dta", clear



