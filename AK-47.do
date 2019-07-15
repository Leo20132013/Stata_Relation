Program Start




***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
*closing date stock price 
use "F:\Research\Compustat\Compustat_Global\Compustat_Global_Security_Daily_1985_2017.dta" ,clear
gen month=month(datadate)
gen year=year(datadate)
gen day=day(datadate)
*去重
bysort gvkey year month day: drop if day==day[_n-1]

gsort gvkey year month -day
by gvkey year month: gen lastday=_n==1

sort gvkey year month day
*计算月回报
gen month_ret=ret if lastday==1
set more off
forval i=1/30{
	by gvkey year month: replace month_ret=(month_ret+1)*(ret[_n-`i']+1)-1 if lastday==1 & ret[_n-`i']!=.
	}

	
keep if lastday==1
keep gvkey sedol prccd month year month_ret
destring gvkey, replace

*生成的是啥？bysort gvkey & month 之后每个企业都只有一个样本，生成的 l_prccd 肯定是空值呀？
sort gvkey month year
by gvkey month: gen l_prccd= prccd[_n-1] if year==year[_n-1]
sort gvkey year month
save "D:\Dropbox\Research\withJeff\UK_Audit_Rick_Disclosure\data\Compustat_Global_Security_Monthly_Return_1985_2017.dta" , replace




***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
use "D:\Dropbox\Research\withJeff\UK_Audit_Rick_Disclosure\data\data.dta", clear
rename Gvkey gvkey
bys gvkey year: keep if _n==1
keep gvkey year
sort gvkey year
save "D:\Dropbox\Research\withJeff\UK_Audit_Rick_Disclosure\data\UK_sample_only.dta", replace



***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
*Discretionary Accruals
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
use "E:\Research\Basic_Database\Compustat\Compustat_Global\Compustat_Global_Annual_1985_2018.dta", clear

keep if curcd=="GBP"/*Select only specific country*/ 
gen year=year(datadate)
gen month=month(datadate)
destring gvkey, replace
sort gvkey year month 
merge gvkey year month using "D:\Dropbox\Research\withJeff\UK_Audit_Rick_Disclosure\Compustat_Global_Security_Monthly_Return_1985_2017.dta" 
drop if _merge==2
drop _merge


*设定为面板数据并剔除重复值
sort gvkey year
by gvkey year: drop if year==year[_n-1]
tsset gvkey year



sort gvkey  year
*at: Assets - Total
*l_at: 前一期总资产
by gvkey: gen l_at=at[_n-1] if year==year[_n-1]+1
*intercepet: 前一期总资产倒数
by gvkey: gen intercept=1/l_at
*sale: Sales / Turnover(net)
by gvkey: gen sale1=sale /l_at
by gvkey: gen d_sale=(sale -sale[_n-1])/l_at if year==year[_n-1]+1
by gvkey: gen d2_sale=(sale[_n-1]-sale[_n-2])/l_at if year==year[_n-1]+1

*cogs: cost of goods sold
*invt: Inventories - Total
by gvkey: gen prod=(cogs +invt -invt[_n-1])/l_at if year==year[_n-1]+1
*xrd: Research and Development Expense
*xsga: Selling, General and Administrative Expense
by gvkey: gen disx=( xrd +xsga )/l_at
by gvkey: gen l_sale=sale[_n-1]/l_at if year==year[_n-1]+1
*Property, Plant and Equipment - Total(net)
by gvkey: gen ppe=ppent /l_at
*rect: Receivables - Total
by gvkey: gen d_ar=(rect -rect[_n-1])/l_at if year==year[_n-1]+1
gen sale_ar=d_sale-d_ar

*act: Current Assets - Total
*che: Cash and short-term investments
*lct: current liability - Total
*dp: depreciation and amortization
by gvkey: gen tca=((act -act[_n-1])-(che -che[_n-1])-(lct -lct[_n-1])-dp )/l_at if year==year[_n-1]+1

*ib: income before extraordinary items
*oancf: operating activities - Net cash flow
by gvkey: gen ta_ib=(ib-oancf) /l_at if year==year[_n-1]+1

by gvkey: gen roa=ib/l_at if year==year[_n-1]+1
by gvkey: gen l_roa=ib[_n-1]/l_at[_n-1] if year==year[_n-1]+1


local list l_at intercept sale1 d_sale d2_sale prod disx l_sale ppe d_ar sale_ar tca ta_ib   roa l_roa
foreach x of local list{
	winsor `x', p(0.01) gen(w`x')
	}

	
destring	gsector, replace
destring sic, replace
nsplit sic, digit(2 2)	

keep if wta_ib!=.& wintercept!=.& wd_sale!=.& wppe !=.
	
bys gsector year: gen N=_N
keep if N>=10	
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
sort gvkey year
save annual_discretionary_Accrual_base.dta, replace	

	

/***************************************************/
/***************Getting Coefficients****************/
/***************************************************/
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
set more off
use annual_discretionary_Accrual_base.dta, clear
sort gsector year
set more off
*计算 da
*神命令！
statsby _b, by( gsector year): reg wta_ib wintercept wd_sale wppe  
sort gsector year
save da_gsector.dta, replace

cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
set more off
use annual_discretionary_Accrual_base.dta, clear
sort gsector year
set more off
statsby _b, by( gsector year): reg wtca  wintercept wd_sale wppe  
sort gsector year
save tca_gsector.dta, replace
	
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
set more off
use annual_discretionary_Accrual_base.dta, clear
sort gsector year
set more off
statsby _b, by( gsector year): reg wta_ib  wintercept wsale_ar wppe  wroa
sort gsector year
save modified_da_gsector.dta, replace	




/************************************************************/
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
use annual_discretionary_Accrual_base.dta, clear
sort gsector year
*每个行业 & 年度 都对应一组 coefficient
merge gsector year using da_gsector.dta
gen da_ib=wta_ib-(_b_cons+ _b_wintercept*wintercept+wd_sale*_b_wd_sale +wppe*_b_wppe )
keep gvkey year gsector da_ib   roa l_roa  
sort gvkey year
save da_gsector_final.dta, replace

cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
use annual_discretionary_Accrual_base.dta, clear
sort gsector year
merge gsector year using tca_gsector.dta
gen da_tca=wtca  - (_b_cons+ _b_wintercept*wintercept+wd_sale*_b_wd_sale +wppe*_b_wppe)
keep gvkey year gsector da_tca roa l_roa
sort gvkey year
save tca_gsector_final.dta, replace

*是不是算错了
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
use annual_discretionary_Accrual_base.dta, clear
sort gsector year
merge gsector year using modified_da_gsector.dta
gen modified_da_ib=wta_ib- (_b_cons+ _b_wintercept*wintercept+wsale_ar*_b_wsale_ar +wppe*_b_wppe )
keep gvkey year gsector modified_da_ib roa l_roa
sort gvkey year
save modified_da_gsector_final.dta, replace


*************************************************************************
*************************************************************************
*************************************************************************
*************************************************************************
*************************************************************************
 
 *Discretionary Accruals - Based on SIC Two Digits
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
use "E:\Research\Basic_Database\Compustat\Compustat_Global\Compustat_Global_Annual_1985_2018.dta", clear

keep if curcd=="GBP"/*Select only specific country*/ 

gen year=year(datadate)
gen month=month(datadate)
destring gvkey, replace
sort gvkey year month 
merge gvkey year month using "D:\Dropbox\Research\withJeff\UK_Audit_Rick_Disclosure\Compustat_Global_Security_Monthly_Return_1985_2017.dta" 
drop if _merge==2
drop _merge



sort gvkey year
by gvkey year: drop if year==year[_n-1]
tsset gvkey year



sort gvkey  year
by gvkey: gen l_at=at[_n-1] if year==year[_n-1]+1
by gvkey: gen intercept=1/l_at
by gvkey: gen sale1=sale /l_at
by gvkey: gen d_sale=(sale -sale[_n-1])/l_at if year==year[_n-1]+1
by gvkey: gen d2_sale=(sale[_n-1]-sale[_n-2])/l_at if year==year[_n-1]+1
by gvkey: gen prod=(cogs +invt -invt[_n-1])/l_at if year==year[_n-1]+1
by gvkey: gen disx=( xrd +xsga )/l_at
by gvkey: gen l_sale=sale[_n-1]/l_at if year==year[_n-1]+1
by gvkey: gen ppe=ppent /l_at
by gvkey: gen d_ar=(rect -rect[_n-1])/l_at if year==year[_n-1]+1
gen sale_ar=d_sale-d_ar
by gvkey: gen tca=((act -act[_n-1])-(che -che[_n-1])-(lct -lct[_n-1])-dp )/l_at if year==year[_n-1]+1
by gvkey: gen ta_ib=(ib-oancf) /l_at if year==year[_n-1]+1
by gvkey: gen roa=ib/l_at if year==year[_n-1]+1
by gvkey: gen l_roa=ib[_n-1]/l_at[_n-1] if year==year[_n-1]+1


local list l_at intercept sale1 d_sale d2_sale prod disx l_sale ppe d_ar sale_ar tca ta_ib   roa l_roa
foreach x of local list{
	winsor `x', p(0.01) gen(w`x')
	}

	
destring	gsector, replace
destring sic, replace
nsplit sic, digit(2 2)	

keep if wta_ib!=.& wintercept!=.& wd_sale!=.& wppe !=.
	
bys sic1 year: gen N=_N
*行业公司数大于10
keep if N>=10	
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
sort gvkey year
save annual_discretionary_Accrual_SIC1_base.dta, replace	



/***************************************************/
/***************Getting Coefficients****************/
/***************************************************/


cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
set more off
use annual_discretionary_Accrual_SIC1_base.dta, clear
sort sic1 year
set more off
statsby _b, by( sic1 year): reg wta_ib wintercept wd_sale wppe  
sort sic1 year
save da_sic1.dta, replace

cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
set more off
use annual_discretionary_Accrual_SIC1_base.dta, clear
sort sic1 year
set more off
statsby _b, by( sic1 year): reg wtca  wintercept wd_sale wppe  
sort sic1 year
save tca_sic1.dta, replace
	
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
set more off
use annual_discretionary_Accrual_SIC1_base.dta, clear
sort sic1 year
set more off
statsby _b, by( sic1 year): reg wta_ib  wintercept wsale_ar wppe  wroa
sort sic1 year
save modified_da_sic1.dta, replace	


/************************************************************/
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
use annual_discretionary_Accrual_SIC1_base.dta, clear
sort sic1 year
merge sic1 year using da_sic1.dta
gen da_ib_sic1=wta_ib-(_b_cons+ _b_wintercept*wintercept+wd_sale*_b_wd_sale +wppe*_b_wppe )
keep gvkey year sic1 da_ib   roa l_roa  
sort gvkey year
save da_sic1_final.dta, replace

cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
use annual_discretionary_Accrual_SIC1_base.dta, clear
sort sic1 year
merge sic1 year using tca_sic1.dta
gen da_tca_sic1=wtca  - (_b_cons+ _b_wintercept*wintercept+wd_sale*_b_wd_sale +wppe*_b_wppe)
keep gvkey year sic1 da_tca   roa l_roa  
sort gvkey year
save tca_sic1_final.dta, replace

*计算有问题？
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
use annual_discretionary_Accrual_SIC1_base.dta, clear
sort sic1 year
merge sic1 year using modified_da_sic1.dta
gen modified_da_ib_sic1=wta_ib- (_b_cons+ _b_wintercept*wintercept+wsale_ar*_b_wsale_ar +wppe*_b_wppe )
keep gvkey year sic1 modified_da_ib   roa l_roa  
sort gvkey year
save modified_da_sic1_final.dta, replace

 
*************************************************************************
*************************************************************************
 
/********************************************************/
/*			Merging All Measures 						*/
/********************************************************/

cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"

use da_gsector_final,clear
local list tca_gsector_final modified_da_gsector_final da_sic1_final tca_sic1_final modified_da_sic1_final
foreach x of local list{
	sort gvkey year
	merge gvkey year using `x'
	drop if _merge==2
	drop _merge
	}
sort gvkey year	
save 	Discretionary_accrual_Global_Annual, replace


/********************************************************/
/*			Performance Matched DA 						*/
/********************************************************/
cd "E:\Research\Basic_Database\Discretionary_Accruals\Global_Annual"
use Discretionary_accrual_Global_Annual, clear
sort gsector year roa

local list  da_ib da_tca modified_da_ib
foreach x of local list{
	by gsector year: gen lpm_`x'=`x'[_n-1]
	by gsector year: gen fpm_`x'=`x'[_n+1]
	gen d_`x'_lpm=abs(`x'-lpm_`x')
	gen d_`x'_fpm=abs(`x'-fpm_`x')
	}
	
