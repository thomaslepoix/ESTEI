<Qucs Schematic 0.0.19>
<Properties>
  <View=-59,-349,1599,3030,0.909092,0,0>
  <Grid=10,10,1>
  <DataSet=TP3_1-base-adaptation.dat>
  <DataDisplay=TP3_1-base-adaptation.sch>
  <OpenDisplay=1>
  <Script=TP3_1-base-adaptation.m>
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
  <GND * 1 880 80 0 0 0 0>
  <MLIN MS1 1 770 20 -26 15 0 0 "Subst1" 1 "2.78892 mm" 1 "L" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND * 1 700 80 0 0 0 0>
  <Pac P1 1 700 50 -94 -26 1 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 880 240 0 0 0 0>
  <SPfile X2 1 880 180 -26 -67 0 0 "1-base_mesure.s1p" 1 "rectangular" 0 "linear" 0 "open" 0 "1" 0>
  <MLIN MS2 1 770 180 -26 15 0 0 "Subst1" 1 "2.78892 mm" 1 "L" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <GND * 1 700 240 0 0 0 0>
  <Pac P2 1 700 210 -94 -26 1 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <SPfile X1 1 880 20 -26 -67 0 0 "1-base_simulation.s1p" 1 "rectangular" 0 "linear" 0 "open" 0 "1" 0>
  <.SP SP1 1 460 -80 0 79 0 0 "lin" 1 "2 GHz" 1 "3 GHz" 1 "400" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Subst1 1 320 120 -30 24 0 0 "9.8" 1 "1.55 mm" 1 "35 um" 1 "0.02" 1 "16.78e-9" 1 "0.15e-6" 1>
  <Eqn Eqn2 1 460 260 -31 19 0 0 "S11_Simulation_adaptation=S[1,1]" 1 "S11_Mesure_adaptation=S[2,2]" 1 "dB_S11_Simulation_adaptation=dB(S11_Simulation_adaptation)" 1 "dB_S11_Mesure_adaptation=dB(S11_Mesure_adaptation)" 1 "x=0.37 " 1 "L=x*33.242m" 1 "yes" 0>
</Components>
<Wires>
  <880 50 880 80 "" 0 0 0 "">
  <800 20 850 20 "" 0 0 0 "">
  <700 20 740 20 "" 0 0 0 "">
  <880 210 880 240 "" 0 0 0 "">
  <800 180 850 180 "" 0 0 0 "">
  <700 180 740 180 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Smith 260 1020 400 400 3 #c0c0c0 3 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 " " "" "" "">
	<"TP3_1-base:S11_Mesure" #55ff00 2 3 0 0 0>
	  <Mkr 2.47118e+09 -286 -404 4 0 0>
	<"TP3_1-base:S11_Simulation" #ff00ff 2 3 0 0 0>
	  <Mkr 2.35589e+09 -309 -43 4 0 0>
	<"S11_Mesure_adaptation" #0000ff 2 3 0 0 0>
	  <Mkr 2.401e+09 368 -37 4 0 0>
	<"S11_Simulation_adaptation" #ff0000 2 3 0 0 0>
	  <Mkr 2.401e+09 431 -466 4 0 0>
  </Smith>
  <Rect 1020 1016 477 328 3 #c0c0c0 3 00 1 2e+09 1e+08 3e+09 1 -10.835 2 0.840683 1 -1 0.5 1 315 0 225 "Fréquence (Hz)" "" "" "">
	<"TP3_1-base:dB_S11_Mesure" #55ff00 2 3 0 0 0>
	  <Mkr 2.47118e+09 254 -123 4 0 0>
	<"TP3_1-base:dB_S11_Simulation" #ff00ff 2 3 0 0 0>
	  <Mkr 2.35589e+09 277 -188 4 0 0>
	<"dB_S11_Mesure_adaptation" #0000ff 2 3 0 0 0>
	  <Mkr 2.401e+09 239 -61 4 0 0>
	<"dB_S11_Simulation_adaptation" #ff0000 2 3 0 0 0>
	  <Mkr 2.401e+09 113 -527 4 0 0>
  </Rect>
  <Smith 260 1680 400 400 3 #c0c0c0 3 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 " " "" "" "">
	<"TP3_1-base:S11_Mesure" #55ff00 2 3 0 0 0>
	  <Mkr 2.47118e+09 -196 -484 4 0 0>
	<"S11_Mesure_adaptation" #0000ff 2 3 0 0 0>
	  <Mkr 2.41103e+09 -242 -37 4 0 0>
  </Smith>
  <Smith 250 2300 400 400 3 #c0c0c0 3 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 " " "" "" "">
	<"TP3_1-base:S11_Simulation" #ff00ff 2 3 0 0 0>
	  <Mkr 2.39348e+09 -239 -483 4 0 0>
	<"S11_Simulation_adaptation" #ff0000 2 3 0 0 0>
	  <Mkr 2.37594e+09 -259 -36 4 0 0>
  </Smith>
  <Rect 1010 2296 477 328 3 #c0c0c0 3 00 1 2e+09 1e+08 3e+09 1 -17.1512 5 1.41488 1 -1 0.5 1 315 0 225 "Fréquence (Hz)" "" "" "">
	<"TP3_1-base:dB_S11_Simulation" #ff00ff 2 3 0 0 0>
	  <Mkr 2.39348e+09 207 -148 4 0 0>
	<"dB_S11_Simulation_adaptation" #ff0000 2 3 0 0 0>
	  <Mkr 2.37594e+09 213 -77 4 0 0>
  </Rect>
  <Rect 890 1676 477 328 3 #c0c0c0 3 00 1 2e+09 1e+08 3e+09 1 -17.1512 5 1.41488 1 -1 0.5 1 315 0 225 "Fréquence (Hz)" "" "" "">
	<"TP3_1-base:dB_S11_Mesure" #55ff00 2 3 0 0 0>
	  <Mkr 2.47118e+09 274 -253 4 0 0>
	<"dB_S11_Mesure_adaptation" #0000ff 2 3 0 0 0>
	  <Mkr 2.41103e+09 229 -71 4 0 0>
	  <Mkr 2.44612e+09 278 -191 4 0 0>
	  <Mkr 2.37845e+09 227 -133 4 0 0>
  </Rect>
  <Smith 240 2950 400 400 3 #c0c0c0 3 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 " " "" "" "">
	<"TP3_1-base:S11_Mesure" #55ff00 2 3 0 0 0>
	<"S11_Mesure_adaptation" #0000ff 2 3 0 0 0>
  </Smith>
  <Rect 870 2946 477 328 3 #c0c0c0 3 00 1 2e+09 1e+08 3e+09 1 -17.1512 5 1.41488 1 -1 0.5 1 315 0 225 "Fréquence (Hz)" "" "" "">
	<"TP3_1-base:dB_S11_Mesure" #55ff00 2 3 0 0 0>
	<"dB_S11_Mesure_adaptation" #0000ff 2 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
