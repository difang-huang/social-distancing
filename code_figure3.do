* ===========================
* Replication Code for Figure 3
* ===========================
 
** Daily

* (1) retail_and_recreation_percent_ch

import excel "data_figure3a.xlsx", sheet("Sheet1") firstrow clear
set scheme plotplain
format date %td
drop country_region_code country_region sub_region_2 metro_area census_fips_code
encode sub_region_1,gen(state)
xtset state date

keep if date <= td(20,4,2020)
keep if date >= td(15,2,2020)

preserve
collapse (p50) case_50= retail_and_recreation_percent_ch (p75) case_75 = retail_and_recreation_percent_ch (p25) case_25=retail_and_recreation_percent_ch, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Percentage Change) xtitle(Date) title(Evolution of Retail and Recreation) legend(off)
graph export figure3a.eps, replace	
restore

* (2) grocery_and_pharmacy_percent_cha
preserve
collapse (p50) case_50= grocery_and_pharmacy_percent_cha (p75) case_75 = grocery_and_pharmacy_percent_cha (p25) case_25=grocery_and_pharmacy_percent_cha, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Percentage Change) xtitle(Date) title(Evolution of Grocery and Pharmacy) legend(off)
graph export figure3b.eps, replace	
restore
 
* (3) workplaces_percent_change_from_b
preserve
collapse (p50) case_50= workplaces_percent_change_from_b (p75) case_75 = workplaces_percent_change_from_b (p25) case_25 = workplaces_percent_change_from_b, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Percentage Change) xtitle(Date) title(Evolution of Workplace Change) legend(off)
graph export figure3c.eps, replace	
restore

* (4) residential_percent_change_from_
preserve
collapse (p50) case_50 = residential_percent_change_from_ (p75) case_75 = residential_percent_change_from_ (p25) case_25 = residential_percent_change_from_, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Percentage Change) xtitle(Date) title(Evolution of Residential Change) legend(off)
graph export figure3d.eps, replace	
restore

* (5) PlaceIQ
import delimited "data_figure3b.csv", encoding(ISO-8859-1) clear

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
keep if date >= td(15,2,2020)
 
preserve
collapse (p50) case_50 = dex_a (p75) case_75 = dex_a (p25) case_25 = dex_a, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Number of Device Exposure) xtitle(Date) title(Evolution of Device Exposure Number) legend(off)
graph export figure3e.eps, replace	
restore

* (6) SafeGraph




** Weekly

* (1) retail_and_recreation_percent_ch

import excel "data_figure3a.xlsx", sheet("Sheet1") firstrow clear
set scheme plotplain
format date %td
drop country_region_code country_region sub_region_2 metro_area census_fips_code
encode sub_region_1,gen(state)
xtset state date

mvsumm retail_and_recreation_percent_ch, stat(sum) win(7) gen(data1) end
mvsumm grocery_and_pharmacy_percent_cha, stat(sum) win(7) gen(data2) end
mvsumm workplaces_percent_change_from_b, stat(sum) win(7) gen(data3) end
mvsumm residential_percent_change_from_, stat(sum) win(7) gen(data4) end

drop retail_and_recreation_percent_ch grocery_and_pharmacy_percent_cha parks_percent_change_from_baseli transit_stations_percent_change_ workplaces_percent_change_from_b residential_percent_change_from_
rename data1 retail_and_recreation_percent_ch
rename data2 grocery_and_pharmacy_percent_cha
rename data3 workplaces_percent_change_from_b
rename data4 residential_percent_change_from_

keep if date <= td(20,4,2020)
keep if date >= td(15,2,2020)

preserve
collapse (p50) case_50= retail_and_recreation_percent_ch (p75) case_75 = retail_and_recreation_percent_ch (p25) case_25=retail_and_recreation_percent_ch, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Percentage Change) xtitle(Date) title(Evolution of Retail and Recreation) legend(off)
graph export figure3g.eps, replace	
restore

* (2) grocery_and_pharmacy_percent_cha
preserve
collapse (p50) case_50= grocery_and_pharmacy_percent_cha (p75) case_75 = grocery_and_pharmacy_percent_cha (p25) case_25=grocery_and_pharmacy_percent_cha, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Percentage Change) xtitle(Date) title(Evolution of Grocery and Pharmacy) legend(off)
graph export figure3h.eps, replace	
restore
 
* (3) workplaces_percent_change_from_b
preserve
collapse (p50) case_50= workplaces_percent_change_from_b (p75) case_75 = workplaces_percent_change_from_b (p25) case_25 = workplaces_percent_change_from_b, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Percentage Change) xtitle(Date) title(Evolution of Workplace Change) legend(off)
graph export figure3i.eps, replace	
restore

* (4) residential_percent_change_from_
preserve
collapse (p50) case_50 = residential_percent_change_from_ (p75) case_75 = residential_percent_change_from_ (p25) case_25 = residential_percent_change_from_, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Percentage Change) xtitle(Date) title(Evolution of Residential Change) legend(off)
graph export figure3j.eps, replace	
restore

* (5) PlaceIQ
import delimited "data_figure3b.csv", encoding(ISO-8859-1) clear

set scheme plotplain

gen date1=date(date,"YMD")
format date1 %td
drop date
rename date1 date

encode state,gen(state1)
drop state
rename state1 state

xtset state date

mvsumm dex_a, stat(sum) win(7) gen(data1) end
drop dex_a
rename data1 dex_a

keep if date <= td(20,4,2020)
keep if date >= td(15,2,2020)
 
preserve
collapse (p50) case_50 = dex_a (p75) case_75 = dex_a (p25) case_25 = dex_a, by(date)
twoway rarea case_75 case_25 date, fcolor(gs8) ///
    || line case_50 date, lc(black) lw(medium)  /// 
    || line case_25 date, lc(gs8) lw(medium) /// 
    || line case_75 date, lc(gs8) lw(medium) /// 
    ||, ytitle(Number of Device Exposure) xtitle(Date) title(Evolution of Device Exposure Number) legend(off)
graph export figure3k.eps, replace	
restore

* (6) SafeGraph

