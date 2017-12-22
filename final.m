
%configure hardware input device
clc;
clear;
close all;


vid=videoinput('winvideo',1,'YUY2_640x480'); 
set(vid,'ReturnedColorSpace','rgb');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
triggerconfig(vid,'manual'); 
%Capture one frame per trigger
set(vid,'FramesPerTrigger',1 );
set(vid,'TriggerRepeat', Inf);

start(vid); %start video

 BW = imread('mask.bmp');
 BW=im2bw(BW);
 [B,L,N,A] = bwboundaries(BW);
  imshow(BW); hold on;
       for k=1:length(B),
         if(~sum(A(k,:)))
           boundary = B{k};
           plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
           for l=find(A(:,k))'
             boundary = B{l};
             save boundary boundary
             plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
           end
         end
       end
       
       
%        imshow(AA); hold on;
load boundary       
       
aa=1;
%Infinite while loop
load r;
load c;
% r=69:400;
% c=83:500;
while(1)
% preview(vid)
%Get Image
trigger(vid);
im=getdata(vid,1);
imshow(im);
hold on
if aa == 25
    red=im(:,:,1);
Green=im(:,:,2);
Blue=im(:,:,3);

Out(:,:,1)=red(min(r):max(r),min(c):max(c));
Out(:,:,2)=Green(min(r):max(r),min(c):max(c));
Out(:,:,3)=Blue(min(r):max(r),min(c):max(c));
Out=uint8(Out);
figure;
imshow(Out);title('Capturing BackGround');
imwrite(Out,'bg.bmp');
   
end


plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
aa=aa+1;
disp(aa);
if aa == 60
   break 
end


end

stop(vid),delete(vid),clear vid; 


red=im(:,:,1);
Green=im(:,:,2);
Blue=im(:,:,3);

Out(:,:,1)=red(min(r):max(r),min(c):max(c));
Out(:,:,2)=Green(min(r):max(r),min(c):max(c));
Out(:,:,3)=Blue(min(r):max(r),min(c):max(c));

Out=edge(Out,'canny');
Out=uint8(Out);
imwrite(Out,'final.bmp');

%figure, imshow(Out,[])
       a=imread('bg.bmp');

    
C1=segment(a,Out);
% close all;
%figure;
str='.bmp';
str1='F';

for i=1:60
    a=strcat(num2str(i),str);
   
    b=imread(a);
    re1=corr2(b,C1);
      fresultValues_r(i) = re1;
    fresultNames_r(i) = {a};
  
    result1(i)=re1;
%     figure;
%     subplot(1,2,1);imshow(C1);
%     subplot(1,2,2);imshow(b);
%     xlabel(re1);
end

[re ma]=max(result1);
 a=strcat(num2str(ma),str);
b=imread(a);
figure;
imshow(b);title('recognition result');
    
[sortedValues_r, index_r] = sort(-fresultValues_r);     % Sorted results... the vector index

count1=0;
count2=0;
count3=0;
count4=0;
count5=0;
count6=0;
count7=0;
count8=0;
count9=0;
count10=0;
count11=0;
count12=0;
count13=0;
count14=0;
count15=0;
count16=0;
count17=0;
count18=0;
count19=0;
count20=0;
count21=0;
count22=0;
count23=0;
count24=0;
count25=0;
count26=0;
    fid = fopen('recognition.txt', 'w+');         % Create a file, over-write old ones.
