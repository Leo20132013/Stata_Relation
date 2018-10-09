cd "F:\csmar投资者关系"
*-------------------------------------------------------*
*- 资产负债表
*-------------------------------------------------------*
insheet using FS_Combas.txt, clear

label var stkcd "证券代码"
label var accper "会计期间"
label var typrep "报表类型"
label var a001101000 "货币资金"
label var a0d1101101 "其中:客户资金存款"
label var a0d1102000 "结算备付金"
label var a0d1102101 "其中：客户备付金"
label var a0b1103000 "现金及存放中央银行款项"
label var a0b1104000 "存放同业款项"
label var a0b1105000 "贵金属"
label var a0f1106000 "拆出资金净额"
label var a001107000 "交易性金融资产"
label var a0f1108000 "衍生金融资产"
label var a001109000 "短期投资净额"
label var a001110000 "应收票据净额"
label var a001111000 "应收账款净额"
label var a001112000 "预付款项净额"
label var a0i1113000 "应收保费净额"
label var a0i1114000 "应收分保账款净额"
label var a0i1115000 "应收代位追偿款净额"
label var a0i1116000 "应收分保合同准备金净额"
label var a0i1116101 "其中:应收分保未到期责任准备金净额"
label var a0i1116201 "其中:应收分保未决赔款准备金净额"
label var a0i1116301 "其中:应收分保寿险责任准备金净额"
label var a0i1116401 "其中:应收分保长期健康险责任准备金净额"
label var a001119000 "应收利息净额"
label var a001120000 "应收股利净额"
label var a001121000 "其他应收款净额"
label var a0f1122000 "买入返售金融资产净额"
label var a001123000 "存货净额"
label var a001124000 "一年内到期的非流动资产"
label var a0d1126000 "存出保证金"
label var a001125000 "其他流动资产"
label var a001100000 "流动资产合计"
label var a0i1224000 "保户质押贷款净额"
label var a0i1225000 "定期存款"
label var a0b1201000 "发放贷款及垫款净额"
label var a001202000 "可供出售金融资产净额"
label var a001203000 "持有至到期投资净额"
label var a001204000 "长期应收款净额"
label var a001205000 "长期股权投资净额"
label var a001206000 "长期债权投资净额"
label var a001207000 "长期投资净额"
label var a0i1209000 "存出资本保证金"
label var a0i1210000 "独立账户资产"
label var a001211000 "投资性房地产净额"
label var a001212000 "固定资产净额"
label var a001213000 "在建工程净额"
label var a001214000 "工程物资"
label var a001215000 "固定资产清理"
label var a001216000 "生产性生物资产净额"
label var a001217000 "油气资产净额"
label var a001218000 "无形资产净额"
label var a0d1218101 "其中:交易席位费"
label var a001219000 "开发支出"
label var a001220000 "商誉净额"
label var a001221000 "长期待摊费用"
label var a001222000 "递延所得税资产"
label var a001223000 "其他非流动资产"
label var a001200000 "非流动资产合计"
label var a0f1300000 "其他资产"
label var a001000000 "资产总计"
label var a002101000 "短期借款"
label var a0d2101101 "其中:质押借款"
label var a0b2102000 "向中央银行借款"
label var a0b2103000 "吸收存款及同业存放"
label var a0b2103101 "其中：同业及其他金融机构存放款项"
label var a0b2103201 "其中：吸收存款"
label var a0f2104000 "拆入资金"
label var a002105000 "交易性金融负债"
label var a0f2106000 "衍生金融负债"
label var a002107000 "应付票据"
label var a002108000 "应付账款"
label var a002109000 "预收款项"
label var a0f2110000 "卖出回购金融资产款"
label var a0i2111000 "应付手续费及佣金"
label var a002112000 "应付职工薪酬"
label var a002113000 "应交税费"
label var a002114000 "应付利息"
label var a002115000 "应付股利"
label var a0i2116000 "应付赔付款"
label var a0i2117000 "应付保单红利"
label var a0i2118000 "保户储金及投资款"
label var a0i2119000 "保险合同准备金"
label var a0i2119101 "其中:未到期责任准备金"
label var a0i2119201 "其中:未决赔款准备金"
label var a0i2119301 "其中:寿险责任准备金"
label var a0i2119401 "其中:长期健康险责任准备金"
label var a002120000 "其他应付款"
label var a0i2121000 "应付分保账款"
label var a0d2122000 "代理买卖证券款"
label var a0d2123000 "代理承销证券款"
label var a0i2124000 "预收保费"
label var a002125000 "一年内到期的非流动负债"
label var a002126000 "其他流动负债"
label var a002127000 "递延收益-流动负债"
label var a002100000 "流动负债合计"
label var a002201000 "长期借款"
label var a0d2202000 "独立账户负债"
label var a002203000 "应付债券"
label var a002204000 "长期应付款"
label var a002205000 "专项应付款"
label var a002206000 "长期负债合计"
label var a002207000 "预计负债"
label var a002208000 "递延所得税负债"
label var a002209000 "其他非流动负债"
label var a002210000 "递延收益-非流动负债"
label var a002200000 "非流动负债合计"
label var a0f2300000 "其他负债"
label var a002000000 "负债合计"
label var a003101000 "实收资本(或股本)"
label var a003112000 "其他权益工具"
label var a003112101 "其中：优先股"
label var a003112201 "其中：永续债"
label var a003112301 "其中：其他"
label var a003102000 "资本公积"
label var a003102101 "其中：库存股"
label var a003103000 "盈余公积"
label var a0f3104000 "一般风险准备"
label var a003105000 "未分配利润"
label var a003106000 "外币报表折算差额"
label var a003107000 "未确认的投资损失"
label var a0f3108000 "交易风险准备"
label var a0f3109000 "专项储备"
label var a003111000 "其他综合收益"
label var a003100000 "归属于母公司所有者权益合计"
label var a003200000 "少数股东权益"
label var a003000000 "所有者权益合计"
label var a004000000 "负债与所有者权益总计"

