%%%% SYSTEM
clear;
close all;
physical_constants;
suffix = "3-quart2";

%~/testopenems$ git clone https://github.com/thliebig/CTB
addpath('~/testopenems/CTB');
Sim_Path = 'tmp';
Sim_CSX = 'patch.xml';
[status, message, messageid] = rmdir( Sim_Path, 's' );
[status, message, messageid] = mkdir( Sim_Path );



%%%% VAR
f0 = 2.4e9;
fc = 1e9;

unit = 1e-3;

substrate.tand = 0.02;
substrate.Er = 4.7;
substrate.K = substrate.tand * 2 * pi * f0 * EPS0 * substrate.Er;
substrate.h = 1.55;
substrate.L = 100;
substrate.W = 80;
substrate.cells = 4;

patch.L = 28.5288;
patch.W = 37.0218;

line.L = 16.621;		%%mres/60
line.W = 2.8892;		%%sres/20
trans.L = 17.8731;		%%mres/50
trans.W = 0.39863;		%%sres/20

ground.L = substrate.L;
ground.W = substrate.W;

copper.h = 0.035;

feed.W = line.W;
feed.h = substrate.h;
feed.R = 50;

SimBox = [120, 120, 90];

mdiv = 56;
sdiv = 30;
mres = c0 / (f0 + fc) / unit / mdiv; %60
sres = c0 / (f0 + fc) / unit / sdiv;
disp( ['->    mres = ' num2str(mres) ' mm']);
disp( ['->    sres = ' num2str(sres) ' mm']);

tres = 300000;



%%%% SIMU
FDTD = InitFDTD('NrTS', tres );
FDTD = SetGaussExcite( FDTD, f0, fc );
BC = {'MUR' 'MUR' 'MUR' 'MUR' 'MUR' 'MUR'};
FDTD = SetBoundaryCond( FDTD, BC );



%%%% SHAPE
CSX = InitCSX();

CSX = AddMetal(CSX, 'Ground' );
CSX = AddMetal(CSX, 'Patch');
CSX = AddMetal(CSX, 'Line');
CSX = AddMetal(CSX, 'Trans');
CSX = AddMaterial(CSX, 'Substrate' );
CSX = SetMaterialProperty(CSX, 'Substrate', 'Epsilon', substrate.Er, 'Kappa', substrate.K);

CSX = AddBox(CSX, 'Substrate', 1, [-substrate.W/2, -substrate.L/2, -substrate.h], [substrate.W/2, substrate.L/2, 0]);
CSX = AddBox(CSX, 'Ground', 2, [-ground.W/2, -ground.L/2, -substrate.h], [ground.W/2, ground.L/2, -substrate.h-copper.h]);
CSX = AddBox(CSX, 'Line', 2, [-line.W/2, -patch.L/2-line.L, 0], [line.W/2, -patch.L/2-line.L-trans.L, copper.h]);
CSX = AddBox(CSX, 'Trans', 2, [-trans.W/2, -patch.L/2, 0], [trans.W/2, -patch.L/2-line.L, copper.h]);
CSX = AddBox(CSX, 'Patch', 2, [-patch.W/2, -patch.L/2, 0], [patch.W/2, patch.L/2, copper.h]);



%%%% MESH
mesh.x = [ ...
	(-substrate.W/2) ...
	(substrate.W/2) ...
	(-feed.W/2)-(2*mres/3) ...
	(-feed.W/2)+(mres/3) ...
	(feed.W/2)+(2*mres/3) ...
	(feed.W/2)-(mres/3) ...
	(-trans.W/2)-(2*mres/3) ...
	(-trans.W/2)+(mres/3) ...
	(trans.W/2)+(2*mres/3) ...
	(trans.W/2)-(mres/3) ...
	(-patch.W/2)-(2*mres/3) ...
	(-patch.W/2)+(mres/3) ...
	(patch.W/2)+(2*mres/3) ...
	(patch.W/2)-(mres/3) ...
	(0) ...
	];
mesh.y = [ ...
	(-substrate.L/2) ...
	(substrate.L/2) ...
	(-patch.L/2)-(2*mres/3) ...
	(-patch.L/2)+(mres/3) ...
	(patch.L/2)+(2*mres/3) ...
	(patch.L/2)-(mres/3) ...
	(-patch.L/2-trans.L)+(2*mres/3) ...
	(-patch.L/2-trans.L)-(mres/3) ...
%	(-patch.L/2-line.L)-(2*mres/3) ...
%	(-patch.L/2-line.L)+(mres/3) ...
	(-patch.L/2-line.L-trans.L) ...
	(0) ...
	];
mesh.z = linspace(-substrate.h-copper.h, copper.h, substrate.cells);
mesh = SmoothMesh(mesh, mres);

