%latest method for MO ,After incorporate e^j(deta) as phase, 
function z=MO(ux,uy,mu,numMinuzie,sigma)
    z   = zeros(size(ux));
    z = complex(z,0);
    for j = 1:numMinuzie
         z= z +  exp(-1i*(ux*mu(j,1)+uy*mu(j,2)-(mu(j,3))) );
    end;
    z=z.*exp(-(ux.^2+uy.^2)/(2*(sigma^(-2))));

end