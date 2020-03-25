[ templateDir ] = convert2SpectraML('data\FVC2002_DB2_A_OUT');
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
for finger=1:8
    % impostor test
imp = [];
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
    files = combination(i,:);
    
    i
    genv_template1=strcat(templateDir,'\',num2str(files(1)), '_',num2str(finger),'.txt');
    genv_template2=strcat(templateDir,'\',num2str(files(2)), '_',num2str(finger),'.txt');
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
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.0001);
scoress(finger)= EER;
end
xingbo_matlab_tools.mailTome(strcat('FVC2002_DB2_A_OUT-ML:',',EER=',num2str(scoress)),' ');

%---------------------------------------------------------
[ templateDir ] = convert2SpectraML('data\FVC2002_DB1_A_OUT');
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
for finger=1:8
    % impostor test
imp = [];
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
    files = combination(i,:);
    
    i
    genv_template1=strcat(templateDir,'\',num2str(files(1)), '_',num2str(finger),'.txt');
    genv_template2=strcat(templateDir,'\',num2str(files(2)), '_',num2str(finger),'.txt');
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
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.0001);
scoress(finger)= EER;
end
xingbo_matlab_tools.mailTome(strcat('FVC2002_DB1_A_OUT-ML:',',EER=',num2str(scoress)),' ');
%---------------------------------------------------------

[ templateDir ] = convert2SpectraML('data\FVC2002_DB3');
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
for finger=1:8
    % impostor test
imp = [];
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
    files = combination(i,:);
    
    i
    genv_template1=strcat(templateDir,'\',num2str(files(1)), '_',num2str(finger),'.txt');
    genv_template2=strcat(templateDir,'\',num2str(files(2)), '_',num2str(finger),'.txt');
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
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.0001);
scoress(finger)= EER;
end
xingbo_matlab_tools.mailTome(strcat('FVC2002_DB3-ML:',',EER=',num2str(scoress)),' ');

%---------------------------------------------------------
[ templateDir ] = convert2SpectraML('data\FVC2004_DB1');
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
for finger=1:8
    % impostor test
imp = [];
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
    files = combination(i,:);
    
    i
    genv_template1=strcat(templateDir,'\',num2str(files(1)), '_',num2str(finger),'.txt');
    genv_template2=strcat(templateDir,'\',num2str(files(2)), '_',num2str(finger),'.txt');
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
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.0001);
scoress(finger)= EER;
end
xingbo_matlab_tools.mailTome(strcat('FVC2004_DB1-ML:',',EER=',num2str(scoress)),' ');




%---------------------------------------------------------
[ templateDir ] = convert2SpectraML('data\FVC2004_DB2');
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
for finger=1:8
    % impostor test
imp = [];
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
    files = combination(i,:);
    
    i
    genv_template1=strcat(templateDir,'\',num2str(files(1)), '_',num2str(finger),'.txt');
    genv_template2=strcat(templateDir,'\',num2str(files(2)), '_',num2str(finger),'.txt');
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
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.0001);
scoress(finger)= EER;
end
xingbo_matlab_tools.mailTome(strcat('FVC2004_DB2-ML:',',EER=',num2str(scoress)),' ');




%---------------------------------------------------------
[ templateDir ] = convert2SpectraML('data\FVC2004_DB3');
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
for finger=1:8
    % impostor test
imp = [];
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
    files = combination(i,:);
    
    i
    genv_template1=strcat(templateDir,'\',num2str(files(1)), '_',num2str(finger),'.txt');
    genv_template2=strcat(templateDir,'\',num2str(files(2)), '_',num2str(finger),'.txt');
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
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.0001);
scoress(finger)= EER;
end
xingbo_matlab_tools.mailTome(strcat('FVC2004_DB3-ML:',',EER=',num2str(scoress)),' ');



%---------------------------------------------------------
[ templateDir ] = convert2SpectraML('data\FVC2006_DB2_A_ISO');
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
for finger=1:8
    % impostor test
imp = [];
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
    files = combination(i,:);
    
    i
    genv_template1=strcat(templateDir,'\',num2str(files(1)), '_',num2str(finger),'.txt');
    genv_template2=strcat(templateDir,'\',num2str(files(2)), '_',num2str(finger),'.txt');
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
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.0001);
scoress(finger)= EER;
end
xingbo_matlab_tools.mailTome(strcat('FVC2006_DB2_A_ISO-ML:',',EER=',num2str(scoress)),' ');


%---------------------------------------------------------
[ templateDir ] = convert2SpectraML('data\FVC2006_DB3_A_ISO');
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
for finger=1:8
    % impostor test
imp = [];
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
    files = combination(i,:);
    
    i
    genv_template1=strcat(templateDir,'\',num2str(files(1)), '_',num2str(finger),'.txt');
    genv_template2=strcat(templateDir,'\',num2str(files(2)), '_',num2str(finger),'.txt');
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
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.0001);
scoress(finger)= EER;
end
xingbo_matlab_tools.mailTome(strcat('FVC2006_DB3_A_ISO-ML:',',EER=',num2str(scoress)),' ');

