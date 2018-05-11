set terminal svg
set output '~/Documents/ESTEI/M1/Hyperfréquences/TP3/Rapport/Figures/GNUplot/sch_isotrope_polar2.svg'

#set parametric
set polar
set angles degrees
set key box opaque outside #at 18.5,16
unset border

#set xrange [-2:15]
#set yrange [-2:2]
#set zrange [0:40]
set rrange [0:1]
#set grid polar 45
set grid polar 30
unset xtics
unset ytics
unset ztics
unset raxis
set rtics 0.2 #textcolor rgb "grey"
#set hidden
set multiplot
set bmargin 2
set tmargin 2
set rmargin 7
set lmargin 7
#set size square
#set margins bottom

#set label "P(dBm)" at 16
set_label(x, text) = sprintf("set label '%s' at (1.06*cos(%f)), (1.06*sin(%f)) center", text, x, x) #this places a label on the outside

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




plot 1 lc rgb "dark-violet" lw 2 t "plan H"
#replot 5 lc rgb "green" lw 2 t "Piso(Pin)"
replot 1 lc rgb "green" lw 2 dashtype '_ ' t "Plan V"
#replot 7.15*cos(t)*cos(t) lc rgb "dark-turquoise" lw 2 t "Pdipole(Pin)"



pause -1
