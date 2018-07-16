function [ output_Image ] = Hist_Equalization( input_Image )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

f=input_Image;  
g= f; %�ҶȻ�������ݴ�������   

[h,w]=size(g);  
p=zeros(1,256); %Ԥ������ŻҶȳ��ָ��ʵ�����  

for i=1:h
    for j=1:w
        p(g(i,j)+1)=p(g(i,j)+1)+1;
    end
end

s=zeros(1,256);  
s(1)=p(1);  

for i=2:256  
   s(i)=p(i) + s(i-1); %ͳ��ͼ����<ÿ���Ҷȼ����ص��ۻ�������s(i):0,1,```,i-1  
end

for i=1:256
    s(i) = s(i)*256/(w*h); %��Ҷ�ӳ�亯��  
    if s(i) > 256  
        s(i) = 256;  
    end  
end  

%ͼ����⻯  
f_equal = g;  
for i=1:h 
    for j=1:w 
        f_equal(i,j) = s( f(i,j) + 1);  
    end  
end  
% figure,imshow(f_equal)                           %��ʾ���⻯���ͼ��   

output_Image=f_equal;


end

