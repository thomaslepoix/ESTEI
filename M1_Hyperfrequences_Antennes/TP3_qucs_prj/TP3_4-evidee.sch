<Qucs Schematic 0.0.19>
<Properties>
  <View=0,0,1569,800,1,20,0>
  <Grid=10,10,1>
  <DataSet=TP3_4-evidee.dat>
  <DataDisplay=TP3_4-evidee.dpl>
  <OpenDisplay=1>
  <Script=TP3_4-evidee.m>
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
  <GND * 1 1260 420 0 0 0 0>
  <GND * 1 1190 420 0 0 0 0>
  <Pac P1 1 1190 390 -94 -26 1 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <.SP SP1 1 250 270 0 77 0 0 "lin" 1 "2 GHz" 1 "3 GHz" 1 "400" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 490 310 -31 19 0 0 "S11_Simulation=S[1,1]" 1 "S11_Mesure=S[2,2]" 1 "dB_S11_Simulation=dB(S11_Simulation)" 1 "dB_S11_Mesure=dB(S11_Mesure)" 1 "yes" 0>
  <GND * 1 980 420 0 0 0 0>
  <GND * 1 910 420 0 0 0 0>
  <Pac P2 1 910 390 -94 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <SPfile X1 1 980 360 -26 -67 0 0 "4-evidee_simulation.s1p" 1 "rectangular" 0 "linear" 0 "open" 0 "1" 0>
  <SPfile X2 1 1260 360 -26 -67 0 0 "4-évidée_mesure.s1p" 1 "rectangular" 0 "linear" 0 "open" 0 "1" 0>
</Components>
<Wires>
  <1260 390 1260 420 "" 0 0 0 "">
  <1190 360 1230 360 "" 0 0 0 "">
  <980 390 980 420 "" 0 0 0 "">
  <910 360 950 360 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
