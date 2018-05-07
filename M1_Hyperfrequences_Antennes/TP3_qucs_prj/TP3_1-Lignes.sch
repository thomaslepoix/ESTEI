<Qucs Schematic 0.0.19>
<Properties>
  <View=0,-142,2117,1128,0.751315,41,0>
  <Grid=10,10,1>
  <DataSet=TP3_1-Lignes.dat>
  <DataDisplay=TP3_1-Lignes.dpl>
  <OpenDisplay=1>
  <Script=TP3_1-Lignes.m>
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
  <Pac P1 1 890 350 -26 18 0 0 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 810 350 0 0 0 0>
  <MLIN MS1 1 1000 350 -26 15 0 0 "Subst1" 1 "2.78892 mm" 1 "16.621 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MSTEP MS3 1 1110 350 -26 -109 0 2 "Subst1" 1 "37.0218 mm" 1 "2.78892 mm" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS2 1 1220 350 -26 15 0 0 "Subst1" 1 "37.0218 mm" 1 "28.5151 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MOPEN MS4 1 1330 350 -26 -84 1 0 "Subst1" 1 "37.0218 mm" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <Pac P3 1 1530 350 -26 18 0 0 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 1450 350 0 0 0 0>
  <MSTEP MS10 1 1750 350 -26 -109 0 2 "Subst1" 1 "37.0218 mm" 1 "2.78892 mm" 1 "Hammerstad" 0 "Kirschning" 0>
  <MLIN MS11 1 1860 350 -26 15 0 0 "Subst1" 1 "37.0218 mm" 1 "28.5151 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MOPEN MS12 1 1970 350 -26 -84 1 0 "Subst1" 1 "37.0218 mm" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <MLIN MS7 1 1160 120 -26 15 0 0 "Subst1" 1 "37.0218 mm" 1 "28.5151 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MOPEN MS8 1 1270 120 -26 -84 1 0 "Subst1" 1 "37.0218 mm" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <Pac P2 1 890 120 -26 18 0 0 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 810 120 0 0 0 0>
  <MLIN MS5 1 1000 120 -26 15 0 0 "Subst1" 1 "2.78892 mm" 1 "16.621 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS13 1 1800 120 -26 15 0 0 "Subst1" 1 "37.0218 mm" 1 "28.5151 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MOPEN MS14 1 1910 120 -26 -84 1 0 "Subst1" 1 "37.0218 mm" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <Pac P4 1 1530 120 -26 18 0 0 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 1450 120 0 0 0 0>
  <MLIN MS15 1 1640 120 -26 15 0 0 "Subst1" 1 "2.78892 mm" 1 "28.92054 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <.SP SP1 1 490 60 0 84 0 0 "log" 1 "2 GHz" 1 "3 GHz" 1 "400" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 520 300 -31 19 0 0 "dBS11=dB(S[1,1])" 1 "dBS22=dB(S[2,2])" 1 "dBS33=dB(S[3,3])" 1 "dBS44=dB(S[4,4])" 1 "yes" 0>
  <SUBST Subst1 1 690 220 -30 24 0 0 "4.7" 1 "1.55 mm" 1 "35 um" 1 "0.014" 1 "16.78e-9" 1 "0.15e-6" 1>
  <MLIN MS9 1 1640 350 -26 15 0 0 "Subst1" 1 "2.78892 mm" 1 "28.92054 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
</Components>
<Wires>
  <1030 350 1080 350 "" 0 0 0 "">
  <920 350 970 350 "" 0 0 0 "">
  <810 350 860 350 "" 0 0 0 "">
  <1250 350 1300 350 "" 0 0 0 "">
  <1140 350 1190 350 "" 0 0 0 "">
  <1670 350 1720 350 "" 0 0 0 "">
  <1560 350 1610 350 "" 0 0 0 "">
  <1450 350 1500 350 "" 0 0 0 "">
  <1890 350 1940 350 "" 0 0 0 "">
  <1780 350 1830 350 "" 0 0 0 "">
  <1190 120 1240 120 "" 0 0 0 "">
  <1030 120 1130 120 "" 0 0 0 "">
  <920 120 970 120 "" 0 0 0 "">
  <810 120 860 120 "" 0 0 0 "">
  <1830 120 1880 120 "" 0 0 0 "">
  <1670 120 1770 120 "" 0 0 0 "">
  <1560 120 1610 120 "" 0 0 0 "">
  <1450 120 1500 120 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
