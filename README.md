#Downloading HYCOM

ncks 'https://tds.hycom.org/thredds/dodsC/GLBy0.08/expt_93.0/uv3z?lon[3000:1:3100],lat[2200:1:2300],time[11000:1:11750],depth[0:1:39],water_v[11000:1:11750][0:1:39][3000:1:3100][2200:1:2300]' water_v.nc

ncks 'https://tds.hycom.org/thredds/dodsC/GLBy0.08/expt_93.0/uv3z?lon[3000:1:3100],lat[2200:1:2300],time[11000:1:11750],depth[0:1:39],water_u[11000:1:11750][0:1:39][3000:1:3100][2200:1:2300]' water_u.nc

ncks 'https://tds.hycom.org/thredds/dodsC/GLBy0.08/expt_93.0/ts3z?lon[3000:1:3100],lat[2200:1:2300],time[11000:1:11750],depth[0:1:39],water_temp[11000:1:11750][0:1:39][3000:1:3100][2200:1:2300]' water_temp.nc

ncks 'https://tds.hycom.org/thredds/dodsC/GLBy0.08/expt_93.0/ts3z?lon[3000:1:3100],lat[2200:1:2300],time[11000:1:11750],depth[0:1:39],salinity[11000:1:11750][0:1:39][3000:1:3100][2200:1:2300]' salinity.nc

ncks 'https://tds.hycom.org/thredds/dodsC/GLBy0.08/expt_93.0/ssh?lon[3000:1:3100],lat[2200:1:2300],time[11000:1:11750],depth[0:1:39],surf_el[11000:1:11750][0:1:39][3000:1:3100][2200:1:2300]' surf_el.nc
