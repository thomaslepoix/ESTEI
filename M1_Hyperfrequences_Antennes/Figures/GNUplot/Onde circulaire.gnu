set terminal svg
set output '~/Documents/ESTEI/M1/Hyperfréquences/TP3/Rapport/Figures/GNUplot/sch_onde_circulaire.svg'

set parametric
unset key
unset border
#set grid
#set 
set xrange [-2:2]
set yrange [-2:2]
set zrange [0:40]
unset xtics
unset ytics
unset ztics
#unset xaxis
set multiplot

#a(z)=0
#f(x)=sin(x)

#splot a(z)
#splot f(x)
set object 1 polygon from -1.5,-1.5,0 to -1.5,0.8,0 to -0.8,1.5,0 to 1.5,1.5,0 to 1.5,-0.8,0 to 0.8,-1.5,0 fc rgb "orange" fillstyle solid 1.0 border lt -1
#set object 2 ellipse at 1,1,1 size 1,1 angle 0 unit xy fc rgb "black" fillstyle solid 1.0
#set style ellipse unit xy size graph 1,1 angle 0 noclip
#set object 2 ellipse at 1,1,1 fc rgb "black" fillstyle solid 1.0

set arrow from -1.5,-1.5,20 to -0.8,-1.5,20
set arrow from -1.5,-1.5,20 to -1.5,-2.2,20
set arrow from -1.5,-1.5,20 to -1.5,-1.5,30
set label 1 "y" at -0.77,-1.5,20 font "Arial,14"
set label 2 "x" at -1.5,-2.4,20 font "Arial,14"
set label 3 "z" at -1.5,-1.5,32 font "Arial,14"
set label 4 "0" at 0.1,-1,0 font "Arial,20" rotate by 75
set label 5 "O" at 0,-1.5,5 font "Arial,14"
#set label 4 "0" at 1,-1,0 font "Arial,20" rotate by 75
#set label 5 "O" at 0.9,-1.5,5 font "Arial,14"
set label 6 "E" at 0,0,45 font "Arial,14"
set arrow from -0.1,-0.2,48.2 to 0.2,0.2,47
set arrow from 0,-1.5,0 to 0,1.5,0 nohead lt 0 lc rgb "black"

splot [t=0:30] [z=0:40] cos(t), sin(t), 2*t

pause -1
