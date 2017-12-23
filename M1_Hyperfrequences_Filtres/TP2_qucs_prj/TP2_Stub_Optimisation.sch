<Qucs Schematic 0.0.19>
<Properties>
  <View=-490,-180,1851,1186,0.6655,8,19>
  <Grid=10,10,1>
  <DataSet=TP2_Stub_Optimisation.dat>
  <DataDisplay=TP2_Stub_Optimisation.dpl>
  <OpenDisplay=1>
  <Script=TP2_Stub_Optimisation.m>
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
  <GND * 1 -30 590 0 0 0 3>
  <GND * 1 1550 590 0 0 0 1>
  <MLIN MS1 1 110 590 -26 15 0 0 "Subst1" 1 "W50" 1 "L50" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS2 1 1410 590 -26 15 0 0 "Subst1" 1 "W50" 1 "L50" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 1 240 510 15 -26 0 1 "Subst1" 1 "W129" 1 "L129" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS4 1 1280 510 15 -26 0 1 "Subst1" 1 "W129" 1 "L129" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS5 1 1150 590 -26 15 0 0 "Subst1" 1 "W815" 1 "L815" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS6 1 370 590 -26 15 0 0 "Subst1" 1 "W815" 1 "L815" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS7 1 500 510 15 -26 0 1 "Subst1" 1 "W24" 1 "L24" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS8 1 1020 510 15 -26 0 1 "Subst1" 1 "W24" 1 "L24" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS9 1 760 510 15 -26 0 1 "Subst1" 1 "W197" 1 "L197" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS10 1 630 590 -26 15 0 0 "Subst1" 1 "W80" 1 "L80" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS11 1 890 590 -26 15 0 0 "Subst1" 1 "W80" 1 "L80" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MTEE MS12 1 240 590 -26 15 0 2 "Subst1" 1 "W815" 1 "W50" 1 "W129" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS13 1 500 590 -26 15 0 2 "Subst1" 1 "W80" 1 "W815" 1 "W24" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS14 1 760 590 -26 15 0 2 "Subst1" 1 "W80" 1 "W80" 1 "W197" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS15 1 1020 590 -26 15 0 2 "Subst1" 1 "W815" 1 "W80" 1 "W24" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS16 1 1280 590 -26 14 0 2 "Subst1" 1 "W50" 1 "W815" 1 "W129" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MOPEN MS17 1 240 420 15 -12 0 1 "Subst1" 1 "W129" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <MOPEN MS18 1 500 420 15 -12 0 1 "Subst1" 1 "W24" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <MOPEN MS19 1 760 420 15 -12 0 1 "Subst1" 1 "W197" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <MOPEN MS20 1 1020 420 15 -12 0 1 "Subst1" 1 "W24" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <MOPEN MS21 1 1280 420 15 -12 0 1 "Subst1" 1 "W129" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <Pac P1 1 0 590 -26 18 0 0 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P2 1 1520 590 -26 20 0 2 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Eqn Eqn2 1 0 120 -28 15 0 0 "W50=y*2.78601" 1 "W129=y*0.243996" 1 "W815=y*1.03624" 1 "W24=y*8.19205" 1 "W80=y*1.08403" 1 "W197=y*10.5371" 1 "L50=x*x50*21.7317" 1 "L129=x*x129*11.8202" 1 "L815=x*x815*11.3386" 1 "L24=x*x24*10.2706" 1 "L80=x*x80*11.3204" 1 "L197=x*x197*10.1400" 1 "yes" 0>
  <Eqn Eqn3 1 250 120 -31 19 0 0 "x=0.932 m" 1 "y=1 m" 1 "x50=1 " 1 "x129=1" 1 "x815=1 " 1 "x24=1 " 1 "x80=1" 1 "x197=1.03" 1 "yes" 0>
  <SUBST Subst1 1 570 150 -30 24 0 0 "4.7" 1 "1.55 mm" 1 "35 um" 1 "0.014" 1 "16.78e-9" 1 "0.15e-6" 1>
  <Eqn Eqn1 1 860 250 -31 19 0 0 "dBS11=dB(S[1,1])" 1 "dBS21=dB(S[2,1])" 1 "yes" 0>
  <.SP SP1 1 690 130 0 83 0 0 "log" 1 "100 MHz" 1 "3 GHz" 1 "800" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
</Components>
<Wires>
  <240 450 240 480 "" 0 0 0 "">
  <30 590 80 590 "" 0 0 0 "">
  <760 450 760 480 "" 0 0 0 "">
  <920 590 990 590 "" 0 0 0 "">
  <1050 590 1120 590 "" 0 0 0 "">
  <760 540 760 560 "" 0 0 0 "">
  <660 590 730 590 "" 0 0 0 "">
  <790 590 860 590 "" 0 0 0 "">
  <240 540 240 560 "" 0 0 0 "">
  <140 590 210 590 "" 0 0 0 "">
  <500 540 500 560 "" 0 0 0 "">
  <530 590 600 590 "" 0 0 0 "">
  <400 590 470 590 "" 0 0 0 "">
  <270 590 340 590 "" 0 0 0 "">
  <1440 590 1490 590 "" 0 0 0 "">
  <1020 450 1020 480 "" 0 0 0 "">
  <1020 540 1020 560 "" 0 0 0 "">
  <1280 540 1280 560 "" 0 0 0 "">
  <1180 590 1250 590 "" 0 0 0 "">
  <1310 590 1380 590 "" 0 0 0 "">
  <500 450 500 480 "" 0 0 0 "">
  <1280 450 1280 480 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