mesh.x = [mesh.x, -SimBox(1)/2, SimBox(1)/2];
mesh.y = [mesh.y, -SimBox(2)/2, SimBox(2)/2];
mesh.z = [mesh.z, -SimBox(3)/2, SimBox(3)/2];
mesh = SmoothMesh(mesh, sres);

CSX = DefineRectGrid( CSX, unit, mesh );



%%%% PORT
start = [-feed.W/2, -patch.L/2-trans.L-line.L+0.1, 0];
stop  = [feed.W/2, -patch.L/2-trans.L-line.L-0.1, -substrate.h];
[CSX port] = AddLumpedPort(CSX, 5, 1, feed.R, start, stop, [0 0 1], true);



%%%% NF2FF
start = [mesh.x(10), mesh.y(10), mesh.z(10)];
stop  = [mesh.x(end-9), mesh.y(end-9), mesh.z(end-9)];
[CSX nf2ff] = CreateNF2FFBox(CSX, 'nf2ff', start, stop);



%%%% DUMP ET
start = [-substrate.W/2, -substrate.L/2, copper.h];
stop  = [ substrate.W/2,  substrate.L/2, copper.h];
CSX = AddDump(CSX,'Et');
CSX = AddBox(CSX,'Et',0,start,stop);
%%%% DUMP HT
CSX = AddDump(CSX,'Ht','DumpType',1);
CSX = AddBox(CSX,'Ht',0,start,stop);
%%%% DUMP CURRENT
CSX = AddDump(CSX,'Jt','DumpType',2,'DumpMode',0);
CSX = AddBox(CSX,'Jt',0,start,stop);
%%%% DUMP CURRENT DENSITY
CSX = AddDump(CSX,'Cdt','DumpType',3);
CSX = AddBox(CSX,'Cdt',0,start,stop);



%%%% RUN SIMU
WriteOpenEMS([Sim_Path '/' Sim_CSX], FDTD, CSX);
CSXGeomPlot([Sim_Path '/' Sim_CSX]);
RunOpenEMS( Sim_Path, Sim_CSX);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% VAR
freq = linspace( max([1e9,f0-fc]), f0+fc, 501 );
port = calcPort(port, Sim_Path, freq);
Zin = port.uf.tot ./ port.if.tot;
s11 = port.uf.ref ./ port.uf.inc;
P_in = 0.5 * port.uf.inc .* conj( port.if.inc ); % antenna feed power
Pin_f0 = interp1(freq, port.P_acc, f0);



%%%% SAVE TOUCHSTONE
spara = [];
spara(1,1,:) = s11;
write_touchstone('s',freq,spara,[suffix, '.s1p']);



%%%% S11 & ZIN
% plot feed point impedance
figure
plot( freq/1e6, abs(Zin), 'k-', 'Linewidth', 2 );
hold on
grid on
plot( freq/1e6, real(Zin), 'g--', 'Linewidth', 2 );
hold on
plot( freq/1e6, imag(Zin), 'm--', 'Linewidth', 2 );
title( 'feed point impedance' );
xlabel( 'frequency f (MHz)' );
ylabel( 'impedance Zin (Ohm)' );
legend( 'abs', 'real', 'imag' );
% plot reflection coefficient S11
figure
plot( freq/1e6, 20*log10(abs(s11)), 'm-', 'Linewidth', 2 );
grid on
title( 'reflection coefficient S11' );
xlabel( 'frequency f (MHz)' );
ylabel( 'reflection coefficient |S11|' );
drawnow



%%%% ROS
sigmaf = abs(s11);
sigmap = 1+(sigmaf);
sigmam = 1-(sigmaf);
 
figure
plot( freq/1e6,  sigmap./sigmam, 'g-', 'Linewidth', 2 );
grid on
title( 'VSWR' );
xlabel( 'frequency f (MHz)' );
ylabel( 'VSWR' );
drawnow



%% NFFF contour plots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%find resonance frequency from s11
f_res_ind = find(s11==min(s11));
f_res = freq(f_res_ind);

sigmaf = abs(s11(f_res_ind));
sigmap = 1+(sigmaf);
sigmam = 1-(sigmaf);

