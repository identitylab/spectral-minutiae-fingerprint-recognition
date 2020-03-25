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