gen code = string(stkcd, "%06.0f")
drop if substr(code, 1, 1) == "2"
drop if substr(code, 1, 1) == "9"
drop code
drop if typrep == "B"
*gen date = date(accper, "YMD")
*format date %td
split accper, generate(periodpart) parse(-) destring
rename periodpart1 year
keep if periodpart2 == 12
drop periodpart*
order stkcd year

compress
save FS_Combas, replace
*-------------------------------------------------------*
*- 利润表
*-------------------------------------------------------*
insheet using FS_Comins.txt, clear

label var stkcd "证券代码"
label var accper "会计期间"
label var typrep "报表类型"
label var b001100000 "营业总收入"
label var b001101000 "营业收入"
label var bbd1102000 "利息净收入"
label var bbd1102101 "利息收入"
label var bbd1102203 "利息支出"
label var b0i1103000 "已赚保费"
label var b0i1103101 "保险业务收入"
label var b0i1103111 "其中：分保费收入"
label var b0i1103203 "减：分出保费"
label var b0i1103303 "减：提取未到期责任准备金"
label var b0d1104000 "手续费及佣金净收入"
label var b0d1104101 "其中：代理买卖证券业务净收入"
label var b0d1104201 "其中:证券承销业务净收入"
label var b0d1104301 "其中：受托客户资产管理业务净收入"
label var b0d1104401 "手续费及佣金收入"
label var b0d1104501 "手续费及佣金支出"
label var b0f1105000 "其他业务收入"
label var b001200000 "营业总成本"
label var b001201000 "营业成本"
label var b0i1202000 "退保金"
label var b0i1203000 "赔付支出净额"
label var b0i1203101 "赔付支出"
label var b0i1203203 "减：摊回赔付支出"
label var b0i1204000 "提取保险责任准备金净额"
label var b0i1204101 "提取保险责任准备金"
label var b0i1204203 "减：摊回保险责任准备金"
label var b0i1205000 "保单红利支出"
label var b0i1206000 "分保费用"
label var b001207000 "营业税金及附加"
label var b0f1208000 "业务及管理费"
label var b0i1208103 "减：摊回分保费用"
label var b001209000 "销售费用"
label var b001210000 "管理费用"
label var b001211000 "财务费用"
label var b001212000 "资产减值损失"
label var b0f1213000 "其他业务成本"
label var b001301000 "公允价值变动收益"
label var b001302000 "投资收益"
label var b001302101 "其中：对联营企业和合营企业的投资收益"
label var b001303000 "汇兑收益"
label var b001304000 "其他业务利润"
label var b001300000 "营业利润"
label var b001400000 "营业外收入"
label var b001400101 "其中：非流动资产处置利得"
label var b001500000 "营业外支出"
label var b001500101 "其中：非流动资产处置净损益"
label var b001500201 "其中：非流动资产处置损失"
label var b001000000 "利润总额"
label var b002100000 "所得税费用"
label var b002200000 "未确认的投资损失"
label var b002300000 "影响净利润的其他项目"
label var b002000000 "净利润"
label var b002000101 "归属于母公司所有者的净利润"
label var b002000201 "少数股东损益"
label var b003000000 "基本每股收益"
label var b004000000 "稀释每股收益"
label var b005000000 "其他综合收益(损失)"
label var b006000000 "综合收益总额"
label var b006000101 "归属于母公司所有者的综合收益"
label var b006000102 "归属少数股东的综合收益"

