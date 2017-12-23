
set terminal svg size 900,500 fsize 14	
set output '~/Documents/ESTEI/M1/Hyperfréquences/TP2/Rapport/Figures/GNUplot/Caractéristique filtre.svg'

set xrange [2:14]
set yrange [-10:2]
unset key
unset grid
unset xtics
unset ytics
unset xlabel
unset ylabel
#set title "Caractéristiques d'un filtre" font 'Arial,20'
set xlabel 'Fréquence' offset 0,-2 font 'Arial,24'
set ylabel 'Amplitude (dB)' offset -6,0 font 'Arial,24'
set multiplot

set label 1 "Pertes d'insertion" at 2.5,1 font "Arial,18"
set label 2 "Ondulation" at 12,-0.5 font "Arial,18"
set label 3 "Bande passante à -3dB" at 6.7,-3.5 font "Arial,18"
set label 4 "Bande passante ondulatoire" at 6.5,-1.5 font "Arial,18"
set label 5 "fc l" at 4.5,-10.5 font "Arial,18"
set label 6 "fc h" at 11.3,-10.5 font "Arial,18"
set label 7 "-3" at 1.5,-3 font "Arial,18"
set label 8 "0" at 1.5,2 font "Arial,18"

plot '~/Documents/ESTEI/M1/Hyperfréquences/TP2/Rapport/Figures/GNUplot/Caractéristique filtre.lines.dat' with lines lt 0 lc rgb 'grey'
plot '~/Documents/ESTEI/M1/Hyperfréquences/TP2/Rapport/Figures/GNUplot/Caractéristique filtre.dat' smooth csplines with lines linewidth 2

pause -1