local list  da_ib da_tca modified_da_ib
foreach x of local list{
	gen pm_`x'3=lpm_`x' if d_`x'_lpm<d_`x'_fpm
	replace pm_`x'3=fpm_`x' if d_`x'_lpm>=d_`x'_fpm
	*先选择同年度同行业中业绩最相近的两家企业，da差异熟小，作为基准进行调整！
	gen pm_`x'_gsector=`x'-pm_`x'3
	drop pm_`x'3
	}

drop lpm_da_ib - d_modified_da_ib_fpm 
	
local list da_ib_sic1 da_tca_sic1 modified_da_ib_sic1
foreach x of local list{
	by gsector year: gen lpm_`x'=`x'[_n-1]
	by gsector year: gen fpm_`x'=`x'[_n+1]
	gen d_`x'_lpm=abs(`x'-lpm_`x')
	gen d_`x'_fpm=abs(`x'-fpm_`x')
	}
	
local list da_ib_sic1 da_tca_sic1 modified_da_ib_sic1
foreach x of local list{
	gen pm_`x'3=lpm_`x' if d_`x'_lpm<d_`x'_fpm
	replace pm_`x'3=fpm_`x' if d_`x'_lpm>=d_`x'_fpm
	gen pm_`x'=`x'-pm_`x'3
	drop pm_`x'3
	}
	 
drop lpm_da_ib_sic1- d_modified_da_ib_sic1_fpm

	
keep gvkey year roa l_roa  da_ib da_tca modified_da_ib da_ib_sic1 da_tca_sic1 modified_da_ib_sic1 pm_da_ib_gsector pm_da_tca_gsector pm_modified_da_ib_gsector pm_da_ib_sic1 pm_da_tca_sic1 pm_modified_da_ib_sic1
sort gvkey year
	
cd "D:\Dropbox\Research\withJeff\UK_Audit_Rick_Disclosure\data\"
save Discretionary_accrual_Global_Annual_Final, replace	
	


***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************

*Running Dechow and Dichev (2002) Accrual Quality measures
do "E:\Research\Basic_Database\Earnings_Quality\International\Earnings_Quality_Dechow_Dichev_Global_annual_20190626.do"	


***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************************************************************************************************************
*All variables for UK firms from Compustat Global

use "D:\Dropbox\Research\withJeff\UK_Audit_Rick_Disclosure\data\Compustat_Global_Annual.dta", clear

gen year=year(datadate)
gen month=month(datadate)
destring gvkey, replace
sort gvkey year month 
merge gvkey year month using "D:\Dropbox\Research\withJeff\UK_Audit_Rick_Disclosure\data\Compustat_Global_Security_Monthly_Return_1985_2017.dta" 
drop if _merge==2
drop _merge

sort gvkey year
by gvkey: gen  salesgrowth=(sale-sale[_n-1])/sale[_n-1] if year==year[_n-1]+1
by gvkey: gen l_at=at[_n-1]  if year==year[_n-1]+1
 


sort gvkey year
merge gvkey year using  "D:\Dropbox\Research\withJeff\UK_Audit_Rick_Disclosure\data\UK_sample_only.dta"
keep if _merge==3
drop _merge


sort gvkey year
save "D:\Dropbox\Research\withJeff\UK_Audit_Rick_Disclosure\data\Compustat_Global_Annual_UK_all_Variables.dta", replace

 
**********************************************************************************************************************************************************************************
**********************************************************************************************************************************************************************************
**********************************************************************************************************************************************************************************
**********************************************************************************************************************************************************************************
**********************************************************************************************************************************************************************************
**********************************************************************************************************************************************************************************
**********************************************************************************************************************************************************************************
cd "D:\Dropbox\Research\withJeff\UK_Audit_Rick_Disclosure\data"
*Assign 

use data.dta, clear
split DataDate, p("/")
destring DataDate1 DataDate2 DataDate3, replace

 
rename DataDate1 day
rename DataDate2 month
*rename DataDate3 year

gen datadate=mdy(month, day, DataDate3)
format %td datadate

rename Gvkey gvkey
destring gvkey, replace
sort gvkey year  
merge gvkey year  using Compustat_Global_Annual_UK_all_Variables.dta
drop if _merge==2
drop _merge

sort gvkey year
merge gvkey year using Discretionary_accrual_Global_Annual_Final.dta
drop if _merge==2
drop _merge

sort gvkey fyear
merge gvkey fyear using original_dechow_dichev_2002_Global_annual.dta
drop if _merge==2
drop _merge

sort gvkey fyear
merge gvkey fyear using modified_dechow_dichev_2002_Global_annual.dta
drop if _merge==2
drop _merge





gen nonkam=1 if type_content=="NonKAM"
gen kam=1 if type_content=="KAM"
gen full=1 if type_content=="Full"


/*Generating Variables */
sort gvkey year
local list at
foreach x of local list{
	gen ln`x'=ln(`x'+1)
	}