gen code = string(stkcd, "%06.0f")
drop if substr(code, 1, 1) == "2"
drop if substr(code, 1, 1) == "9"
drop code
drop if typrep == "B"
split accper, generate(periodpart) parse(-) destring
rename periodpart1 year
keep if periodpart2 == 12
drop periodpart*
order stkcd year

compress
save FS_Comins, replace
*-------------------------------------------------------*
*- 相对价值指标
*-------------------------------------------------------*
insheet using FI_T10.txt, clear

label var indcd "行业代码:证监会行业分类2012年版"
label var f101001a "账面市值比a"
label var f101002a "账面市值比b"

split accper, generate(periodpart) parse(-) destring
rename periodpart1 year
keep if periodpart2 == 12
order stkcd year
keep stkcd year f101001a f101002a indcd

compress
save FI_T10, replace
*-------------------------------------------------------*
*- 年报公布日期
*-------------------------------------------------------*
insheet using FAR_Finidx.txt, clear

label var annodt "年报公布日期"
keep stkcd accper annodt

compress
save FAR_Finidx, replace
*-------------------------------------------------------*
*- 2013年-2017年日个股回报率
*-------------------------------------------------------*
insheet using TRD_Dalyr2012.txt, names clear
save TRD_Dalyr2012, replace
insheet using TRD_Dalyr2013.txt, names clear
save TRD_Dalyr2013, replace
insheet using TRD_Dalyr2014.txt, names clear
save TRD_Dalyr2014, replace
insheet using TRD_Dalyr2015.txt, names clear
save TRD_Dalyr2015, replace
insheet using TRD_Dalyr2016.txt, names clear
save TRD_Dalyr2016, replace
insheet using TRD_Dalyr2017.txt, names clear
save TRD_Dalyr2017, replace
insheet using TRD_Dalyr2018.txt, names clear
save TRD_Dalyr2018, replace

use TRD_Dalyr2012, clear
append using TRD_Dalyr2013
append using TRD_Dalyr2014
append using TRD_Dalyr2015
append using TRD_Dalyr2016
append using TRD_Dalyr2017
append using TRD_Dalyr2018

label var opnprc "日开盘价"
label var hiprc "日最高价"
label var loprc "日最低价"
label var clsprc "日收盘价"
label var dnshrtrd "日个股交易股数"
label var dnvaltrd "日个股交易金额"
label var dsmvosd "日个股流通市值"
label var dsmvtll "日个股总市值"
label var dretwd "考虑现金红利再投资的日个股回报率"
label var dretnd "不考虑现金红利的日个股回报率 "
label var adjprcwd "考虑现金红利再投资的收盘价的可比价格"
label var adjprcnd "不考虑现金红利的收盘价的可比价格"
label var markettype "[市场类型]-1=上海A,2=上海B,4=深圳A,8=深圳B,16=创业板"
label var capchgdt "最新股本变动日期"
label var trdsta "交易状态"

sort stkcd trddt

save TRD_Dalyr_Final, replace

cap erase TRD_Dalyr2012.dta
cap erase TRD_Dalyr2013.dta
cap erase TRD_Dalyr2014.dta
cap erase TRD_Dalyr2015.dta
cap erase TRD_Dalyr2016.dta
cap erase TRD_Dalyr2017.dta
cap erase TRD_Dalyr2018.dta
*-------------------------------------------------------*
*- 2012.7.1-2018.6.30日市场回报率(分市场)
*-------------------------------------------------------*
insheet using TRD_Dalym.txt, names clear

