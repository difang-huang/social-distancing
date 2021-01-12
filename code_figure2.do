* ===========================
* Replication Code for Figure 2
* ===========================

import delimited "data_figure2.csv", encoding(ISO-8859-1) clear

set scheme plotplain

gen date1=date(date,"YMD")
format date1 %td
drop date
rename date1 date

encode state,gen(state1)
drop state
rename state1 state
xtset state date

keep if date <= td(20,4,2020)
keep if date >= td(20,2,2020)

* (1) daily new cases
preserve
collapse (p50) case_50= positiveincrease (p75) case_75 = positiveincrease (p25) case_25=positiveincrease, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Daily New Cases) xtitle(Date) title(NYT Daily New Cases) legend(off)
graph export figure2a.eps, replace	
restore

* (2) daily new deaths
preserve
collapse (p50) case_50= deathincrease (p75) case_75 = deathincrease (p25) case_25=deathincrease, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Daily New Deaths) xtitle(Date) title(NYT Daily New Deaths) legend(off)
graph export figure2b.eps, replace	
restore

* (3) weekly new cases

import delimited "data_figure2.csv", encoding(ISO-8859-1) clear

gen date1=date(date,"YMD")
format date1 %td
drop date
rename date1 date

encode state,gen(state1)
drop state
rename state1 state
xtset state date

mvsumm positiveincrease, stat(sum) win(7) gen(ma_cases) end
mvsumm deathincrease, stat(sum) win(7) gen(ma_deaths) end

keep if date <= td(20,4,2020)
keep if date >= td(20,2,2020)
 
preserve
collapse (p50) case_50= ma_cases (p75) case_75 = ma_cases (p25) case_25=ma_cases, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Weekly New Cases) xtitle(Date) title(NYT Weekly New Cases) legend(off)
graph export figure2c.eps, replace	
restore

* (4) weekly new deaths
preserve
collapse (p50) case_50= ma_deaths (p75) case_75 = ma_deaths (p25) case_25=ma_deaths, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Weekly New Deaths) xtitle(Date) title(NYT Weekly New Deaths) legend(off)
graph export figure2d.eps, replace	
restore
