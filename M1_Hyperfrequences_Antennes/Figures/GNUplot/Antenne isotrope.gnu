set terminal svg
set output '~/Documents/ESTEI/M1/Hyperfréquences/TP3/Rapport/Figures/GNUplot/sch_3d_isotrope.svg'

unset tics
unset border
set parametric
#set isosamples 18,24
set isosamples 30,60
set hidden
set nokey
#set border 8 lt 1
#set title "ROTATION D'UNE SPHERE"
set urange [-pi/2:pi/2]
set vrange [0:2*pi]
set zrange [-1:1]
#set view 45,0,0.7,2.1
#set dot at 0,0,0
set multiplot

$point << EOD
0,0,0
EOD
#replot $point using 1:(f($1))


splot $point with points pointtype 7 lc rgb "black"
splot cos(u)*cos(v),cos(u)*sin(v),sin(u) with lines


pause -1