label var dretwdeq "考虑现金红利再投资的日市场回报率(等权平均法)"
label var dretmdeq "不考虑现金红利再投资的日市场回报率(等权平均法)"
label var dretwdos "考虑现金红利再投资的日市场回报率(流通市值加权平均法)"
label var dretmdos "不考虑现金红利再投资的日市场回报率(流通市值加权平均法)"
label var dretwdtl "考虑现金红利再投资的日市场回报率(总市值加权平均法)"
label var dretmdtl "不考虑现金红利再投资的日市场回报率(总市值加权平均法)"
label var dnstkcal "计算日市场回报率的有效公司数量"

keep markettype trddt dretwdos dretwdtl

save TRD_Dalym, replace
*-------------------------------------------------------*
*- 2012.7.1-2018.6.30综合日市场回报率文件
*-------------------------------------------------------*
insheet using TRD_Cndalym.txt, names clear

label var cdretwdeq "考虑现金红利再投资的综合日市场回报率(等权平均法)"
label var cdretmdeq "不考虑现金红利的综合日市场回报率(等权平均法)"
label var cdretwdos "考虑现金红利再投资的综合日市场回报率(流通市值加权平均法)"
label var cdretmdos "不考虑现金红利的综合日市场回报率(流通市值加权平均法)"
label var cdretwdtl "考虑现金红利再投资的综合日市场回报率(总市值加权平均法)"
label var cdretmdtl "不考虑现金红利的综合日市场回报率(总市值加权平均法)"

keep markettype trddt cdretwdos cdretwdtl

save TRD_Cndalym, replace
*-------------------------------------------------------*
*- 调研问答纪要
*-------------------------------------------------------*
import excel using IRM_MeetingMinutes.xlsx, first clear

drop in 1/2
destring Rank, replace
destring ReportID, replace
destring Symbol, replace

label var ReportDate "调研日期"
bysort ReportID: egen Num_Q = max(Rank)
label var Num_Q "调研提问数"
bysort ReportID: keep if Rank == Num_Q
drop Rank

compress
save IRM_MeetingMinutes, replace
*-------------------------------------------------------*
*- 投资者关系活动记录表
*-------------------------------------------------------*
import excel using IRM_ActiveRecord.xlsx, first clear

drop in 1/2
label var ReportDate "调研日期"
label var MeetingWay "召开方式"
label var Researcher "投资调研者"
label var Address "调研地点"
label var Participants "上市公司参与人"

destring ReportID, replace
destring Symbol, replace

compress
save IRM_ActiveRecord, replace
*-------------------------------------------------------*
*- 调研情况基本信息表
*-------------------------------------------------------*
insheet using IRM_ResearchInfo.txt, clear

rename reportid ReportID
label var declaredate "公布日期" 
label var reportdate "调研日期"

keep ReportID declaredate

compress
save IRM_ResearchInfo, replace
*-------------------------------------------------------*
*- 调研情况统计表
*-------------------------------------------------------*
insheet using IRM_ResearchStatistics.txt, clear

label var researchernum "参与调研人数"
label var institutionnum "参与调研机构人数" 
label var individualnum "参与调研个人人数"

rename reportid ReportID
rename symbol Symbol

keep ReportID Symbol researchernum institutionnum individualnum

compress
save IRM_ResearchStatistics, replace
*-------------------------------------------------------*
*- 调研机构分类明细表
*-------------------------------------------------------*
import excel using IRM_InstitutionClass.xlsx, first clear

drop in 1/2
label var ReportDate "调研日期"
label var ObjectType "参与对象类型:1-机构,2-个人"
label var Rank "序号"
label var InstitutionName "参与机构名称"
label var Researcher "参与人员姓名"
label var InstitutionTypeID "机构分类编码"
label var InstitutionType "机构分类名称"

compress
save IRM_InstitutionClass, replace
*-------------------------------------------------------*
*- 停复牌
*-------------------------------------------------------*
insheet using TSR_Stkstat.txt, clear

label var annctime "停牌公告日期"
label var type "停牌类型:1=停牌,2=退市,3=暂停上市"
label var suspdate "停牌日期"
label var susptime "停牌时间"
label var resmdate "复牌日期,空值表示对应股票永久退市"
label var resmtime "复牌时间"
label var timeperd "交易停复牌时间长度"
label var reason "停牌原因"

gen code = string(stkcd,"%06.0f")
drop if substr(code, 1, 1) == "2"
drop if substr(code, 1, 1) == "9"

keep stkcd annctime type suspdate resmdate reason

