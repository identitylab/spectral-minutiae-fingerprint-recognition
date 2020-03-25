function [ Y ] = templateSimilarity(Data, Data2 )
%TEMPLATESIMILARITY 此处显示有关此函数的摘要
%   此处显示详细说明

        
        YY0 = (Data2);
        YY1 = circshift(Data2,[0,-1]);
        YY2=circshift(Data2,[0,-2]);
        YY3=circshift(Data2,[0,-3]);
        YY4=circshift(Data2,[0,-4]);
        YY5=circshift(Data2,[0,-5]);
        YY6=circshift(Data2,[0,-6]);
        YY7 = circshift(Data2,[0,-7]);
        YY8=circshift(Data2,[0,-8]);
        YY9=circshift(Data2,[0,-9]);
        YY10=circshift(Data2,[0,-10]);
        YY11=circshift(Data2,[0,-11]);
        YY12=circshift(Data2,[0,-12]);
        YY13=circshift(Data2,[0,-13]);
        YY14=circshift(Data2,[0,-14]);
        YY15=circshift(Data2,[0,-15]);
        YY16 = circshift(Data2,[0,1]);
        YY17=circshift(Data2,[0,2]);
        YY18=circshift(Data2,[0,3]);
        YY19=circshift(Data2,[0,4]);
        YY20=circshift(Data2,[0,5]);
        YY21=circshift(Data2,[0,6]);
        YY22 = circshift(Data2,[0,7]);
        YY23=circshift(Data2,[0,8]);
        YY24=circshift(Data2,[0,9]);
        YY25=circshift(Data2,[0,10]);
        YY26=circshift(Data2,[0,11]);
        YY27=circshift(Data2,[0,12]);
        YY28=circshift(Data2,[0,13]);
        YY29=circshift(Data2,[0,14]);
        YY30=circshift(Data2,[0,15]);
        
        
        xcor0=corr2(Data,YY0);
        xcor1=corr2(Data,YY1);
        xcor2=corr2(Data,YY2);
        xcor3=corr2(Data,YY3);
        xcor4=corr2(Data,YY4);
        xcor5=corr2(Data,YY5);
        xcor6=corr2(Data,YY6);
        xcor7=corr2(Data,YY7);
        xcor8=corr2(Data,YY8);
        xcor9=corr2(Data,YY9);
        xcor10=corr2(Data,YY10);
        xcor11=corr2(Data,YY11);
        xcor12=corr2(Data,YY12);
        xcor13=corr2(Data,YY13);
        xcor14=corr2(Data,YY14);
        xcor15=corr2(Data,YY15);
        xcor16=corr2(Data,YY16);
        xcor17=corr2(Data,YY17);
        xcor18=corr2(Data,YY18);
        xcor19=corr2(Data,YY19);
        xcor20=corr2(Data,YY20);
        xcor21=corr2(Data,YY21);
        xcor22=corr2(Data,YY22);
        xcor23=corr2(Data,YY23);
        xcor24=corr2(Data,YY24);
        xcor25=corr2(Data,YY25);
        xcor26=corr2(Data,YY26);
        xcor27=corr2(Data,YY27);
        xcor28=corr2(Data,YY28);
        xcor29=corr2(Data,YY29);
        xcor30=corr2(Data,YY30);
        cc=[xcor0;xcor1;xcor2;xcor3;xcor4;xcor5;xcor6;xcor7;xcor8;xcor9;xcor10;xcor11;xcor12;xcor13;xcor14;xcor15;xcor16;xcor17;xcor18;xcor19;xcor20;xcor21;xcor22;xcor23;xcor24;xcor25;xcor26;xcor27;xcor28;xcor29;xcor30];
        Y=max(cc);
end

