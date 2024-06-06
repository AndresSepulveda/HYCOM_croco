#!/bin/bash

# 10900 11651
for i in {10910..11651}
do
	ncks -d time,$i,$i  -d lon,240.0,246.0 -d lat,8.0,12.0 'http://tds.hycom.org/thredds/dodsC/GLBy0.08/expt_93.0' all$i.nc
	echo $i
	sleep 1
done


#for i in {10900..11651}
for i in {10910..10909}
do
	ncks --mk_rec_dmn time all$i.nc new$i.nc	
	echo $i
%	sleep 1
done

ncrcat new?????.nc all_HYCOM.nc

rm all?????.nc
