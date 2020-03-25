function [ bin ] = dec2binfixl( dec,mlength )
%DEC2BINFIXL 
%   
    bin = zeros(1,mlength);
    tmp  = dec2bin(dec);
    p=1;
    for i=mlength-length(tmp)+1:mlength
        bin(i)=str2num(tmp(p));
        p=p+1;
    end
end

