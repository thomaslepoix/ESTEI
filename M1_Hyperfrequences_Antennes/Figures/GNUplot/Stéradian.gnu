set terminal svg
set output '~/Documents/ESTEI/M1/Hyperfréquences/TP3/Rapport/Figures/GNUplot/sch_steradian.svg'

#set parametric
set size ratio -1
unset key
unset grid
unset border
#set view map
#set xrange [-1.5:1.5]
#set yrange [-1.5:1.5]
set xrange [-2:2]
set yrange [-2:2]
#set zrange [-3:2]
unset tics
#set xtics
#set ytics
#unset ztics
#unset xaxis
set multiplot




#set object 1 ellipse at (1+(sqrt(2)/2)),(1+(sqrt(2)/2)) size 0.5,sqrt(2) angle 0 fc rgb "orange" fillstyle solid 1.0 border lt -1
#set object 2 circle at 0,0 size 0.02 fc rgb "black" fillstyle solid 1.0
#set object 3 circle at 0,0 size 1 fillstyle empty border lc rgb "black"
#set object 4 circle at 0,0 size 1+sqrt(2)/2 fillstyle empty border lc rgb "black"
#set object 5 circle at 0,0 size 2 fillstyle empty border lc rgb "black"
#set object 6 ellipse at 1,1 size 0.5,sqrt(2) angle 45
#set object 6 ellipse at 0.5,0.5 size 0.2,sqrt(2) angle 45
#set object 2 circle at 0,0 size 0.02 fc rgb "black" fillstyle solid 1.0


set arrow from 0,0 to 0,1 #0,1.5
set arrow from 0,0 to 1,0#1.5,0
set arrow from 0,0 to -0.63*(sqrt(2)/2),-0.63*(sqrt(2)/2) #-1.5*(sqrt(2)/2),-1.5*(sqrt(2)/2)

set object 1 ellipse at 0,0 size 2,2 #fillstyle empty border lc rgb "black" #border lt -1
#set object 2 ellipse at 0,0 size 1,2 fillstyle empty border lc rgb "black" #border lt -1
set object 2 ellipse at 0,0 size 2,1 #fillstyle empty border lc rgb "black" #border lt -1

set object 3 ellipse at 0.6,0.6 size 0.2,0.5 angle 45

set arrow from 0,0 to 0.6+0.25*sqrt(2)/2,0.6-0.25*sqrt(2)/2 nohead
set arrow from 0,0 to 0.6-0.25*sqrt(2)/2,0.6+0.25*sqrt(2)/2 nohead

set label 1 "r" at 0.5,0.2 font "Arial,14"
#set label 1 "r" at 0.6,0.25 font "Arial,14"
set label 2 "r²" at 0.59,0.59 font "Arial,14"
set label 3 "Ω" at 0.2,0.25 font "Arial,14"

plot 3


pause -1
