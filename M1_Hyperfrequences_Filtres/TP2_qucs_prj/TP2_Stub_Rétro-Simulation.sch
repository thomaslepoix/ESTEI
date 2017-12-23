<Qucs Schematic 0.0.19>
<Properties>
  <View=0,-120,1715,800,0.826446,0,0>
  <Grid=10,10,1>
  <DataSet=TP2_Stub_Rétro-Simulation.dat>
  <DataDisplay=TP2_Stub_Rétro-Simulation.dpl>
  <OpenDisplay=1>
  <Script=TP2_Stub_Rétro-Simulation.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Titre>
  <FrameText1=Auteur :>
  <FrameText2=Date :>
  <FrameText3=Version :>
</Properties>
<Symbol>
</Symbol>
<Components>
  <GND * 1 70 620 0 0 0 3>
  <GND * 1 1650 620 0 0 0 1>
  <MLIN MS1 1 210 620 -26 15 0 0 "Subst1" 1 "W50" 1 "L50" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS2 1 1510 620 -26 15 0 0 "Subst1" 1 "W50" 1 "L50" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 1 340 540 15 -26 0 1 "Subst1" 1 "W129" 1 "L129" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS4 1 1380 540 15 -26 0 1 "Subst1" 1 "W129" 1 "L129" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS5 1 1250 620 -26 15 0 0 "Subst1" 1 "W815" 1 "L815" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS6 1 470 620 -26 15 0 0 "Subst1" 1 "W815" 1 "L815" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS7 1 600 540 15 -26 0 1 "Subst1" 1 "W24" 1 "L24" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS8 1 1120 540 15 -26 0 1 "Subst1" 1 "W24" 1 "L24" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS9 1 860 540 15 -26 0 1 "Subst1" 1 "W197" 1 "L197" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS10 1 730 620 -26 15 0 0 "Subst1" 1 "W80" 1 "L80" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS11 1 990 620 -26 15 0 0 "Subst1" 1 "W80" 1 "L80" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS12 1 340 620 -26 15 0 2 "Subst1" 1 "W815" 1 "W50" 1 "W129" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS13 1 600 620 -26 15 0 2 "Subst1" 1 "W80" 1 "W815" 1 "W24" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS14 1 860 620 -26 15 0 2 "Subst1" 1 "W80" 1 "W80" 1 "W197" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS15 1 1120 620 -26 15 0 2 "Subst1" 1 "W815" 1 "W80" 1 "W24" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS16 1 1380 620 -26 14 0 2 "Subst1" 1 "W50" 1 "W815" 1 "W129" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MOPEN MS17 1 340 450 15 -12 0 1 "Subst1" 1 "W129" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <MOPEN MS18 1 600 450 15 -12 0 1 "Subst1" 1 "W24" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <MOPEN MS19 1 860 450 15 -12 0 1 "Subst1" 1 "W197" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <MOPEN MS20 1 1120 450 15 -12 0 1 "Subst1" 1 "W24" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <MOPEN MS21 1 1380 450 15 -12 0 1 "Subst1" 1 "W129" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <Pac P1 1 100 620 -26 18 0 0 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P2 1 1620 620 -26 20 0 2 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Eqn Eqn1 1 100 150 -28 15 0 0 "W50=y*2.78601" 1 "W129=y*0.243996" 1 "W815=y*1.03624" 1 "W24=y*8.19205" 1 "W80=y*1.08403" 1 "W197=y*10.5371" 1 "L50=x*x50*21.7317" 1 "L129=x*x129*11.8202" 1 "L815=x*x815*11.3386" 1 "L24=x*x24*10.2706" 1 "L80=x*x80*11.3204" 1 "L197=x*x197*10.1400" 1 "yes" 0>
  <Eqn Eqn2 1 350 150 -31 19 0 0 "x=0.932 m" 1 "y=1 m" 1 "x50=1 " 1 "x129=1" 1 "x815=1 " 1 "x24=1 " 1 "x80=1" 1 "x197=1.03" 1 "yes" 0>
  <Eqn Eqn3 1 960 280 -31 19 0 0 "dBS11=dB(S[1,1])" 1 "dBS21=dB(S[2,1])" 1 "yes" 0>
  <.SP SP1 1 790 160 0 83 0 0 "log" 1 "100 MHz" 1 "3 GHz" 1 "800" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Subst1 1 670 180 -30 24 0 0 "er" 1 "h" 1 "t" 1 "tand" 1 "rho" 1 "D" 1>
  <Eqn Eqn4 1 480 150 -31 19 0 0 "er=4.7 " 1 "h=1.55 m" 1 "t=35 u" 1 "tand=0.02 " 1 "rho=16.78 n" 1 "D=150 n" 1 "yes" 0>
</Components>
<Wires>
  <340 480 340 510 "" 0 0 0 "">
  <130 620 180 620 "" 0 0 0 "">
  <860 480 860 510 "" 0 0 0 "">
  <1020 620 1090 620 "" 0 0 0 "">
  <1150 620 1220 620 "" 0 0 0 "">
  <860 570 860 590 "" 0 0 0 "">
  <760 620 830 620 "" 0 0 0 "">
  <890 620 960 620 "" 0 0 0 "">
  <340 570 340 590 "" 0 0 0 "">
  <240 620 310 620 "" 0 0 0 "">
  <600 570 600 590 "" 0 0 0 "">
  <630 620 700 620 "" 0 0 0 "">
  <500 620 570 620 "" 0 0 0 "">
  <370 620 440 620 "" 0 0 0 "">
  <1540 620 1590 620 "" 0 0 0 "">
  <1120 480 1120 510 "" 0 0 0 "">
  <1120 570 1120 590 "" 0 0 0 "">
  <1380 570 1380 590 "" 0 0 0 "">
  <1280 620 1350 620 "" 0 0 0 "">
  <1410 620 1480 620 "" 0 0 0 "">
  <600 480 600 510 "" 0 0 0 "">
  <1380 480 1380 510 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
