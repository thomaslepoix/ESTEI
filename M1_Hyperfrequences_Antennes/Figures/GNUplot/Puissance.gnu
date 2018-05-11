set terminal svg
set output '~/Documents/ESTEI/M1/Hyperfréquences/TP3/Rapport/Figures/GNUplot/sch_puissance.svg'

#set parametric
set polar
set angles degrees
set key box opaque at 18.5,16
unset border

#set xrange [-2:15]
#set yrange [-2:2]
#set zrange [0:40]
set rrange [0:15]
set grid polar 45
set grid polar 30
unset xtics
unset ytics
unset ztics
unset raxis
set rtics 2.5 #textcolor rgb "grey"
set multiplot
set bmargin 2
set tmargin 2
set rmargin 7
set lmargin 7
#set size square
#set margins bottom

#set label "P(dBm)" at 16
set_label(x, text) = sprintf("set label '%s' at (16*cos(%f)), (16*sin(%f)) center", text, x, x) #this places a label on the outside

#here all labels are created
eval set_label(0, "     P(dbm)")
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



plot 15*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t) lc rgb "dark-violet" lw 2 t "P(Pin)"
replot 15*cos(t)*sin(t)*sin(t) lc rgb "dark-violet" lw 2 notitle
replot 15*-cos(t)*sin(t)*sin(t)*sin(t)*sin(t) lc rgb "dark-violet" lw 2 notitle
replot 3*-cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t)*cos(t) lc rgb "dark-violet" lw 2 notitle

replot 15 lc rgb "dark-pink" lw 2 t "Piso(PIRE)"
replot 5 lc rgb "green" lw 2 t "Piso(Pin)"
replot 15*cos(t)*cos(t) lc rgb "orange" lw 2 t "Pdipole(PAR)"
replot 7.15*cos(t)*cos(t) lc rgb "dark-turquoise" lw 2 t "Pdipole(Pin)"



pause -1
