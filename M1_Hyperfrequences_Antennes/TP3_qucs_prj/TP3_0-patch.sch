<Qucs Schematic 0.0.19>
<Properties>
  <View=0,-60,1187,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=TP3_0-patch.dat>
  <DataDisplay=TP3_0-patch.dpl>
  <OpenDisplay=1>
  <Script=TP3_0-patch.m>
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
  <SUBST Subst1 1 330 350 -30 24 0 0 "4.7" 1 "1.55 mm" 1 "35 um" 1 "0.02" 1 "16.78e-9" 1 "0.15e-6" 1>
  <Eqn Eqn1 1 480 440 -31 19 0 0 "S11_Patch=S[1,1]" 1 "dB_S11_Patch=dB(S11_Patch)" 1 "yes" 0>
  <.SP SP1 1 90 330 0 84 0 0 "log" 1 "2 GHz" 1 "3 GHz" 1 "400" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Pac P1 1 740 410 -26 18 0 0 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 660 410 0 0 0 0>
  <MSTEP MS1 1 850 410 -26 -109 0 2 "Subst1" 1 "37.0218 mm" 1 "2.78892 mm" 1 "Hammerstad" 0 "Kirschning" 0>
  <MOPEN MS2 1 1070 410 -26 -84 1 0 "Subst1" 1 "37.0218 mm" 1 "Hammerstad" 0 "Kirschning" 0 "Kirschning" 0>
  <MLIN MS3 1 960 410 -26 15 0 0 "Subst1" 1 "37.0218 mm" 1 "28.5288 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
</Components>
<Wires>
  <770 410 820 410 "" 0 0 0 "">
  <660 410 710 410 "" 0 0 0 "">
  <990 410 1040 410 "" 0 0 0 "">
  <880 410 930 410 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
