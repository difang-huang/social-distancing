* ===========================
* Replication Code for Figure 4
* ===========================

import delimited "data_figure4b.csv", encoding(ISO-8859-1) clear

set scheme plotplain

gen date1=date(date,"YMD")
format date1 %td
drop date
rename date1 date

encode state_name,gen(state1)
drop state_name
rename state1 state

xtset state date 

** Weekly Growth

by state: gen week_case_diff = log(1 + cum_cases - L7.cum_cases)

by state: gen week_death_diff = log(1 + cum_deaths - L7.cum_deaths)

by state: gen week_case_growth = week_case_diff - L7.week_case_diff

by state: gen week_death_growth = week_death_diff - L7.week_death_diff

** Daily Growth

by state: gen day_case_diff = log(1 + cum_cases - L.cum_cases)

by state: gen day_death_diff = log(1 + cum_deaths - L.cum_deaths)

by state: gen day_case_growth = day_case_diff - L.day_case_diff

by state: gen day_death_growth = day_death_diff - L.day_death_diff

keep if date <= td(20,4,2020)
keep if date >= td(20,2,2020)

export delimited "data_figure4b_new.csv", replace
