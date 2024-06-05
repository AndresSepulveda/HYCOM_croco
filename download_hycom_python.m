function download_hycom_python(pathHYCOM, region, Y, M, lonmin, lonmax, latmin, latmax, zmax, OGCM_dir, OGCM_prefix, thedatemonth, Yorig)
    aimpath = [OGCM_dir, OGCM_prefix, 'Y', num2str(Y), 'M', num2str(M), '/'];
    timeTick = datetime(Y, M, 1);
    varList = {'ssh', 'temp', 'salt', 'u', 'v'};
    URL = ['https://data.hycom.org/datasets/GLBy0.08/expt_93.0/data/hindcasts/', num2str(Y), '/'];
    D = get_hycom_online(aimpath, [lonmin lonmax latmin latmax], timeTick, varList, URL);
end
