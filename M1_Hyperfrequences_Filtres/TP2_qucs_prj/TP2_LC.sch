<Qucs Schematic 0.0.19>
<Properties>
  <View=0,-40,1054,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=TP2_LC.dat>
  <DataDisplay=TP2_LC.dpl>
  <OpenDisplay=1>
  <Script=TP2_LC.m>
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
  <GND * 1 530 320 0 0 0 0>
  <GND * 1 670 320 0 0 0 0>
  <GND * 1 810 320 0 0 0 0>
  <C C3 1 810 290 17 -26 0 1 "2.9409 pF" 1 "" 0 "neutral" 0>
  <C C1 1 530 290 17 -26 0 1 "2.9409 pF" 1 "" 0 "neutral" 0>
  <C C2 1 670 290 17 -26 0 1 "4.3941 pF" 1 "" 0 "neutral" 0>
  <GND * 1 920 210 0 0 0 1>
  <GND * 1 420 210 0 0 0 3>
  <L L1 1 600 210 -27 -68 0 0 "5.319581 nH" 1 "" 0>
  <L L2 1 740 210 -28 -66 0 0 "5.319581 nH" 1 "" 0>
  <Pac P1 1 450 210 -26 -87 1 0 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Pac P2 1 890 210 -26 -87 0 2 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <Eqn Eqn1 1 340 240 -31 19 0 0 "dBS11=dB(S[1,1])" 1 "dBS21=dB(S[2,1])" 1 "yes" 0>
  <.SP SP1 1 180 140 0 77 0 0 "log" 1 "100 MHz" 1 "3 GHz" 1 "800" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
</Components>
<Wires>
  <530 210 530 260 "" 0 0 0 "">
  <670 210 670 260 "" 0 0 0 "">
  <810 210 810 260 "" 0 0 0 "">
  <530 210 570 210 "" 0 0 0 "">
  <630 210 670 210 "" 0 0 0 "">
  <670 210 710 210 "" 0 0 0 "">
  <770 210 810 210 "" 0 0 0 "">
  <810 210 860 210 "" 0 0 0 "">
  <480 210 530 210 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
