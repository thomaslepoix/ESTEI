set terminal svg
set output '~/Documents/ESTEI/M1/Hyperfréquences/TP3/Rapport/Figures/GNUplot/sch_angle.svg'

#set parametric
set polar
set angles degrees
set key box opaque at 23,18
#set key box opaque at 20,16
#set key box opaque outside right top
unset border

#set xrange [-2:15]
#set yrange [-2:2]
#set zrange [0:40]
set rrange [-10:9]
set grid polar 45
set grid polar 30
unset xtics
unset ytics
unset ztics
unset raxis
set rtics 3 #textcolor rgb "grey"
set multiplot
set bmargin 2
set tmargin 5
set rmargin 17
set lmargin 7
#set size square
#set margins bottom

#set label "P(dBm)" at 16
set_label(x, text) = sprintf("set label '%s' at ((10+10)*cos(%f)), ((10+10)*sin(%f)) center", text, x, x) #this places a label on the outside

#here all labels are created
eval set_label(0, "     G(dBi)")
eval set_label(30, "30")
eval set_label(60, "60")
eval set_label(90, "90")
eval set_label(120, "120")
eval set_label(150, "150")
eval set_label(180, "180")
eval set_label(210, "210")
eval set_label(240, "240")
eval set_label(270, "270")
eval set_label(300, "300")
eval set_label(330, "330")



plot 0 lc rgb "green" lw 2 t "Piso"

replot -10+(10+9)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t) lc rgb "dark-violet" lw 2 t "P"
replot -10+(10+9)*cos(t)*sin(t)*sin(t) lc rgb "dark-violet" lw 2 notitle
replot -10+(10+9)*-cos(t)*sin(t)*sin(t)*sin(t)*sin(t) lc rgb "dark-violet" lw 2 notitle
replot -10+(10+9)/4*-cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t) lc rgb "dark-violet" lw 2 notitle

#set object 1 circle at 0,0 radius 40 arc [-10:10] fillstyle empty border lt 1

set arrow from 0,0 to (20*1.25),(3.2*1.25) nohead lw 2 dashtype '-' lc rgb "dark-pink"
set arrow from 0,0 to (20*1.25),-(3.2*1.25) nohead lw 2 dashtype '-' lc rgb "dark-pink"

set arrow from (20*1.15),(3.2*1.1) to (20*1.15),-(3.2*1) lw 2 lt 1 lc rgb "dark-pink"
set arrow from (20*1.15),-(3.2*1.1) to (20*1.15),(3.2*1) lw 2 lt 1 lc rgb "dark-pink"
set label 1 "θ" at (20*1.2),0 font "Arial,14" tc rgb "dark-pink"

replot 6 lc rgb "dark-pink" dashtype '-' lw 2 t "G0-3dB"

#replot angle<30 ? 8 : 0 lc rgb "dark-pink" lt 0 lw 2 notitle #: 8 lc rgb "dark-pink" lt 0 lw 0 notitle

pause -1
