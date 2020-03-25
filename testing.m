function SpectralMinutiae
clear all
%minutie vector: xposition,yposition,orientation (30 minutiae)

file = dir('SampleMinutiae');
file = file(~[file.isdir]); NF = length(file);
for k = 1 : 10
    for kh=1:12
        filename1=strcat(pwd,'\data\SampleMinutiae\',num2str(k), '_',num2str(kh),'.txt');
        
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
        lambdaH=0.1;
        
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
%         figure(11);
%         imagesc(abs(zz)); title('SMC');
        
        
        filename2=strcat(pwd,'\data\SampleMinutiae_SM\',num2str(k), '_',num2str(kh),'.txt');
        dlmwrite(filename2, abs(zz));
        file(k).name
    end
    
    
    %plot ML and MO functions in the Log-polar space (obtained by interpolation)
    
    %
    % z = interp2(ux,uy,zML,lx,ly);
    % figure(6);
    % imagesc(abs(z)); title('ML Polar coordinates (interpolated)');
    %
end

%Spatial domain function
    function z=MG(x,y,minuVect,numMinu,sigma)
        amplitude = 1.0 / (sigma * sqrt(2.0*pi));
        z = zeros(size(x));
        for j = 1:numMinu
            z= z + exp(-((x-minuVect(j,1)).^2+(y-minuVect(j,2)).^2)/( 2* sigma^2)) ;
        end;
        z=z.*amplitude;
        
    end


%ML Fourier domain function
    function z=ML(ux,uy,minuVect,numMinu,sigma)
        z = zeros(size(ux));
        z = complex(z,0);
        for j = 1:numMinu
            z= z + exp(-1j*((ux*minuVect(j,1))+(uy*minuVect(j,2)))) ;
        end;
        den=-(sigma^(-2))*2;
        z=z.*exp((ux.^2+uy.^2)/den);
    end


%latest method for MO ,After incorporate e^j(deta) as phase,
    function z=MO(ux,uy,mu,numMinuzie,sigma)
        z   = zeros(size(ux));
        z = complex(z,0);
        for j = 1:numMinuzie
            %         z= z + 1j*(ux*cos(mu(j,3))+uy*sin(mu(j,3))) .* exp(-1i*(ux*mu(j,1)+uy*mu(j,2))) ;
            %     end;
            %          z= z +  exp(-1i*(ux*mu(j,1)+uy*mu(j,2)) );
            z= z +  exp(-1i*(ux*mu(j,1)+uy*mu(j,2)-(mu(j,3))) );
        end
        z=z.*exp(-(ux.^2+uy.^2)/(2*(sigma^(-2))));
        
    end
end