% calculate the far field at phi=0 degrees and at phi=90 degrees
disp( 'calculating far field at phi=[0 90] deg...' );
nf2ff = CalcNF2FF(nf2ff, Sim_Path, f_res, [-180:2:180]*pi/180, [0 90]*pi/180);
% display power and directivity
disp(['↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓']);
disp( ['->    radiated power: Prad = ' num2str(nf2ff.Prad) ' Watt']);
disp( ['->    directivity: Dmax = ' num2str(nf2ff.Dmax) ' (' num2str(10*log10(nf2ff.Dmax)) ' dBi)']);
disp( ['->    efficiency: nu_rad = ' num2str(100*nf2ff.Prad./real(P_in(f_res_ind))) ' %']);
disp( ['->    S11 @ ', num2str(f_res/1e9), 'GHz = ', num2str(20*log10(abs(min(s11)))), ' dB']);
disp( ['->    Zin @ ', num2str(f_res/1e9), 'GHz = ', num2str(Zin(f_res_ind)), ]);
disp( ['->    |Zin| @ ', num2str(f_res/1e9), 'GHz = ', num2str(abs(Zin(f_res_ind))), ' Ohm' ]);
disp( ['->    VSWR @ ', num2str(f_res/1e9), 'GHz = ', num2str(sigmap./sigmam) ]);
disp(['↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑']);



%%%% DIRECTIVITY
%%%% POLAR dB NORMALISE
figure
polarFF(nf2ff,'xaxis','theta','param',[1 2],'normalize',1,'xtics',10)
drawnow
%%%% POLAR dBi
figure
polarFF(nf2ff,'xaxis','theta','param',[1 2],'logscale',[-20 10], 'xtics', 10);
drawnow
%%%% RECT dBi
figure
plotFFdB(nf2ff,'xaxis','theta','param',[1 2])
drawnow



%%%% 3D dB
disp( 'calculating 3D far field pattern and dumping to vtk (use Paraview to visualize)...' );
thetaRange = (0:2:180);
phiRange = (0:2:360) - 180;
nf2ff = CalcNF2FF(nf2ff, Sim_Path, f_res, thetaRange*pi/180, phiRange*pi/180,'Verbose',1,'Outfile','3D_Pattern.h5');
figure
plotFF3D(nf2ff,'logscale',-20);
E_far_normalized = nf2ff.E_norm{1} / max(nf2ff.E_norm{1}(:)) * nf2ff.Dmax;
DumpFF2VTK([Sim_Path '/3D_Pattern.vtk'],E_far_normalized,thetaRange,phiRange,'scale',1e-3);
drawnow

%%%% 3D V/m
phiRange = sort( unique( [-180:5:-100 -100:2.5:-50 -50:1:50 50:2.5:100 100:5:180] ) );
thetaRange = sort( unique([ 0:1:50 50:2.:100 100:5:180 ]));
disp( 'calculating 3D far field...' );
nf2ff = CalcNF2FF(nf2ff, Sim_Path, f_res, thetaRange*pi/180, phiRange*pi/180, 'Verbose',2,'Outfile','nf2ff_3D.h5');
figure
plotFF3D(nf2ff);
drawnow



%%%% SAVE DATA
FID = fopen([suffix, '.txt'], 'w');
fdisp(FID, ['tres = ', num2str(tres)]);
fdisp(FID, ['mres = lambda/', num2str(mdiv), ' = ', num2str(mres), 'mm']);
fdisp(FID, ['sres = lambda/', num2str(sdiv), ' = ', num2str(sres), 'mm']);
fdisp(FID, ['↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓']);
fdisp(FID, ['->    S11 @ ', num2str(f_res/1e9), 'GHz = ', num2str(20*log10(abs(min(s11)))), ' dB']);
fdisp(FID, ['->    Zin @ ', num2str(f_res/1e9), 'GHz = ', num2str(Zin(f_res_ind)), ]);
fdisp(FID, ['->    |Zin| @ ', num2str(f_res/1e9), 'GHz = ', num2str(abs(Zin(f_res_ind))), ' Ohm' ]);
fdisp(FID, ['->    VSWR @ ', num2str(f_res/1e9), 'GHz = ', num2str(sigmap./sigmam) ]);
fdisp(FID, ['->    radiated power: Prad = ' num2str(abs(nf2ff.Prad)) ' Watt']);
fdisp(FID, ['->    directivity: Dmax = ' num2str(abs(nf2ff.Dmax)) ' (' num2str(10*log10(abs(nf2ff.Dmax))) ' dBi)']);
fdisp(FID, ['->    efficiency: nu_rad = ' num2str(100*abs(nf2ff.Prad)./real(P_in(f_res_ind))) ' %']);
fdisp(FID, ['↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑']);



%%%% SAVE PLOTS
print(1, ["Zin_", suffix, ".pdf"]);
print(2, ["S11_", suffix, ".pdf"]);
print(3, ["VSWR_", suffix, ".pdf"]);
print(4, ["dir_polar_dB_norm_", suffix, ".pdf"]);
print(5, ["dir_polar_dB_", suffix, ".pdf"]);
print(6, ["dir_dB_", suffix, ".pdf"]);
print(7, ["farfield_3D_dB_", suffix, ".png"]);
print(8, ["farfield_3D_Vm_", suffix, ".png"]);



disp(["\nDONE : Press any key to quit ", suffix, '.m . . .']);
pause()