*prccd: Price close daily
*cshoi: com shares outstanding - issue
*ceq: common / ordinary equity - total
gen mb=cshoi*prccd/ceq
*dltt: long term debt - total
*dlc: debt in current liabilities - total(short term liabilities)
gen leverage=(dltt+dlc)/at


/*Winsorizing raw variables*/	
local list sd_firmresid_a da_ib da_tca modified_da_ib da_ib_sic1 da_tca_sic1 modified_da_ib_sic1 pm_da_ib_gsector pm_da_tca_gsector pm_modified_da_ib_gsector pm_da_ib_sic1 pm_da_tca_sic1 pm_modified_da_ib_sic1 /*
*/ lnat mb leverage roa salesgrowth
foreach x of local list{
	winsor `x' if `x'!=., p(0.01) gen(w`x')
	}
	
/*Generating absolute variables and winsorizing them*/
local list da_ib da_tca modified_da_ib da_ib_sic1 da_tca_sic1 modified_da_ib_sic1 pm_da_ib_gsector pm_da_tca_gsector pm_modified_da_ib_gsector pm_da_ib_sic1 pm_da_tca_sic1 pm_modified_da_ib_sic1
foreach x of local list{
	gen ab`x'=abs(`x')
	winsor ab`x' if `x'!=., p(0.01) gen(wab`x')
	}


