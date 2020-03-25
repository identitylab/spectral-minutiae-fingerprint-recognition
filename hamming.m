function [outputArg1] = hamming(inputArg1,inputArg2)
%HANMING 此处显示有关此函数的摘要
%   此处显示详细说明
a=reshape(inputArg1,1,numel(inputArg1));
b=reshape(inputArg2,1,numel(inputArg2));
outputArg1 = 1- pdist2(a,b,'hamming');
end

