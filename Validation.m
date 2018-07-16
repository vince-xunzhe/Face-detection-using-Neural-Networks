vvv=zeros(1,1);
for cot=1:30
    A='C:\Users\Administrator\Desktop\Validation\V_2\';
    B=num2str(cot);
    C='.bmp';
    D=[A,B,C];
    gg=imread(D);
    
    %gg=rgb2gray(gg);
    gv=imresize(gg,[20 20]);
    fv=Hist_Equalization(CorrectLight(gv));
    fv(1,1:4)=0;fv(1,17:20)=0;
    fv(2,1:3)=0;fv(2,18:20)=0;
    fv(3,1:2)=0;fv(3,19:20)=0;
    fv(4,1)=0;fv(4,20)=0;
    
    fv(17,1)=0;fv(17,20)=0;
    fv(18,1:2)=0;fv(18,19:20)=0;
    fv(19,1:3)=0;fv(19,18:20)=0;
    fv(20,1:4)=0;fv(20,17:20)=0;
    
    figure,imshow(fv);
%     saveas(gcf,['C:\Users\Administrator\Desktop\Preprocessed Faces\','Face',num2str(cot),'.fig']);
    vv=reshape(fv,[1,400]);

    y=sim(net,vv');
    vvv=[vvv;y];
    clear fv;
end

 vvv(1,:)=[];
 a=zeros();
 a()
 
 for mm=1:30
     if round(vvv(mm))==1
         a=[a,mm];
     end
 end
 close all;
 