/*Generating change variables and winsorizing them*/
sort gvkey year
local list da_ib da_tca modified_da_ib da_ib_sic1 da_tca_sic1 modified_da_ib_sic1 pm_da_ib_gsector pm_da_tca_gsector pm_modified_da_ib_gsector pm_da_ib_sic1 pm_da_tca_sic1 pm_modified_da_ib_sic1
foreach x of local list{
	by gvkey: gen d`x'=`x'-`x'[_n-1] if year==year[_n-1]+1
	}

local list da_ib da_tca modified_da_ib da_ib_sic1 da_tca_sic1 modified_da_ib_sic1 pm_da_ib_gsector pm_da_tca_gsector pm_modified_da_ib_gsector pm_da_ib_sic1 pm_da_tca_sic1 pm_modified_da_ib_sic1
foreach x of local list{
	winsor d`x' if `x'!=., p(0.01) gen(wd`x')
	}	
	*这个跟上面的absolute variables有啥区别？
local list da_ib da_tca modified_da_ib da_ib_sic1 da_tca_sic1 modified_da_ib_sic1 pm_da_ib_gsector pm_da_tca_gsector pm_modified_da_ib_gsector pm_da_ib_sic1 pm_da_tca_sic1 pm_modified_da_ib_sic1
foreach x of local list{
	gen dab`x'=abs(`x')
	winsor dab`x' if `x'!=., p(0.01) gen(wdab`x')
	}	

