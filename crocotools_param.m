RUN_dir='/data2/matlab/CROCOv1p3/croco/PACIFICO_CENTRAL/';
FORC_DATA_DIR = [getenv('RUN_dir') './DATA/'];
CROCO_config='PACIFICO_CENTRAL';
CROCO_files_dir=[RUN_dir,'CROCO_FILES/'];
DATADIR=['/data2/matlab/CROCOv1p2p1/croco_tools/'];
topofile = [DATADIR,'Topo/etopo2.nc'];

blkname=[CROCO_files_dir,'croco_blk.nc'];
grdname=[CROCO_files_dir,'croco_grd.nc'];
frcname=[CROCO_files_dir,'croco_frc.nc'];
clmname=[CROCO_files_dir,'croco_clm.nc'];
ininame=[CROCO_files_dir,'croco_ini.nc'];
oaname=[CROCO_files_dir,'croco_oa.nc'];

blk_prefix=[CROCO_files_dir,'croco_blk'];      % bulk file name

coads_time=(15:30:345);
coads_cycle=360;
woa_time=(15:30:345);
woa_cycle=360;
level=0;

Roa=0;
makeplot=0;
makeclim=0;
makeini=1;
makeoa=1;
makebry=1;
makeZbry=1;
insitu2pot=1;

bryname=[CROCO_files_dir,'croco_bry.nc'];
Zbryname=[CROCO_files_dir,'croco_Zbry.nc'];

dl=1/37;
lonmin=-120.00;
lonmax=-114.00;
latmin=7.50;
latmax=13.00;

theta_s=5;
theta_b=2;
hc=300;
hmin=20;
N=100;
tini=0;
vtransform =2;

obc=[1 1 1 1];
zref=-1000;
interp_method = 'cubic'; 

coads_dir='/data2/matlab/CROCOv1p2p1/croco_tools/COADS05/';
climato_dir='/data2/matlab/CROCOv1p2p1/croco_tools/WOA2009/';
CROCO_title='Pacific';

Yorig         = 2000;          % reference time for vector time
                               % in croco initial and forcing files
%
Ymin          = 2022;          % first forcing year
Ymax          = 2022;          % last  forcing year
Mmin          = 3;             % first forcing month
Mmax          = 3;             % last  forcing month
%
Dmin          = 1;             % Day of initialization
Hmin          = 0;             % Hour of initialization
Min_min       = 0;             % Minute of initialization
Smin          = 0;             % Second of initialization
%
SPIN_Long     = 0;             % SPIN-UP duration in Years
%
Mth_format   = '%02d';       % Number of digits for month on input files
%
itolap_a=2;
itolap_p=2;
Download_data=1;  % Habilitar la descarga de datos
hmax=5000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 5 - Parameters for tidal forcing
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TPXO file name (TPXO6 or TPXO7)
%
tidename=[DATADIR,'TPXO7/TPXO7.nc'];
%
% Self-Attraction and Loading GOT99.2 file name
%
sal_tides=1;
salname=[DATADIR,'GOT99.2/GOT99_SAL.nc'];
%
% Number of tides component to process
%
Ntides=10;
%
% Chose order from the rank in the TPXO file :
% "M2 S2 N2 K2 K1 O1 P1 Q1 Mf Mm"
% " 1  2  3  4  5  6  7  8  9 10"
%
tidalrank=[1 2 3 4 5 6 7 8 9 10];
add_tides_fcst = 1;       % 1: add tides

% OGCM
OGCM='hycom';

if strcmp(OGCM,'hycom')
  hdays=2;
  fdays=3;
  user = '';
  password = '';
  OGCM_dir = [FORC_DATA_DIR, 'HYCOM_', CROCO_config, '/'];
  bry_prefix = [CROCO_files_dir, 'croco_bry_hycom_'];
  clm_prefix = [CROCO_files_dir, 'croco_clm_hycom_'];
  ini_prefix = [CROCO_files_dir, 'croco_ini_hycom_'];
  OGCM_prefix = 'hycom_';
end
%--------------------------------------------------
%  Options for make_ERA5  
%--------------------------------------------------
%
ERA5_dir = [FORC_DATA_DIR,'ERA5_',CROCO_config,'/'];
My_ERA5_dir = [FORC_DATA_DIR,'ERA5/'];
itolap_era5 = 2;
% 
netcdf.setDefaultFormat('FORMAT_NETCDF4');