for i = 1:10        % Store top 5 matches...
    
    
    
    imagename = char(fresultNames_r(index_r(i)));
    fprintf(fid, '%s\r', imagename);
    
    a=index_r(i);
    
    if a > 0 && a <=10
        
        count1=count1+1;
        
    elseif a > 10 && a <=20
        count2=count2+1;
    elseif a > 20 && a <=30
        count3=count3+1;
    elseif a > 30 && a <=40
        count4=count4+1;
    elseif a > 40 && a <=50
            count5=count5+1;
    elseif a > 50 && a <=60
            count6=count6+1;
    elseif a > 60 && a <=70
    count7=count7+1;
    elseif a > 70 && a <=80
    count8=count8+1;
    elseif a > 80 && a <=90
    count9=count9+1;
    elseif a > 90 && a <=100
    count10=count10+1;
    elseif a > 100 && a <=110
    count11=count11+1;
    elseif a > 110 && a <=120
    count12=count12+1;
    elseif a > 120 && a <=130
    count13=count13+1;
    elseif a > 130 && a <=140
    count14=count14+1;
    elseif a > 140 && a <=150
    count15=count15+1;
    elseif a > 150 && a <=160
    count16=count16+1;
    %elseif a > 160 && a <=170
    %count17=count17+1;
    elseif a > 170 && a <=180
    count18=count18+1;
    elseif a > 180 && a <=190
    count19=count19+1;
    elseif a > 190 && a <=200
    count20=count20+1;
    elseif a > 200 && a <=210
    count21=count21+1;
    elseif a > 210 && a <=220
    count22=count22+1;
    elseif a > 220 && a <=230
    count23=count23+1;
    elseif a > 230 && a <=240
    count24=count24+1;
    elseif a > 240 && a <=250
    count25=count25+1;
    else
        count26=count26+1;
    end
    
    
    
end
fclose(fid);
disp('exit');
if count1 > 5
    Out1  = ['A'];
    warndlg(Out1);
    
elseif count2 > 5
    Out1  = ['B'];
    warndlg(Out1);
    
    elseif count3 > 5
    Out1  = ['C'];
    warndlg(Out1);
    
        elseif count4 > 5
    Out1  = ['D'];
    warndlg(Out1);
    
        elseif count5 > 5
    Out1  = ['E'];
    warndlg(Out1);
    
    elseif count6 > 5
    Out1  = ['F'];
    warndlg(Out1);
    elseif count7 > 5
    Out1  = ['G'];
    warndlg(Out1);
    elseif count8 > 5
    Out1  = ['H'];
    warndlg(Out1);
    elseif count9 > 5
    Out1  = ['I'];
    warndlg(Out1);
    elseif count10 > 5
    Out1  = ['J'];
    warndlg(Out1);
    elseif count11 > 5
    Out1  = ['K'];
    warndlg(Out1);
    elseif count12 > 5
    Out1  = ['L'];
    warndlg(Out13);
    elseif count13 > 5
    Out1  = ['M'];
    warndlg(Out1);
    elseif count14 > 5
    Out1  = ['N'];
    warndlg(Out1);
    elseif count15 > 5
    Out1  = ['O'];
    warndlg(Out1);
    elseif count16 > 5
    Out1  = ['P'];
    warndlg(Out1);
    elseif count17 > 5
    Out1  = ['Q'];
    warndlg(Out1);
    elseif count18 > 5
    Out1  = ['R'];
    warndlg(Out1);
    elseif count19 > 5
    Out1  = ['S'];
    warndlg(Out1);
    elseif count20 > 5
    Out1  = ['T'];
    warndlg(Out1);
    elseif count21 > 5
    Out1  = ['U'];
    warndlg(Out1);
    elseif count22 > 5
    Out1  = ['V'];
    warndlg(Out1);
    elseif count23 > 5
    Out1  = ['W'];
    warndlg(Out1);
    elseif count24 > 5
    Out1  = ['X'];
    warndlg(Out1);
    elseif count25 > 5
    Out1  = ['Y'];
    warndlg(Out1);
    elseif count26 > 5
    Out1  = ['Z'];
    warndlg(Out1);
    
         else   
end
Out =[count1 count2 count3  count4  count5 count6 count7 count8 count9 count10 count11 count12 count13 count14 count15 count16 count17 count18 count19 count20 count21 count22 count23 count24 count25 count26];

 
 [Res ind]=max(Out);
 disp(Res);
 disp(ind);
 disp(Out);
 
% warndlg(num2str(ind));

