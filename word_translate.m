clc;
clear;
close all;
fileimg = cell(1,8);
vid = videoinput('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
triggerconfig(vid,'manual'); 
%Capture one frame per trigger
set(vid,'FramesPerTrigger',35 );
set(vid,'TriggerRepeat', Inf);
start(vid);
ii=1;
t0 = clock;

while etime(clock, t0) <= 3
   preview(vid); 
   %disp(clock);
   trigger(vid);
   im=getsnapshot(vid); 
   %im=getdata(vid,1);
    
    filename = [sprintf('%0d',ii) '.jpg'];
    fullname = fullfile('c:', 'VGO research','vgo', 'images', 'img',filename);

im=rgb2gray(im);
IM = imresize(im,[256 256], 'bilinear');
% imshow(im);
%array3D(:,:,i) = cat(3, IM2);
     ed=edge(IM,'canny',0.2,0.6);
%IM3 = bwareaopen(ed, 30);
    d=im2bw(ed);

% imshow(Out,[]);

C1 = imresize(d, [256 256], 'bilinear'); %
    imwrite(C1,fullname); 
 %fileimg(ii)= filename ;
 fileimg{ii}=filename;
    ii=ii+1;
  
   pause(0.300);  % Some dummy lines
   
end
stop(vid);closepreview(vid)

fileFolder1 = fullfile('C:', 'VGO research', 'vgo', 'images','img');
dirOutput = dir(fullfile(fileFolder1,'*.jpg'));
fileNames1 = {dirOutput.name};

a= montage(fileNames1, 'Size', [2 4]);
disp(a);
d=a.CData;
IM = imresize(d,[512 1024], 'bilinear');
IM=im2bw(IM);
imwrite(IM,'images/training/test.bmp');
str='.bmp';
%str1='F';

for i=1:3
    filename = [sprintf('%d',i) '.bmp'];
    fullname = fullfile('c:', 'VGO research','vgo', 'images','training',filename);
    %a=strcat(num2str(i),str);
    b=imread(fullname);
    test1=imread('images/training/test.bmp');
    re1=corr2(b,test1);
      fresultValues_r(i) = re1;
    fresultNames_r(i) = {a};
  
    result1(i)=re1;
    

end
[re ma]=max(result1);
 a=strcat(num2str(ma),str);
b=imread(a);
figure;
imshow(b);title('recognition result');
% 
% 

