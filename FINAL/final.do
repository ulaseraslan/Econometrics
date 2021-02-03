//Question 1
g lprice = log(avgprc)
g t2 = t^2
tset t

reg lprice t t2 mon tues wed thurs
reg lprice t t2 mon tues wed thurs wave2 wave3
g growthprice = (avgprc-l.avgprc)/l.avgprc
reg growthprice t t2 mon tues wed thurs wave2 wave3

g ltotqty = log(totqty) 
reg ltotqty lprice mon tues wed thurs t t2

reg lprice t t2 mon tues wed thurs wave2 wave3
predict lpricehat
reg ltotqty lpricehat mon tues wed thurs t t2


ivreg ltotqty mon tues wed thurs t t2 (lprice= wave2 wave3)

scatter wave2 lprice
drop if wave2>10
drop if wave3>10

ivreg ltotqty mon tues wed thurs t t2 (lprice= wave2 wave3)

g lwave2 = log(wave2)
g lwave3 = log(wave3)
scatter lprice wave2
scatter lprice lwave2
scatter lprice wave3
scatter lprice lwave3
ivreg ltotqty mon tues wed thurs t t2 (lprice= lwave2 lwave3)

//Question 2

sum crmrte prbarr prbconv prbpris avgsen polpc density west central urban pctmin80 wcon wtuc wtrd wfir wser wmfg wfed wsta wloc pctymle

g lcrmrte = log(crmrte)

 g lprbarr = log(prbarr)

 g lprbconv = log(prbconv)

 g lprbpris = log(prbpris)

 g lavgsen = log(avgsen)

 g lpolpc = log(polpc)

 g ldensity = log(density)

 g ltaxpc = log(taxpc)

 g lpctmin80 = log(pctmin80)

 g lwcon = log(wcon)

 g lwtuc = log(wtuc)

 g lwtrd = log(wtrd)

 g lwfir = log(wfir)

 g lwser = log(wser)

 g lwmfg = log(wmfg)

 g lwfed = log(wfed)

 g lwsta = log(wsta)

 g lwloc = log(wloc)
 
 g lpctymle = log(pctymle)

 g lmix = log(mix)


xtset county year

reg lcrmrte lprbarr lprbconv lprbpris lavgsen lpolpc ldensity lpctmin80 lwcon lwtuc lwtrd lwfir lwser lwmfg lwfed lwsta lwloc lpctymle west central urban i.year

xtreg lcrmrte lprbarr lprbconv lprbpris lavgsen lpolpc ldensity lpctmin80 lwcon lwtuc lwtrd lwfir lwser lwmfg lwfed lwsta lwloc lpctymle west central urban, fe

reg lpolpc ltaxpc lprbarr lprbconv lprbpris lavgsen ldensity lpctmin80 lwcon lwtuc lwtrd lwfir lwser lwmfg lwfed lwsta lwloc pctymle west central urban i.year 


xi:ivreg lcrmrte lprbarr lprbconv lprbpris lavgsen ldensity lpctmin80 lwcon lwtuc lwtrd lwfir  lwser lwmfg lwfed lwsta lwloc pctymle west central urban i.year (lpolpc = ltaxpc) 

