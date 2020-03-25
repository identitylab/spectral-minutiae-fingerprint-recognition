function [ EER ] = matchTemplate( templateDir )
%MATCHTEMPLATE 此处显示有关此函数的摘要
%   此处显示详细说明
%
% % sze=200;
combination = nchoosek(1:8, 2);
gen = [];

for i = 1:100
    i
    for j = 1:length(combination)
        file1=combination(j,:);
        genv_template1=strcat(templateDir,'\',num2str(i), '_',num2str(file1(1)),'.txt');
        genv_template2=strcat(templateDir,'\',num2str(i), '_',num2str(file1(2)),'.txt');
        
        
        Data1=dlmread(genv_template1);
        Data1 =Data1(1:end,:);
        
        Data2=dlmread(genv_template2);
        Data2 =Data2(1:end,:);
        
        [ Y ] = templateSimilarity(Data1, Data2 );
        gen = [gen; Y];
    end
    
end
% impostor test
imp = [];
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
    files = combination(i,:);
    
    i
    genv_template1=strcat(templateDir,'\',num2str(files(1)), '_1','.txt');
    genv_template2=strcat(templateDir,'\',num2str(files(2)), '_1','.txt');
    
    Data1=dlmread(genv_template1);
    Data1 =Data1(1:end,:);
    
    Data2=dlmread(genv_template2);
    Data2 =Data2(1:end,:);
    
    [ Y ] = templateSimilarity(Data1, Data2 );
    % inner=(template2'*Template2);
    %
    % similiraty=trace(inner);
    imp = [imp; Y];
    
end

%
%  plothisf(gen,imp,'bit',1)
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.0001);

end