compress
save TSR_Stkstat, replace
*-------------------------------------------------------*
*- 调研数据合并与处理
*-------------------------------------------------------*
use IRM_MeetingMinutes, clear
merge 1:1 ReportID Symbol using IRM_ActiveRecord
keep if _merge == 3
drop _merge
merge 1:1 ReportID using IRM_ResearchInfo
keep if _merge == 3
drop _merge
merge 1:1 ReportID Symbol using IRM_ResearchStatistics
keep if _merge == 3
drop _merge

rename Symbol stkcd
gen code = string(stkcd,"%06.0f")	//剔除B股
drop if substr(code, 1, 1) == "2"
drop if substr(code, 1, 1) == "6"
drop if substr(code, 1, 1) == "9"
drop code

gen special = 1 if strmatch(MeetingWay, "*特定*")	//仅保留"特定对象调研"
replace special = 0 if special == .

gen analyst = 1 if strmatch(MeetingWay, "*分析师*")
replace analyst = 0 if analyst == .

gen media = 1 if strmatch(MeetingWay, "*媒体*")
replace media = 0 if media == .

gen performance = 1 if strmatch(MeetingWay, "*业绩*")
replace performance = 0 if performance == .

gen news = 1 if strmatch(MeetingWay, "*新闻*")
replace news = 0 if news == .

gen roadshow = 1 if strmatch(MeetingWay, "*路演*")
replace roadshow = 0 if roadshow == .

gen spot = 1 if strmatch(MeetingWay, "*现场*")
replace spot = 0 if spot == .

gen others = 1 if strmatch(MeetingWay, "*其他*")
replace others = 0 if others == .

gen totalscores = special+analyst+media+performance ///
					+news+roadshow+spot+others
keep if special == 1 & totalscores == 1	
keep if strmatch(MeetingWay, "特定对象调研")

sort stkcd declaredate	//剔除同一天发布多个公告的样本
egen rm = group(stkcd declaredate)
bysort rm: gen num = _n
bysort rm: egen count = sum(num)
keep if count == 1	

bysort stkcd: gen n = _n
sum n
local max = r(max)
save Tempo, replace

use TSR_Stkstat, clear	//剔除停复牌样本
expand `max'
sort stkcd suspdate
bysort stkcd suspdate resmdate: gen n = _n
merge m:1 stkcd n using Tempo
keep if _merge == 3

gen startdate = date(suspdate, "YMD")
gen enddate = date(resmdate, "YMD")
gen declare = date(declaredate, "YMD")
gen anncdate = date(annctime, "YMD")

drop if enddate == .
drop if declaredate == annctime
gen state = 1 if declare >= startdate & ///
				declare <= enddate

keep stkcd ReportID ReportDate Num_Q MeetingWay ///
	Researcher Address Participants ///
	declaredate researchernum institutionnum ///
	individualnum state

duplicates drop
sort stkcd declaredate state
bysort stkcd declaredate: carryforward state, replace
drop if state == 1
drop state

order ReportID stkcd ReportDate declaredate Num_Q ///
		researchernum institutionnum individualnum
save Tempo1, replace

use TRD_Dalym, clear	//剔除公布日在非交易日(市场)的样本
keep trddt
duplicates drop
rename trddt declaredate
save tradeday_tempo, replace

use Tempo1, clear
merge m:1 declaredate using tradeday_tempo
keep if _merge == 3
drop _merge
save Tempo2, replace

use TRD_Dalyr_Final, clear	//剔除公布日在非交易日(个股)的样本
keep stkcd trddt
rename trddt declaredate
save tradeday_tempo1, replace

use Tempo2, clear
merge 1:1 stkcd declaredate using tradeday_tempo1
keep if _merge == 3
drop _merge
save Tempo2, replace

use Tempo2, clear	//剔除公布日-调研日>2天的样本(交易日)
gen decdate = date(declaredate, "YMD")
format decdate %td
gen repdate = date(ReportDate, "YMD")
format repdate %td
gen traday = repdate
format traday %td
save Tempo3, replace

use TRD_Dalym, clear
gen traday = date(trddt, "YMD")
format traday %td
keep traday
duplicates drop
sort traday
gen n = _n
save tradeday_tempo2, replace

use TRD_Dalym, clear
gen decdate = date(trddt, "YMD")
format decdate %td
keep decdate
duplicates drop
sort decdate
gen seq_dec = _n
save tradeday_tempo3, replace

use Tempo3, clear
local continue = 1
gen seq_rep = .
while `continue' {
	merge m:1 traday using tradeday_tempo2
	drop if _merge == 2
	replace traday = traday + 1 if _merge == 1
	replace seq_rep = n
	qui sum _merge
	local continue = (r(mean)!=3)
	drop n
	drop _merge
}
merge m:1 decdate using tradeday_tempo3
keep if _merge == 3
drop _merge
gen m = 1 if repdate != traday
replace m = 0 if m == .
gen GAP = (seq_dec + m) - seq_rep
*tab GAP
keep if (GAP >= 0 & GAP <= 2)

