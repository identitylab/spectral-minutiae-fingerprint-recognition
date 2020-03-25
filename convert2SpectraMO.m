function [ vectorOutputDir ] = convert2SpectraMO(sampledir)
%CONVERT2SPECTRA 此处显示有关此函数的摘要
%   此处显示详细说明
vectorOutputDir = strcat(pwd,'\data\','spectra_',datestr(now,'yyyymmddHHMMSS'));
mkdir(vectorOutputDir);
%minutie vector: xposition,yposition,orientation (30 minutiae)

for k = 1:100
    for kh=1:8
        filename1=strcat(pwd,'\',sampledir,'\',num2str(k), '_',num2str(kh),'.txt');
        
        Data=dlmread(filename1);
        Data =Data(2:end,:);
        
        minuVect= Data;
        
        %parameters
        imageSize=600;
        sigmaMG=3; %only for plot purposes
        
        %below parameter need finetune for better performance
        sigmaML=4; %0 from the paper
        sigmaMO=2;
        lambdaL=0.07;
        lambdaH=0.09;
        
        % plot minutiae in the spatial domain
        % plot minutiae in the spatial domain
        lx=linspace(1,imageSize,imageSize);
        [x,y]=meshgrid(lx,lx);  % //mesh
        numMinu=size(minuVect,1);
        %
        % z=MG(x,y,minuVect,numMinu,sigmaMG);
        % figure(1);
        % surf(x,y,z);shading interp;
        
        
        %plot ML and MO functions (Fourier domain)
        % windowSize=1;
        % flx=linspace(-windowSize,windowSize,500);
        % fly=linspace(-windowSize,windowSize,500);
        % [ux,uy]=meshgrid(flx,fly);  % //mesh
        %
        %
        
        % zML=abs(ML(ux,uy,minuVect,numMinu,sigmaML));
        % figure(2);
        % imagesc((zML)); title('Fourier Domain Image ML');
        %
        % zMO=abs(MO(ux,uy,minuVect,numMinu,sigmaMO));
        % figure(3);
        % imagesc((zMO)); title('Fourier Domain Image MLS');
        
        %plot ML and MO functions in the Log-polar space
        
        %In the radial direction M = 128 samples are used between lambdaL and lambdaH
        %In the angular direction N = 256 samples are used between  0 and 2pi
        
        [TH,R] = meshgrid(linspace(0,2*pi,256),linspace(lambdaL,lambdaH,128));
        [lx,ly] = pol2cart(TH,(R));
        
        %
        % z=ML(lx,ly,minuVect,numMinu,sigmaML);
        % figure(10);
        % imagesc(abs(z)); title('SML');
        
        
        zz=MO(lx,ly,minuVect,numMinu,sigmaMO);
%         zz=ML(lx,ly,minuVect,numMinu,sigmaMO);
%         figure(11);
%         imagesc(abs(zz)); title('SMC');
        
        
        filename2=strcat(vectorOutputDir,'\',num2str(k), '_',num2str(kh),'.txt');
        dlmwrite(filename2, abs(zz));
     
    end
    
end


end

