[ templateDir ] = convert2SpectraMOBin('data\SampleMinutiae');
combination = nchoosek(1:12, 2);
cw = 80; ch=30;
gen = [];
for i = 1:10
    i
    for j = 1:length(combination)
        file1=combination(j,:);
        genv_template1=strcat(templateDir,'\',num2str(i), '_',num2str(file1(1)),'.txt');
        genv_template2=strcat(templateDir,'\',num2str(i), '_',num2str(file1(2)),'.txt');
        Data1=dlmread(genv_template1);
        Data1 =Data1(1:end,:);
        Data2=dlmread(genv_template2);
        Data2 =Data2(1:end,:);
%         Y = miura_match(Data1, Data2, cw, ch);
        %         [ Y ] = templateSimilarity(Data1, Data2 );
         [ Y] = hamming(Data1,Data2);
        gen = [gen; Y];
    end
    
end
% impostor test
imp = [];
combination = nchoosek(1:10, 2);
for i = 1:length(combination)
    files = combination(i,:);
    i
    genv_template1=strcat(templateDir,'\',num2str(files(1)), '_2','.txt');
    genv_template2=strcat(templateDir,'\',num2str(files(2)), '_2','.txt');
    Data1=dlmread(genv_template1);
    Data2=dlmread(genv_template2);
%     Y = miura_match(Data1, Data2, cw, ch);
    %     [ Y ] = templateSimilarity(Data1, Data2 );
    % inner=(template2'*Template2);
    %
    % similiraty=trace(inner);
             [ Y] = hamming(Data1,Data2);

    imp = [imp; Y];
end


%
%  plothisf(gen,imp,'bit',1)
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.0001);
