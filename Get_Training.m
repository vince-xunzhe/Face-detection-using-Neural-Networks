clc;
clear all;
close all;

vector=zeros(1,400);
Image1=imread('C:\Users\Administrator\Desktop\N2.png');
[m,n]=size(Image1);
Image=imresize(Image1,[m/1,n/1]);
f=Image;

plate=zeros(20);
% k=zeros(1);

Gap=12;
% unit=fix(m/Gap);

for i=1:Gap:n
    for j=1:Gap:m
        
       if ((i+Gap<n)&&(j+Gap<m))
           
           plate=[f(i,j:j+19);f(i+1,j:j+19);f(i+2,j:j+19);f(i+3,j:j+19);
                  f(i+4,j:j+19);f(i+5,j:j+19);f(i+6,j:j+19);f(i+7,j:j+19);
                  f(i+8,j:j+19);f(i+9,j:j+19);f(i+10,j:j+19);f(i+11,j:j+19);
                  f(i+12,j:j+19);f(i+13,j:j+19);f(i+14,j:j+19);f(i+15,j:j+19);
                  f(i+16,j:j+19);f(i+17,j:j+19);f(i+18,j:j+19);f(i+19,j:j+19)
                 ];
       else
           break;
     
       end
       fv=Hist_Equalization(CorrectLight(plate));
       fv(1,1:4)=0;fv(1,17:20)=0;fv(2,1:3)=0;fv(2,18:20)=0;
       fv(3,1:2)=0;fv(3,19:20)=0;fv(4,1)=0;fv(4,20)=0;
       fv(17,1)=0;fv(17,20)=0;fv(18,1:2)=0;fv(18,19:20)=0;
       fv(19,1:3)=0;fv(19,18:20)=0;fv(20,1:4)=0;fv(20,17:20)=0;
       
       rfv=reshape(fv,[1,400]);
       vector=[vector;rfv];
       
    end
end