xtset stkcd decdate	//剔除事件宣告间隔日<3天的样本(事件窗口期[-1,1])
sort stkcd decdate
by stkcd: gen dif1 = seq_dec - L.seq_dec
by stkcd: gen dif2 = seq_dec - L2.seq_dec
drop if dif1 == 1
drop if dif2 == 2

keep ReportID stkcd ReportDate declaredate Num_Q ///
	researchernum institutionnum individualnum ///
	MeetingWay Researcher Address Participants
compress
save Data, replace

cap erase Tempo.dta
cap erase Tempo1.dta
cap erase Tempo2.dta
cap erase Tempo3.dta
cap erase tradeday_tempo.dta
cap erase tradeday_tempo1.dta
cap erase tradeday_tempo2.dta
cap erase tradeday_tempo3.dta
*-------------------------------------------------------*
*- 观察调研事件时间分布情况
*-------------------------------------------------------*
use Data, clear

keep stkcd declaredate
gen date = date(declaredate, "YMD")
format date %td

gen year = year(date)
gen month = month(date)

#delimit ;
tw (kdensity month if year == 2013) (kdensity month if year == 2014)
	(kdensity month if year == 2015) (kdensity month if year == 2016)
	(kdensity month if year == 2017)
	,
	xlabel(1(1)12)
	ylabel(0.04(0.02)0.14, gmax angle(0))
	xtitle("月份")
	legend(label(1 "2013") label(2 "2014") label(3 "2015")
			label(4 "2016") label(5 "2017"));
#delimit cr

preserve
gen x = 1
bysort year month: egen count = sum(x) 
duplicates drop year month count,force

#delimit ;
twoway (line count month if year == 2013) (line count month if year == 2014)
		(line count month if year == 2015) (line count month if year == 2016)
		(line count month if year == 2017)
		,
		xlabel(1(1)12)
		xtitle("月份")
		legend(label(1 "2013") label(2 "2014") label(3 "2015")
				label(4 "2016") label(5 "2017"));
#delimit cr
restore
*-------------------------------------------------------*
*- 基础数据合并与处理
*-------------------------------------------------------*
use FS_Combas, clear

merge 1:1 stkcd year using FS_Comins
keep if _merge == 3
drop _merge
merge 1:1 stkcd year using FI_T10
keep if _merge == 3
drop _merge

save Basic_Data, replace
*-------------------------------------------------------*
*- 控制变量
*-------------------------------------------------------*
use Basic_Data, clear

xtset stkcd year
gen SIZE = ln(a001000000)
label var SIZE "资产规模的自然对数"
gen LEV = a002000000/a001000000
label var LEV "资产负债率"
gen ROA = b002000101/a001000000
label var ROA "总资产净利润"
generate LOSS =cond(b002000000<0,1,0)
label var LOSS "1,亏损；0，非亏损"
gen MB_A = f101001a
label var MB_A "账面市值比a"
gen MB_B = f101002a
label var MB_B "账面市值比b"

*-------------------------------------------------------*
*- 分市场CAR & VOl
*-------------------------------------------------------*
/*
use TRD_Dalyr_Final, clear
merge m:1 markettype trddt using TRD_Dalym
drop if markettype == 2	//上海B
drop if markettype == 8	//深圳B
sort stkcd trddt
keep stkcd trddt dretwd dretwdos dretwdtl
save StockData, replace

use Data, clear
keep stkcd declaredate
sort stkcd
by stkcd: gen eventcount = _N
by stkcd: keep if _n == 1
keep stkcd eventcount
save eventcount, replace

use StockData, clear
sort stkcd
merge m:1 stkcd using eventcount
keep if _merge == 3	//没有合并成功的表明该公司未被调研过
drop _merge
expand eventcount
drop eventcount
sort stkcd trddt
by stkcd trddt: gen set = _n
sort stkcd set
save StockData2, replace

use Data, clear
keep stkcd declaredate
sort stkcd declaredate
by stkcd: gen set = _n
sort stkcd set
save eventdata2, replace

use StockData2, clear
merge m:1 stkcd set using eventdata2
keep if _merge == 3
drop _merge
egen group_id = group(stkcd set)
sort group_id trddt
by group_id: gen datenum = _n
by group_id: gen target = datenum if trddt == declaredate
by group_id: egen td = min(target)
drop target
gen dif = datenum - td
bysort group_id: drop if (dif<-30 | dif>30)	//剔除多余数据
save CarData, replace

cap erase StockData.dta
cap erase StockData2.dta
cap erase eventcount.dta
cap erase eventdata2.dta
*/
*- CAR
use CarData, clear

