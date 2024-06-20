close all
clear all
u=load('uval.csv');
v=load('vval.csv');
depth=-1*u(1,:);
diezp=[];
cincp=[];
novep=[];
for i = 1:length(depth)
    indx=find((abs(u(2:end,i)) < 1) & (abs(v(2:end,i)) < 1));
    indxu=find(abs(u(2:end,i)) < 1);
    indxv=find(abs(v(2:end,i)) < 1);
    b=u(indx,i);
    c=v(indx,i);
    mags=sqrt(b.*b+c.*c);
    Pm = prctile(mags,[10 50 90]);
    diezp(i)=Pm(1);
    cincp(i)=Pm(2);
    novep(i)=Pm(3);
end

figure(1)
plot(cincp,depth,'-xr',diezp,depth,'-xb',novep,depth,'-xk')

win_start
diezpm=[];
cincpm=[];
novepm=[];
nc=netcdf('cmems_perfil_v3.nc','r');
  ucmems=squeeze(nc{'uo'}(:,:,:,:));
  vcmems=squeeze(nc{'vo'}(:,:,:,:));
  dcmems=-1*squeeze(nc{'depth'}(:));
close(nc)

for i=1:size(vcmems,2)
    cmags=sqrt(ucmems(:,i).*ucmems(:,i)+vcmems(:,i).*vcmems(:,i));
    Pcm = prctile(cmags,[10 50 90]);
    diezpc(i)=Pcm(1);
    cincpc(i)=Pcm(2);
    novepc(i)=Pcm(3);
end

hold on
plot(cincpc,dcmems,'-*r',diezpc,dcmems,'-*b',novepc,dcmems,'-*k')

diezph=[];
cincph=[];
noveph=[];
nc=netcdf('hycom_all.nc','r');
  uhycom=squeeze(nc{'water_u'}(:,:,:,:))/1000.;
  vhycom=squeeze(nc{'water_v'}(:,:,:,:))/1000.;
  depthh=-1*squeeze(nc{'depth'}(:));
close(nc)

for i=1:size(vhycom,2)
    hmags=sqrt(uhycom(:,i).*uhycom(:,i)+vhycom(:,i).*vhycom(:,i));
    Pch = prctile(hmags,[10 50 90]);
    diezph(i)=Pch(1);
    cincph(i)=Pch(2);
    noveph(i)=Pch(3);
end

plot(cincph,depthh,'-or',diezph,depthh,'-ob',noveph,depthh,'-ok')


diezpcc1=[];
cincpcc1=[];
novepcc1=[];
nc=netcdf('croco_avg_Y2022M09-11_ADCP.nc.1','r');
  ucc1=squeeze(nc{'u'}(:,:,:,:));
  vcc1=squeeze(nc{'v'}(:,:,:,:));
  hmax=squeeze(nc{'h'}(:,:));
  depthcc1=nc.Cs_r(:)*hmax;
close(nc)

for i=1:size(vcc1,2)
    cc1mags=sqrt(ucc1(:,i).*ucc1(:,i)+vcc1(:,i).*vcc1(:,i));
    Pccc1 = prctile(cc1mags,[10 50 90]);
    diezpcc1(i)=Pccc1(1);
    cincpcc1(i)=Pccc1(2);
    novepcc1(i)=Pccc1(3);
end

plot(cincpcc1,depthcc1,'-+r',diezpcc1,depthcc1,'-+b',novepcc1,depthcc1,'-+k')

ylabel('Depth [m]')
xlabel('Magnitude [m/s]')
title(['ADCP, CMEMS and HYCOM Data ','(',num2str(size(v(:,1),1)),'/',num2str(size(vcmems,1)),'/',num2str(size(vhycom,1)),'/',num2str(size(vcc1,1)),')'])
legend('Median - A','10% - A','90% - A','Median - C','10% - C','90% - C','Median - H','10% - H','90% - H','Median - CC1','10% - CC1','90% - CC1','Location','southeast')
axis([0 0.25 -1600 -700])

hold off

figure(2)

plot(cincpc,dcmems,'-*r',diezpc,dcmems,'-*b',novepc,dcmems,'-*k')
hold on
plot(cincph,depthh,'-or',diezph,depthh,'-ob',noveph,depthh,'-ok')
plot(cincpcc1,depthcc1,'-+r',diezpcc1,depthcc1,'-+b',novepcc1,depthcc1,'-+k')

ylabel('Depth [m]')
xlabel('Magnitude [m/s]')
title(['CMEMS and HYCOM Data','(',num2str(size(vcmems,1)),'/',num2str(size(vhycom,1)),'/',num2str(size(vcc1,1)),')'])
legend('Median - C','10% - C','90% - C','Median - H','10% - H','90% - H','Median - CC1','10% - CC1','90% - CC1','Location','southeast')
axis([0 0.25 -4000 -0])
hold off
