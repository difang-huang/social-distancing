* ===========================
* Replication Code for Figure 1
* ===========================
  
import excel "data_figure1.xlsx", sheet("Plot") firstrow clear

set scheme plotplain
tostring Data, gen(Data1)
format Data %td
drop if Data <  td(20,2,2020)

twoway (connected Count_1 Data, msize(large) lwidth(medium)), ytitle(Count of States) xtitle(Date) title(Gathering Restrictions) yscale(range(0 60))  ylabel(0(10)60)
graph export figure1a.eps, replace	

twoway (connected Count_2 Data, msize(large) lwidth(medium)), ytitle(Count of States) xtitle(Date) title(School Closures) yscale(range(0 60)) ylabel(0(10)60)
graph export figure1b.eps, replace	

twoway (connected Count_3 Data, msize(large) lwidth(medium)), ytitle(Count of States) xtitle(Date) title(Restaurant Restrictions) yscale(range(0 60)) ylabel(0(10)60)
graph export figure1c.eps, replace	

twoway (connected Count_4 Data, msize(large) lwidth(medium)), ytitle(Count of States) xtitle(Date) title(Non-Essential Business Closures) yscale(range(0 60)) ylabel(0(10)60)
graph export figure1d.eps, replace	

twoway (connected Count_5 Data, msize(large) lwidth(medium)), ytitle(Count of States) xtitle(Date) title(Stay-At-Home Orders) yscale(range(0 60)) ylabel(0(10)60)
graph export figure1e.eps, replace	
 
