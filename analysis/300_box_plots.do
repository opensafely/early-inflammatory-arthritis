version 16

/*==============================================================================
DO FILE NAME:			Box plots
PROJECT:				EIA OpenSAFELY project
DATE: 					07/03/2022
AUTHOR:					J Galloway / M Russell
						adapted from C Rentsch										
DESCRIPTION OF FILE:	Box plots
DATASETS USED:			main data file
DATASETS CREATED: 		Box plots and outputs
OTHER OUTPUT: 			logfiles, printed to folder $Logdir
USER-INSTALLED ADO: 	 
  (place .ado file(s) in analysis folder)						
==============================================================================*/

**Set filepaths
*global projectdir "C:\Users\k1754142\OneDrive\PhD Project\OpenSAFELY\Github Practice"
global projectdir `c(pwd)'
di "$projectdir"

capture mkdir "$projectdir/output/figures"

global logdir "$projectdir/logs"
di "$logdir"

**Open a log file
cap log close
log using "$logdir/box_plots.log", replace

**Set Ado file path
adopath + "$projectdir/analysis/extra_ados"

**Use cleaned data from previous step
use "$projectdir/output/data/file_eia_all.dta", clear

set scheme plotplainblind

/*GP referral performance by region, all years===========================================================================*/

**For all the below, only using data for patients with rheumatology appt 
keep if rheum_appt_date!=.

preserve
gen qs1_0 =1 if time_gp_rheum_ref_appt<=3 & time_gp_rheum_ref_appt!=.
recode qs1_0 .=0 if time_gp_rheum_ref_appt!=.
gen qs1_1 =1 if time_gp_rheum_ref_appt>3 & time_gp_rheum_ref_appt<=7 & time_gp_rheum_ref_appt!=.
recode qs1_1 .=0 if time_gp_rheum_ref_appt!=.
gen qs1_2 = 1 if time_gp_rheum_ref_appt>7 & time_gp_rheum_ref_appt!=.
recode qs1_2 .=0 if time_gp_rheum_ref_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs1_0 (mean) qs1_1 (mean) qs1_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 days" 2 "Within 7 days" 3 "More than 7 days")) title("Time to rheumatology referral") name(regional_qs1_bar, replace)
graph export "$projectdir/output/figures/regional_qs1_bar_overall.svg", replace
restore

/*GP referral performance by region, Apr 2019 to Apr 2020===========================================================================*/

preserve
keep if appt_year==1
gen qs1_0 =1 if time_gp_rheum_ref_appt<=3 & time_gp_rheum_ref_appt!=.
recode qs1_0 .=0 if time_gp_rheum_ref_appt!=.
gen qs1_1 =1 if time_gp_rheum_ref_appt>3 & time_gp_rheum_ref_appt<=7 & time_gp_rheum_ref_appt!=.
recode qs1_1 .=0 if time_gp_rheum_ref_appt!=.
gen qs1_2 = 1 if time_gp_rheum_ref_appt>7 & time_gp_rheum_ref_appt!=.
recode qs1_2 .=0 if time_gp_rheum_ref_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs1_0 (mean) qs1_1 (mean) qs1_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 days" 2 "Within 7 days" 3 "More than 7 days")) title("Time to rheumatology referral") name(regional_qs1_bar, replace)
graph export "$projectdir/output/figures/regional_qs1_bar_2019.svg", replace
restore

/*GP referral performance by region, Apr 2020 to Apr 2021===========================================================================*/

preserve
keep if appt_year==2
gen qs1_0 =1 if time_gp_rheum_ref_appt<=3 & time_gp_rheum_ref_appt!=.
recode qs1_0 .=0 if time_gp_rheum_ref_appt!=.
gen qs1_1 =1 if time_gp_rheum_ref_appt>3 & time_gp_rheum_ref_appt<=7 & time_gp_rheum_ref_appt!=.
recode qs1_1 .=0 if time_gp_rheum_ref_appt!=.
gen qs1_2 = 1 if time_gp_rheum_ref_appt>7 & time_gp_rheum_ref_appt!=.
recode qs1_2 .=0 if time_gp_rheum_ref_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs1_0 (mean) qs1_1 (mean) qs1_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 days" 2 "Within 7 days" 3 "More than 7 days")) title("Time to rheumatology referral") name(regional_qs1_bar, replace)
graph export "$projectdir/output/figures/regional_qs1_bar_2020.svg", replace
restore

/*GP referral performance by region, Apr 2021 to Apr 2022===========================================================================*/

preserve
keep if appt_year==3
gen qs1_0 =1 if time_gp_rheum_ref_appt<=3 & time_gp_rheum_ref_appt!=.
recode qs1_0 .=0 if time_gp_rheum_ref_appt!=.
gen qs1_1 =1 if time_gp_rheum_ref_appt>3 & time_gp_rheum_ref_appt<=7 & time_gp_rheum_ref_appt!=.
recode qs1_1 .=0 if time_gp_rheum_ref_appt!=.
gen qs1_2 = 1 if time_gp_rheum_ref_appt>7 & time_gp_rheum_ref_appt!=.
recode qs1_2 .=0 if time_gp_rheum_ref_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs1_0 (mean) qs1_1 (mean) qs1_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 days" 2 "Within 7 days" 3 "More than 7 days")) title("Time to rheumatology referral") name(regional_qs1_bar, replace)
graph export "$projectdir/output/figures/regional_qs1_bar_2021.svg", replace
restore


/*
*Regional GP referral performance
preserve

graph hbox qs1, over(nuts_region) blabel(bar, color(black) position(inside) format(%9.4f)) title("Quality Standard 1: GP referral within 3 days") ytitle(Proportion meeting standard) saving("$projectdir/output/figures/regional_gpref_box.gph", replace) name(regional_gpref_box, replace)
restore
*/

*Rheum ref to appt performance by region, all years==========================================================================*/

preserve
gen qs2_0 =1 if time_ref_rheum_appt<=21 & time_ref_rheum_appt!=.
recode qs2_0 .=0 if time_ref_rheum_appt!=.
gen qs2_1 =1 if time_ref_rheum_appt>21 & time_ref_rheum_appt<=42 & time_ref_rheum_appt!=.
recode qs2_1 .=0 if time_ref_rheum_appt!=.
gen qs2_2 = 1 if time_ref_rheum_appt>42 & time_ref_rheum_appt!=.
recode qs2_2 .=0 if time_ref_rheum_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs2_0 (mean) qs2_1 (mean) qs2_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 weeks" 2 "Within 6 weeks" 3 "More than 6 weeks")) title("Time from rheumatology referral to assessment") name(regional_qs2_bar, replace)
graph export "$projectdir/output/figures/regional_qs2_bar_overall.svg", replace
restore

*Rheum ref to appt performance by region, Apr 2019 to Apr 2020==========================================================================*/

preserve
keep if appt_year==1
gen qs2_0 =1 if time_ref_rheum_appt<=21 & time_ref_rheum_appt!=.
recode qs2_0 .=0 if time_ref_rheum_appt!=.
gen qs2_1 =1 if time_ref_rheum_appt>21 & time_ref_rheum_appt<=42 & time_ref_rheum_appt!=.
recode qs2_1 .=0 if time_ref_rheum_appt!=.
gen qs2_2 = 1 if time_ref_rheum_appt>42 & time_ref_rheum_appt!=.
recode qs2_2 .=0 if time_ref_rheum_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs2_0 (mean) qs2_1 (mean) qs2_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 weeks" 2 "Within 6 weeks" 3 "More than 6 weeks")) title("Time from rheumatology referral to assessment") name(regional_qs2_bar, replace)
graph export "$projectdir/output/figures/regional_qs2_bar_2019.svg", replace
restore

*Rheum ref to appt performance by region, Apr 2020 to Apr 2021==========================================================================*/

preserve
keep if appt_year==2
gen qs2_0 =1 if time_ref_rheum_appt<=21 & time_ref_rheum_appt!=.
recode qs2_0 .=0 if time_ref_rheum_appt!=.
gen qs2_1 =1 if time_ref_rheum_appt>21 & time_ref_rheum_appt<=42 & time_ref_rheum_appt!=.
recode qs2_1 .=0 if time_ref_rheum_appt!=.
gen qs2_2 = 1 if time_ref_rheum_appt>42 & time_ref_rheum_appt!=.
recode qs2_2 .=0 if time_ref_rheum_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs2_0 (mean) qs2_1 (mean) qs2_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 weeks" 2 "Within 6 weeks" 3 "More than 6 weeks")) title("Time from rheumatology referral to assessment") name(regional_qs2_bar, replace)
graph export "$projectdir/output/figures/regional_qs2_bar_2020.svg", replace
restore

*Rheum ref to appt performance by region, Apr 2021 to Apr 2022==========================================================================*/

preserve
keep if appt_year==3
gen qs2_0 =1 if time_ref_rheum_appt<=21 & time_ref_rheum_appt!=.
recode qs2_0 .=0 if time_ref_rheum_appt!=.
gen qs2_1 =1 if time_ref_rheum_appt>21 & time_ref_rheum_appt<=42 & time_ref_rheum_appt!=.
recode qs2_1 .=0 if time_ref_rheum_appt!=.
gen qs2_2 = 1 if time_ref_rheum_appt>42 & time_ref_rheum_appt!=.
recode qs2_2 .=0 if time_ref_rheum_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs2_0 (mean) qs2_1 (mean) qs2_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 weeks" 2 "Within 6 weeks" 3 "More than 6 weeks")) title("Time from rheumatology referral to assessment") name(regional_qs2_bar, replace)
graph export "$projectdir/output/figures/regional_qs2_bar_2021.svg", replace
restore

*Last GP to rheum appt performance by region, all years==========================================================================*/

preserve
gen qs2_0 =1 if time_gp_rheum_appt<=21 & time_gp_rheum_appt!=.
recode qs2_0 .=0 if time_gp_rheum_appt!=.
gen qs2_1 =1 if time_gp_rheum_appt>21 & time_gp_rheum_appt<=42 & time_gp_rheum_appt!=.
recode qs2_1 .=0 if time_gp_rheum_appt!=.
gen qs2_2 = 1 if time_gp_rheum_appt>42 & time_gp_rheum_appt!=.
recode qs2_2 .=0 if time_gp_rheum_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs2_0 (mean) qs2_1 (mean) qs2_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 weeks" 2 "Within 6 weeks" 3 "More than 6 weeks")) title("Time from last GP appointment to rheumatology assessment") name(regional_qs2_bar_GP, replace)
graph export "$projectdir/output/figures/regional_qs2_bar_GP_overall.svg", replace
restore

*Last GP to rheum appt performance by region, Apr 2019 to Apr 2020==========================================================================*/

preserve
keep if appt_year==1
gen qs2_0 =1 if time_gp_rheum_appt<=21 & time_gp_rheum_appt!=.
recode qs2_0 .=0 if time_gp_rheum_appt!=.
gen qs2_1 =1 if time_gp_rheum_appt>21 & time_gp_rheum_appt<=42 & time_gp_rheum_appt!=.
recode qs2_1 .=0 if time_gp_rheum_appt!=.
gen qs2_2 = 1 if time_gp_rheum_appt>42 & time_gp_rheum_appt!=.
recode qs2_2 .=0 if time_gp_rheum_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs2_0 (mean) qs2_1 (mean) qs2_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 weeks" 2 "Within 6 weeks" 3 "More than 6 weeks")) title("Time from last GP appointment to rheumatology assessment") name(regional_qs2_bar_GP, replace)
graph export "$projectdir/output/figures/regional_qs2_bar_GP_2019.svg", replace
restore

*Last GP to rheum appt performance by region, Apr 2020 to Apr 2021==========================================================================*/

preserve
keep if appt_year==2
gen qs2_0 =1 if time_gp_rheum_appt<=21 & time_gp_rheum_appt!=.
recode qs2_0 .=0 if time_gp_rheum_appt!=.
gen qs2_1 =1 if time_gp_rheum_appt>21 & time_gp_rheum_appt<=42 & time_gp_rheum_appt!=.
recode qs2_1 .=0 if time_gp_rheum_appt!=.
gen qs2_2 = 1 if time_gp_rheum_appt>42 & time_gp_rheum_appt!=.
recode qs2_2 .=0 if time_gp_rheum_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs2_0 (mean) qs2_1 (mean) qs2_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 weeks" 2 "Within 6 weeks" 3 "More than 6 weeks")) title("Time from last GP appointment to rheumatology assessment") name(regional_qs2_bar_GP, replace)
graph export "$projectdir/output/figures/regional_qs2_bar_GP_2020.svg", replace
restore

*Last GP to rheum appt performance by region, Apr 2021 to Apr 2022==========================================================================*/

preserve
keep if appt_year==3
gen qs2_0 =1 if time_gp_rheum_appt<=21 & time_gp_rheum_appt!=.
recode qs2_0 .=0 if time_gp_rheum_appt!=.
gen qs2_1 =1 if time_gp_rheum_appt>21 & time_gp_rheum_appt<=42 & time_gp_rheum_appt!=.
recode qs2_1 .=0 if time_gp_rheum_appt!=.
gen qs2_2 = 1 if time_gp_rheum_appt>42 & time_gp_rheum_appt!=.
recode qs2_2 .=0 if time_gp_rheum_appt!=.

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) qs2_0 (mean) qs2_1 (mean) qs2_2, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 weeks" 2 "Within 6 weeks" 3 "More than 6 weeks")) title("Time from last GP appointment to rheumatology assessment") name(regional_qs2_bar_GP, replace)
graph export "$projectdir/output/figures/regional_qs2_bar_GP_2021.svg", replace
restore

*csDMARD shared care performance by region prescriptions, all years==========================================================================*/

preserve
*All patients must have 1) rheum appt 2) 12m+ follow-up after rheum appt 3) 12m+ of registration after appt 
**For RA, PsA and Undiff IA patients combined (not including AxSpA)
keep if has_12m_post_appt==1 & (ra_code==1 | psa_code==1 | undiff_code==1)
gen csdmard_0 =1 if time_to_csdmard<=90 & time_to_csdmard!=.
recode csdmard_0 .=0
gen csdmard_1 =1 if time_to_csdmard>90 & time_to_csdmard<=180 & time_to_csdmard!=.
recode csdmard_1 .=0
gen csdmard_2 = 1 if time_to_csdmard>180 & time_to_csdmard<=365 & time_to_csdmard!=.
recode csdmard_2 .=0 
gen csdmard_3 = 1 if time_to_csdmard>365 | time_to_csdmard==.
recode csdmard_3 .=0 

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) csdmard_0 (mean) csdmard_1 (mean) csdmard_2 (mean) csdmard_3, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 months" 2 "Within 6 months" 3 "Within 12 months" 4 "None within 12 months")) title("Time to first csDMARD in GP record") name(regional_csdmard_bar, replace)
graph export "$projectdir/output/figures/regional_csdmard_bar_overall.svg", replace
restore

*csDMARD shared care performance by region prescriptions, Apr 2019 to Apr 2020==========================================================================*/

preserve
*All patients must have 1) rheum appt 2) 12m+ follow-up after rheum appt 3) 12m+ of registration after appt 
**For RA, PsA and Undiff IA patients combined (not including AxSpA)
keep if has_12m_post_appt==1 & (ra_code==1 | psa_code==1 | undiff_code==1)
keep if diagnosis_year==1
gen csdmard_0 =1 if time_to_csdmard<=90 & time_to_csdmard!=.
recode csdmard_0 .=0
gen csdmard_1 =1 if time_to_csdmard>90 & time_to_csdmard<=180 & time_to_csdmard!=.
recode csdmard_1 .=0
gen csdmard_2 = 1 if time_to_csdmard>180 & time_to_csdmard<=365 & time_to_csdmard!=.
recode csdmard_2 .=0 
gen csdmard_3 = 1 if time_to_csdmard>365 | time_to_csdmard==.
recode csdmard_3 .=0 

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) csdmard_0 (mean) csdmard_1 (mean) csdmard_2 (mean) csdmard_3, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 months" 2 "Within 6 months" 3 "Within 12 months" 4 "None within 12 months")) title("Time to first csDMARD in GP record") name(regional_csdmard_bar, replace)
graph export "$projectdir/output/figures/regional_csdmard_bar_2019.svg", replace
restore

*csDMARD shared care performance by region prescriptions, Apr 2020 to Apr 2021==========================================================================*/

preserve
*All patients must have 1) rheum appt 2) 12m+ follow-up after rheum appt 3) 12m+ of registration after appt 
**For RA, PsA and Undiff IA patients combined (not including AxSpA)
keep if has_12m_post_appt==1 & (ra_code==1 | psa_code==1 | undiff_code==1)
keep if diagnosis_year==2
gen csdmard_0 =1 if time_to_csdmard<=90 & time_to_csdmard!=.
recode csdmard_0 .=0
gen csdmard_1 =1 if time_to_csdmard>90 & time_to_csdmard<=180 & time_to_csdmard!=.
recode csdmard_1 .=0
gen csdmard_2 = 1 if time_to_csdmard>180 & time_to_csdmard<=365 & time_to_csdmard!=.
recode csdmard_2 .=0 
gen csdmard_3 = 1 if time_to_csdmard>365 | time_to_csdmard==.
recode csdmard_3 .=0 

expand=2, gen(copy)
replace nuts_region = 0 if copy==1  

graph hbar (mean) csdmard_0 (mean) csdmard_1 (mean) csdmard_2 (mean) csdmard_3, over(nuts_region, relabel(1 "National")) stack ytitle(Proportion of patients) ytitle(, size(small)) ylabel(0.0 "0" 0.2 "0.2" 0.4 "0.4" 0.6 "0.6" 0.8 "0.8" 1.0 "1.0") legend(order(1 "Within 3 months" 2 "Within 6 months" 3 "Within 12 months" 4 "None within 12 months")) title("Time to first csDMARD in GP record") name(regional_csdmard_bar, replace)
graph export "$projectdir/output/figures/regional_csdmard_bar_2020.svg", replace
restore

log close