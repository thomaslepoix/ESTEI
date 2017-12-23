<Qucs Schematic 0.0.19>
<Properties>
  <View=0,0,1305,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=TP2_Stub_Mesure.dat>
  <DataDisplay=TP2_Stub_Mesure.dpl>
  <OpenDisplay=1>
  <Script=TP2_Stub_Mesure.m>
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
  <GND * 1 1100 580 0 0 0 0>
  <Pac P1 1 1210 550 -26 18 1 2 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 1240 550 0 0 0 1>
  <Pac P2 1 990 550 -26 18 0 0 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 960 550 0 0 0 3>
  <SPfile X1 1 1100 550 -26 -67 0 0 "TP2_Stub.s2p" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <Eqn Eqn1 1 790 510 -31 19 0 0 "S11=S[1,1]" 1 "S21=S[2,1]" 1 "dBS11=dB(S11)" 1 "dBS21=dB(S21)" 1 "yes" 0>
  <.SP SP1 1 530 470 0 83 0 0 "log" 1 "100 MHz" 1 "3 GHz" 1 "800" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
</Components>
<Wires>
  <1130 550 1180 550 "" 0 0 0 "">
  <1020 550 1070 550 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
