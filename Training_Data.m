clc;
clear all;
close all;

C=zeros(1,400);

for i=1:1000
    f=uint8(randi([0,255],20,20));
    g=Hist_Equalization(CorrectLight(f));
    
    g(1,1:4)=0;g(1,17:20)=0;
    g(2,1:3)=0;g(2,18:20)=0;
    g(3,1:2)=0;g(3,19:20)=0;
    g(4,1)=0;g(4,20)=0;
    
    g(17,1)=0;g(17,20)=0;
    g(18,1:2)=0;g(18,19:20)=0;
    g(19,1:3)=0;g(19,18:20)=0;
    g(20,1:4)=0;g(20,17:20)=0;
    v=reshape(g,[1,400]);
    C=[C;v];
end

E=zeros(1,400);
for j=1:3
    s1='C:\Users\Administrator\Desktop\Bootstrap\';
    s2=num2str(j);
    s3='.jpg';
    s=[s1,s2,s3];
    w=imread(s);
    w=rgb2gray(w);
    p=imresize(w,[20 20]);
    
    
    q=Hist_Equalization(CorrectLight(p));
    q(1,1:4)=0;q(1,17:20)=0;
    q(2,1:3)=0;q(2,18:20)=0;
    q(3,1:2)=0;q(3,19:20)=0;
    q(4,1)=0;q(4,20)=0;
    
    q(17,1)=0;q(17,20)=0;
    q(18,1:2)=0;q(18,19:20)=0;
    q(19,1:3)=0;q(19,18:20)=0;
    q(20,1:4)=0;q(20,17:20)=0;
    vq=reshape(q,[1,400]);
    E=[E;vq];
    
end


load('C:\Users\Administrator\Desktop\F_4200.mat');
load('C:\Users\Administrator\Desktop\N_5338.mat');
load('C:\Users\Administrator\Desktop\N_5776.mat');
A=Training;
B=N_1;
B(1,:)=[];
C(1,:)=[];
D=N_2;
D(1,:)=[];
%E(1,:)=[];

AA=ones(1,4200);
BB=zeros(1,5338);
CC=zeros(1,1000);
DD=zeros(1,5776);
%EE=[1 0 0];

Input=[A;B;C;D];
Output=[AA,BB,CC,DD]';
