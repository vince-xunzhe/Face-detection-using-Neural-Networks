function [ output_Image] = Correct_Light( input_Image )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 %����һ������ɫ��ͼƬ
g=input_Image;
%f=rgb2gray(g);     %����ת��Ϊ�Ҷ�ֵ
[m n]=size(g);

vec_x=zeros(fix(m/5));
vec_y=zeros(fix(n/5));

sam_x=1:2:m;
vec_x=double((g(sam_x,ceil(n/2))).');
sam_y=1:2:n;
vec_y=double(g(ceil(m/2),sam_y));

% subplot(2,2,1),plot(sam_x,vec_x);
% subplot(2,2,3),plot(sam_y,vec_y);

k=1;
A_x=polyfit(sam_x,vec_x,k);  %n�Ǹ����Ķ���ʽ�Ĵ�������ϳ����Ľ��A��ϵ������
y_x=polyval(A_x,sam_x);  %�������ϵ�yֵ

A_y=polyfit(sam_y,vec_y,k);
y_y=polyval(A_y,sam_y);

% subplot(2,2,2),plot(sam_x,vec_x,'k*',sam_x,y_x,'r-');  %�������ݶԱ�ͼ���ڵ���ԭʼ���ݣ��������������%ָ���������
% subplot(2,2,4),plot(sam_y,vec_y,'k*',sam_y,y_y,'r-');  %�������ݶԱ�ͼ���ڵ���ԭʼ���ݣ��������������%ָ���������
    
x=1:1:m;
y=1:1:n;
[a,b]=meshgrid(x,y);
Pw_x=ones(m);
Pw_y=ones(n);
Pw=Pw_x.*((Pw_y).');
for i=1:m
    for j=1:n
        Pw(i,j)=(A_x(1)*j+A_y(1)*i);
    end
end
Pw=Pw.';
bc=min(min(Pw));
for ii=1:m
    for jj=1:n
        Pw(ii,jj)=Pw(ii,jj)+abs(bc);
    end
end
% figure,subplot(2,2,1),mesh(Pw);
Pw=imcomplement(uint8(Pw));
% subplot(2,2,2),imshow(Pw);
% subplot(2,2,3),imshow(f);

for iii=1:m
    for jjj=1:n
        g(iii,jjj)=0.7.*g(iii,jjj)+0.3.*Pw(iii,jjj);
    end;
end;
% subplot(2,2,4),imshow(f);

output_Image=g;



end

