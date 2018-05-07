<Qucs Schematic 0.0.19>
<Properties>
  <View=0,0,1383,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=TP3_5-reseau.dat>
  <DataDisplay=TP3_5-reseau.dpl>
  <OpenDisplay=1>
  <Script=TP3_5-reseau.m>
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
  <GND * 1 1180 410 0 0 0 0>
  <GND * 1 1110 410 0 0 0 0>
  <Pac P1 1 1110 380 -94 -26 1 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <.SP SP1 1 170 260 0 77 0 0 "lin" 1 "2 GHz" 1 "3 GHz" 1 "400" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 410 300 -31 19 0 0 "S11_Simulation=S[1,1]" 1 "S11_Mesure=S[2,2]" 1 "dB_S11_Simulation=dB(S11_Simulation)" 1 "dB_S11_Mesure=dB(S11_Mesure)" 1 "yes" 0>
  <GND * 1 900 410 0 0 0 0>
  <GND * 1 830 410 0 0 0 0>
  <Pac P2 1 830 380 -94 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <SPfile X1 1 900 350 -26 -67 0 0 "5-reseau_simulation.s1p" 1 "rectangular" 0 "linear" 0 "open" 0 "1" 0>
  <SPfile X2 1 1180 350 -26 -67 0 0 "5-réseau_mesure.s1p" 1 "rectangular" 0 "linear" 0 "open" 0 "1" 0>
</Components>
<Wires>
  <1180 380 1180 410 "" 0 0 0 "">
  <1110 350 1150 350 "" 0 0 0 "">
  <900 380 900 410 "" 0 0 0 "">
  <830 350 870 350 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
