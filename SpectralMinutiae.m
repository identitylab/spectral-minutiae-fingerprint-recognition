function SpectralMinutiae
%minutie vector: xposition,yposition,orientation (30 minutiae)
% minuVect= [
% 266 18 232
% 188 21 193
% 102 22 115
% 168 29 158
% 104 37 307
% 88 50 297
% 258 57 232
% 156 59 1
% 126 69 314
% 179 70 173
% 212 72 221
% 233 98 51
% 224 105 55
% 109 112 284
% 220 118 226
% 196 129 177
% 168 141 352
% 200 163 176
% 238 178 225
% 161 182 297
% 135 195 287
% 209 202 172
% 185 204 357
% 207 235 158
% 144 245 300
% 172 248 329
% 169 284 335
% ];
minuVect= [50 75 -2.35619449019235;130 95 2.35619449019235;88 101 2.61799387799149;78 157 -2.35619449019235;189 172 -2.61799387799149;253 204 -2.35619449019235;118 217 2.61799387799149;116 229 -2.61799387799149;135 249 2.61799387799149;232 16 -0.523598775598299;193 25 -0.523598775598299;87 43 3.14159265358979;229 44 -0.523598775598299;64 64 -2.61799387799149;254 72 2.09439510239320;258 77 -1.57079632679490;138 83 0;230 86 2.35619449019235;40 116 0.785398163397448;206 126 -0.785398163397448;138 147 -1.04719755119660;137 163 2.09439510239320;227 173 -1.57079632679490;205 174 -2.09439510239320;162 176 -2.35619449019235;106 185 -1.57079632679490;243 187 -2.09439510239320;118 198 2.61799387799149;102 202 -1.04719755119660;163 211 -2.09439510239320];

%parameters
imageSize=300;
sigmaMG=1.5; %only for plot purposes

%below parameter need finetune for better performance
sigmaML=4; %0 from the paper
sigmaMO=4;
lambdaL=0.05;
lambdaH=0.58;

% plot minutiae in the spatial domain 
lx=linspace(1,imageSize,imageSize);   
[x,y]=meshgrid(lx,lx);  % //mesh
numMinu=size(minuVect,1);

z=MG(x,y,minuVect,numMinu,sigmaMG);
figure(1);
surf(x,y,z);shading interp;


%plot ML and MO functions (Fourier domain)
windowSize=5; 
flx=linspace(-windowSize,windowSize,512);
fly=linspace(-windowSize,windowSize,512);

[ux,uy]=meshgrid(flx,fly);  % //mesh
zML=ML(ux,uy,minuVect,numMinu,sigmaML);
figure(2);
imagesc(abs(zML)); title('Fourier Domain Image ML');                                          

zMO=MO(ux,uy,minuVect,numMinu,sigmaMO);
figure(3);
imagesc(abs(zMO)); title('Fourier Domain Image MO'); 


%plot ML and MO functions in the Log-polar space
%on Paper, M=128, N=128
%In the radial direction M = 128 samples are used between lambdaL and lambdaH
%In the angular direction N = 256 samples are used between  0 and 2pi


%changing the rcoords and thcoords will affect the bit number ...
%currently 512*512=262144*2 bits , I made it look nicer only 
%(times 2 because of real and imaginary component)


rcoords = linspace(lambdaL,lambdaH,512);
thcoords = linspace(0,2*pi,512);
%the old version used 0-pi oni
%latest using 0-2pi


[ri,thi] = meshgrid(thcoords,rcoords);
[lx,ly] = pol2cart((ri),thi); 
% the ri I dun noe wan to apply log or not
% since paper saying polarlog grid, But if i log it, the output image
% totally different ==
  figure(4);
 z=ML(lx,ly,minuVect,numMinu,sigmaML);
 imagesc(abs(z)); title('ML Polar coordinates'); 
 figure(5);
 z=MO(lx,ly,minuVect,numMinu,sigmaMO);
 imagesc(abs(z)); title('MO Polar coordinates'); 

%plot ML and MO functions in the Log-polar space (obtained by interpolation)
z = interp2(ux,uy,zML,lx,ly);
figure(6);
imagesc(abs(z)); title('ML Polar coordinates (interpolated)'); 

z = interp2(ux,uy,zMO,lx,ly);
figure(7);
imagesc(abs(z)); title('MO Polar coordinates (interpolated)'); 

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
         z= z +  exp(-1i*(ux*mu(j,1)+uy*mu(j,2)-(mu(j,3))) );
    end;
    z=z.*exp(-(ux.^2+uy.^2)/(2*(sigma^(-2))));

end