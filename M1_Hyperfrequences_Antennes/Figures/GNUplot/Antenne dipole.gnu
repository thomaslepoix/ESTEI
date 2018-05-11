#set terminal svg
#set output '~/Documents/ESTEI/M1/Hyperfréquences/TP3/Rapport/Figures/GNUplot/sch_3d_dipole2.svg'

unset tics
#set ticslevel 0.1
#set grid
#set border 31 #lt 5
unset border
set parametric
set autoscale
set hidden
set nokey
set noclip
#set title "TORES"
set urange [-pi:pi]
set vrange [-pi:pi]
set zrange [-1.5:+1.5]
set isosamples 60,30
#set view 45,30,0.9,1.8
set arrow from 0,0,-2 to 0,0,-0.1 nohead lw 2
set arrow from 0,0,2 to 0,0,0.1 nohead lw 2

set multiplot

set object 1 polygon from -2.5,0,-2.5 to -2.5,0,2.5 to 2.5,0,2.5 to 2.5,0,-2.5
splot cos(u)+1*cos(u)*cos(v),sin(u)+1*sin(u)*cos(v),1*sin(v) with lines
#1+cos(u)+.5*cos(u)*cos(v),.5*sin(v),sin(u)+.5*sin(u)*cos(v) with lines




pause -1

