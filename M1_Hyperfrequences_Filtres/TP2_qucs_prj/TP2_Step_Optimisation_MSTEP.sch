<Qucs Schematic 0.0.19>
<Properties>
  <View=0,-300,1340,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=TP2_Step_Optimisation_MSTEP.dat>
  <DataDisplay=TP2_Step_Optimisation_MSTEP.dpl>
  <OpenDisplay=1>
  <Script=TP2_Step_Optimisation_MSTEP.m>
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
  <GND * 1 160 270 0 0 0 3>
  <MLIN MS2 1 440 270 -26 15 0 0 "Subst1" 1 "W170" 1 "L170" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 1 580 270 -26 15 0 0 "Subst1" 1 "W123" 1 "L123" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS4 1 720 270 -26 15 0 0 "Subst1" 1 "W254" 1 "L254" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS5 1 860 270 -26 15 0 0 "Subst1" 1 "W123" 1 "L123" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS6 1 1000 270 -26 15 0 0 "Subst1" 1 "W170" 1 "L170" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND * 1 1280 270 0 0 0 1>
  <MSTEP MS10 1 930 270 -26 -109 0 2 "Subst1" 1 "W170" 1 "W123" 1 "Hammerstad" 0 "Kirschning" 0>
  <MSTEP MS11 1 510 270 -26 -109 1 0 "Subst1" 1 "W170" 1 "W123" 1 "Hammerstad" 0 "Kirschning" 0>
  <MSTEP MS12 1 650 270 -26 -109 0 2 "Subst1" 1 "W254" 1 "W123" 1 "Hammerstad" 0 "Kirschning" 0>
  <MSTEP MS13 1 790 270 -26 -109 1 0 "Subst1" 1 "W254" 1 "W123" 1 "Hammerstad" 0 "Kirschning" 0>
  <Pac P1 1 190 270 -26 -87 1 0 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P2 1 1250 270 -26 -87 0 2 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <MLIN MS1 1 300 270 -26 15 0 0 "Subst1" 1 "W50" 1 "L50" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MSTEP MS8 1 370 270 -26 -109 0 2 "Subst1" 1 "W170" 1 "W50" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS7 1 1140 270 -26 15 0 0 "Subst1" 1 "W50" 1 "L50" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MSTEP MS9 1 1070 270 -26 -109 1 0 "Subst1" 1 "W170" 1 "W50" 1 "Hammerstad" 0 "Kirschning" 0>
  <Eqn Eqn1 1 1050 20 -31 19 0 0 "dBS11=dB(S[1,1])" 1 "dBS21=dB(S[2,1])" 1 "yes" 0>
  <SUBST Subst1 1 760 -60 -30 24 0 0 "4.7" 1 "1.55 mm" 1 "35 um" 1 "0.014" 1 "16.78e-9" 1 "0.15e-6" 1>
  <.SP SP1 1 880 -100 0 83 0 0 "log" 1 "100 MHz" 1 "3 GHz" 1 "800" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn2 1 400 -100 -31 19 0 0 "W50=y*2.78601" 1 "W170=y*23.5963" 1 "W123=y*0.670928" 1 "W254=y*23.5963" 1 "L50=x*x50*21.7317" 1 "L170=x*x170*4.242" 1 "L123=x*x123*9.386" 1 "L254=x*x254*6.338" 1 "yes" 0>
  <Eqn Eqn3 1 600 -80 -31 19 0 0 "x=0.321932892 m" 1 "y=1 m" 1 "x50=1" 1 "x170=1" 1 "x123=1" 1 "x254=1" 1 "yes" 0>
</Components>
<Wires>
  <220 270 270 270 "" 0 0 0 "">
  <1170 270 1220 270 "" 0 0 0 "">
  <330 270 340 270 "" 0 0 0 "">
  <400 270 410 270 "" 0 0 0 "">
  <610 270 620 270 "" 0 0 0 "">
  <680 270 690 270 "" 0 0 0 "">
  <820 270 830 270 "" 0 0 0 "">
  <750 270 760 270 "" 0 0 0 "">
  <890 270 900 270 "" 0 0 0 "">
  <960 270 970 270 "" 0 0 0 "">
  <1100 270 1110 270 "" 0 0 0 "">
  <1030 270 1040 270 "" 0 0 0 "">
  <540 270 550 270 "" 0 0 0 "">
  <470 270 480 270 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
