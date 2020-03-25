[ vectorOutputDir ] = convert2SpectraML('data\FVC2002_DB2_A_OUT');
[ EER ] = matchTemplate( vectorOutputDir )

% 
% xingbo_matlab_tools.mailTome(strcat('FVC2002_DB2_A_OUT-ML:',',EER=',num2str(100-EER)),' ');
% 
% %********************
% 
% [ vectorOutputDir ] = convert2SpectraMO('data\FVC2002_DB2_A_OUT');
% [ EER ] = matchTemplate( vectorOutputDir )
% xingbo_matlab_tools.mailTome(strcat('FVC2002_DB2_A_OUT-MO:',',EER=',num2str(100-EER)),' ');
% 
% [ vectorOutputDir ] = convert2SpectraMOBin('data\SampleMinutiae');
% [ EER ] = matchTemplate( vectorOutputDir )