gen AR_OS = dretwd - dretwdos	//流通市值加权平均法
gen AR_TL = dretwd - dretwdtl	//总市值加权平均法

bysort group_id: gen event_window_1 = 1 if (dif>=0 & dif<=1)	//[0,1]窗口期
bysort group_id: egen count_event_obs_1 = count(event_window_1)
replace event_window_1 = 0 if event_window_1 == .
drop if count_event_obs_1 < 2
*000564被剔除，其公告发布日在交易日，而下一个交易日即开始停牌

bysort group_id: egen Car_OS_Win1 = sum(AR_OS) if event_window_1 == 1
bysort group_id: egen Car_TL_Win1 = sum(AR_TL) if event_window_1 == 1
bysort group_id: gen Car_OS_Win1_date = sum(AR_OS) if event_window_1 == 1	//逐日
bysort group_id: gen Car_TL_Win1_date = sum(AR_TL) if event_window_1 == 1
/*
reg Car_OS_Win1 if dif == 0, robust
reg Car_TL_Win1 if dif == 0, robust
reg Car_OS_Win1_date if dif == 0, robust
reg Car_OS_Win1_date if dif == 1, robust
*/
bysort group_id: gen event_window_2 = 1 if (dif>=-1 & dif<=1)	//[-1,1]窗口期
bysort group_id: egen count_event_obs_2 = count(event_window_2)
replace event_window_2 = 0 if event_window_2 == .
drop if count_event_obs_2 < 3

bysort group_id: egen Car_OS_Win2 = sum(AR_OS) if event_window_2 == 1
bysort group_id: egen Car_TL_Win2 = sum(AR_TL) if event_window_2 == 1
bysort group_id: gen Car_OS_Win2_date = sum(AR_OS) if event_window_2 == 1	//逐日
bysort group_id: gen Car_TL_Win2_date = sum(AR_TL) if event_window_2 == 1
/*
reg Car_OS_Win2 if dif == 0, robust
reg Car_TL_Win2 if dif == 0, robust
reg Car_OS_Win2_date if dif == -1, robust
reg Car_OS_Win2_date if dif == 0, robust
reg Car_OS_Win2_date if dif == 1, robust
*/
*- VOL
bysort group_id: egen VOL_OS = sd(AR_OS) if (dif<=-2 & dif>=-21)	//[-1,1]窗口期前20个交易日波动性
bysort group_id: egen VOL_TL = sd(AR_TL) if (dif<=-2 & dif>=-21)


*-------------------------------------------------------*
*-------------------------------------------------------*
*-------------------------------------------------------*
*-------------------------------------------------------*
cd "F:\AnnouncementText"
/*
unicode analyze NTUSD1.csv
unicode encoding set gb18030
unicode translate NTUSD1.csv
*/
insheet using NTUSD1.csv, clear
foreach x of varlist * {
			label var `x' `"`=`x'[1]'"'
		}
drop in 1/3
drop v1
split v6, generate(Emotion) parse(,) destring
split Emotion1, generate(P) parse("(") destring
split Emotion3, generate(F) parse(")") destring
rename Emotion2 Neg 
rename P2 Pos
rename F1 Emo
drop Emotion1 Emotion3 P1
order v2-v6 Pos Neg Emo
foreach x of varlist * {
			cap destring `x', replace
		}
gen Total = Pos + Neg

bysort v2: egen Emo_A = sum(Emo)	//总体来说是积极的
bysort v2: egen Total_A = sum(Total)

gen Tone = Emo_A/Total_A

keep v2 Tone
duplicates drop

hist Tone, normal