bys gvkey year:egen year_kam=max(kam)
replace year_kam=0 if year_kam==.


save UK_Audit_Risk_Disclosure_Dataset.dta, replace
*****************************
use UK_Audit_Risk_Disclosure_Dataset, clear
*Test
tab year if  full==1 ,sum(wabda_ib)
tab year if  full==1 & year_kam==0,sum(wabda_ib)
tab year if  full==1 & year_kam==1,sum(wabda_ib)

tab year if  full==1 ,sum(wsd_firmresid_a)
tab year if  full==1 & year_kam==0,sum(wsd_firmresid_a)
tab year if  full==1 & year_kam==1,sum(wsd_firmresid_a)

ttest wdabda_ib if full==1 ,by(year_kam)

reghdfe, compile

reghdfe wda_ib year_kam wlnat wmb wleverage wroa wsalesgrowth if full==1, a(gsector year) cl(gsector)
reghdfe wda_ib year_kam wlnat wmb wleverage wroa wsalesgrowth if da_ib>=0 & full==1, a(gsector year) cl(gsector)
reghdfe wda_ib year_kam wlnat wmb wleverage wroa wsalesgrowth if da_ib<0& full==1, a(gsector year) cl(gsector)

reghdfe wsd_firmresid_a year_kam wlnat wmb wleverage wroa wsalesgrowth if full==1, a(gsector year) cl(gsector)
reghdfe wsd_firmresid_a year_kam wlnat wmb wleverage wroa wsalesgrowth if da_ib>=0 & full==1, a(gsector year) cl(gsector)
reghdfe wsd_firmresid_a year_kam wlnat wmb wleverage wroa wsalesgrowth if da_ib<0& full==1, a(gsector year) cl(gsector)

reghdfe wda_ib year_kam##c.FOG wlnat wmb wleverage wroa wsalesgrowth if  full==1, a(gsector year) cl(gsector)
reghdfe wda_ib year_kam##c.FOG wlnat wmb wleverage wroa wsalesgrowth if da_ib>=0 & full==1, a(gsector year) cl(gsector)
reghdfe wda_ib year_kam##c.FOG wlnat wmb wleverage wroa wsalesgrowth if da_ib<0 & full==1, a(gsector year) cl(gsector)

reghdfe wsd_firmresid_a year_kam##c.FOG wlnat wmb wleverage wroa wsalesgrowth if  full==1, a(gsector year) cl(gsector)
reghdfe wsd_firmresid_a year_kam##c.FOG wlnat wmb wleverage wroa wsalesgrowth if da_ib>=0 & full==1, a(gsector year) cl(gsector)
reghdfe wsd_firmresid_a year_kam##c.FOG wlnat wmb wleverage wroa wsalesgrowth if da_ib<0 & full==1, a(gsector year) cl(gsector)
 