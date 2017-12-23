<Qucs Schematic 0.0.19>
<Properties>
  <View=0,-60,1569,800,1,20,0>
  <Grid=10,10,1>
  <DataSet=TP2_Step_Optimisation_MLIN.dat>
  <DataDisplay=TP2_Step_Optimisation_MLIN.dpl>
  <OpenDisplay=1>
  <Script=TP2_Step_Optimisation_MLIN.m>
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
  <GND * 1 1410 610 0 0 0 1>
  <Pac P2 1 1380 610 -26 -87 0 2 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <MLIN MS12 1 1270 610 -26 15 0 0 "Subst1" 1 "W50" 1 "L50" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS5 1 1160 610 -26 15 0 0 "Subst1" 1 "W170" 1 "L170" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS4 1 1050 610 -26 15 0 0 "Subst1" 1 "W123" 1 "L123" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 1 940 610 -26 15 0 0 "Subst1" 1 "W254" 1 "L254" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS2 1 830 610 -26 15 0 0 "Subst1" 1 "W123" 1 "L123" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS1 1 720 610 -26 15 0 0 "Subst1" 1 "W170" 1 "L170" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND * 1 470 610 0 0 0 3>
  <Pac P1 1 500 610 -26 -87 1 0 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <MLIN MS10 1 610 610 -26 15 0 0 "Subst1" 1 "W50" 1 "L50" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Eqn Eqn3 1 620 340 -31 19 0 0 "W50=y*2.78601" 1 "W170=y*23.5963" 1 "W123=y*0.670928" 1 "W254=y*23.5963" 1 "L50=x*x50*21.7317" 1 "L170=x*x170*4.242" 1 "L123=x*x123*9.386" 1 "L254=x*x254*6.338" 1 "yes" 0>
  <Eqn Eqn2 1 810 340 -31 19 0 0 "x=0.974059 m" 1 "y=1 m" 1 "x50=1" 1 "x170=1" 1 "x123=1" 1 "x254=0.946 " 1 "yes" 0>
  <SUBST Subst1 1 950 360 -30 24 0 0 "4.7" 1 "1.55 mm" 1 "35 um" 1 "0.014" 1 "16.78e-9" 1 "0.15e-6" 1>
  <.SP SP1 1 1070 330 0 83 0 0 "log" 1 "100 MHz" 1 "3 GHz" 1 "800" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 1230 430 -31 19 0 0 "dBS11=dB(S[1,1])" 1 "dBS21=dB(S[2,1])" 1 "yes" 0>
</Components>
<Wires>
  <1300 610 1350 610 "" 0 0 0 "">
  <1190 610 1240 610 "" 0 0 0 "">
  <1080 610 1130 610 "" 0 0 0 "">
  <970 610 1020 610 "" 0 0 0 "">
  <860 610 910 610 "" 0 0 0 "">
  <750 610 800 610 "" 0 0 0 "">
  <640 610 690 610 "" 0 0 0 "">
  <530 610 580 610 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
