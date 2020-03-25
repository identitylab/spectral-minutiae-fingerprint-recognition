%Spatial domain function 
function z=MG(x,y,minuVect,numMinu,sigma)
    amplitude = 1.0 / (sigma * sqrt(2.0*pi));
    z = zeros(size(x));
    for j = 1:numMinu
         z= z + exp(-((x-minuVect(j,1)).^2+(y-minuVect(j,2)).^2)/( 2* sigma^2)) ;
    end;
    z=z.*amplitude;

end