set terminal svg
set output '~/Documents/ESTEI/M1/Hyperfréquences/TP3/Rapport/Figures/GNUplot/sch_impedances.svg'

#set parametric
#set size ratio -1
set key box opaque outside top right
unset grid
unset border
#set view map
#set xrange [-1.5:1.5]
#set yrange [-1.5:1.5]
set xrange [-1:1]
set yrange [-1:1]
#set zrange [-3:2]
unset tics
#set xtics
#set ytics
#unset ztics
#unset xaxis
set multiplot


set object 1 polygon from -1,-0.02 to -1,0.02 to 1,0.02 to 1,-0.02 fc rgb "orange" fillstyle solid 1.0 border lt -1

plot   cos(0.5*pi*x+pi/2)*(cos(0.5*pi*x+pi/2)) lc rgb "dark-violet" lw 2 t "|Z|"
replot cos(0.5*pi*x+pi/2) lc rgb "dark-pink" lw 2 t "V"
replot (cos(0.5*pi*x))*(cos(0.5*pi*x)) lc rgb "green" lw 2 t "I"



pause -1
