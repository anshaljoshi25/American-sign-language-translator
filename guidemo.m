function varargout = guidemo(varargin)
% GUIDEMO M-file for guidemo.fig
%      GUIDEMO, by itself, creates a new GUIDEMO or raises the existing
%      singleton*.
%
%      H = GUIDEMO returns the handle to a new GUIDEMO or the handle to
%      the existing singleton*.
%
%      GUIDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDEMO.M with the given input arguments.
%
%      GUIDEMO('Property','Value',...) creates a new GUIDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guidemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guidemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guidemo

% Last Modified by GUIDE v2.5 16-Jun-2017 03:45:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guidemo_OpeningFcn, ...
                   'gui_OutputFcn',  @guidemo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before guidemo is made visible.
function guidemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guidemo (see VARARGIN)

% Choose default command line output for guidemo
handles.output = hObject;
% clear;

sss='0';
set(handles.timer,'String',sss);
sss='0';
set(handles.edit2,'String',sss);
sss='0';
set(handles.edit3,'String',sss);
a=ones(256,320);
axes(handles.axes1);
imshow(a);

b=ones(256,256);
axes(handles.axes2);
imshow(b);
axes(handles.axes3);
imshow(b);
% axes(handles.axes4);
% imshow(b);
% axes(handles.axes5);
% imshow(b);
axes(handles.axes6);
imshow(b);



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guidemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guidemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sss='Capturing Background';
set(handles.edit2,'String',sss);

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
 axes(handles.axes1);
  imshow(BW); hold on;
       for k=1:length(B),
         if(~sum(A(k,:)))
           boundary = B{k};
           axes(handles.axes1);
           plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
           for l=find(A(:,k))'
             boundary = B{l};
              axes(handles.axes1);
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
axes(handles.axes1);
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
axes(handles.axes2);		
imshow(Out);
imwrite(Out,'bg.bmp');
sss='Capturing Gesture';		
set(handles.edit2,'String',sss);		
	   
   
end
axes(handles.axes1);

plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
aa=aa+1;
set(handles.timer,'String',num2str(aa));
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
Out=uint8(Out);
imwrite(Out,'final.bmp');
axes(handles.axes3);
imshow(Out,[])

a=imread('bg.bmp');
[C1,c1]=segment(a,Out);
% axes(handles.axes4);		
% 	imshow(c1,[]);		
% 	axes(handles.axes5);		
% 	imshow(C1,[]);
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
axes(handles.axes6);
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

Out =[count1 count2 count3  count4  count5];

 
 [Res ind]=max(Out);
 disp(ind);
 
 



function timer_Callback(hObject, eventdata, handles)
% hObject    handle to timer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timer as text
%        str2double(get(hObject,'String')) returns contents of timer as a double


% --- Executes during object creation, after setting all properties.
function timer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Train.
function Train_Callback(hObject, eventdata, handles)
% hObject    handle to Train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guitrain

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clear;
sss='0';
set(handles.timer,'String',sss);
sss='0';
set(handles.edit2,'String',sss);
sss='0';
set(handles.edit3,'String',sss);
a=ones(480,650);
axes(handles.axes1);
imshow(a);

b=ones(256,256);
axes(handles.axes2);
imshow(b);
axes(handles.axes3);
imshow(b);
% axes(handles.axes4);
% imshow(b);
% axes(handles.axes5);
% imshow(b);
axes(handles.axes6);
imshow(b);





% --- Executes on button press in Readme.
function Readme_Callback(hObject, eventdata, handles)
% hObject    handle to Readme (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpwin help1


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exit


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sss='Capturing Background';
set(handles.edit2,'String',sss);
vid=videoinput('winvideo',1,'YUY2_640x480'); 
set(vid,'ReturnedColorSpace','rgb');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
triggerconfig(vid,'manual'); 
%Capture one frame per trigger
set(vid,'FramesPerTrigger',1 );
set(vid,'TriggerRepeat', Inf);
start(vid); %start video
ii=1;
t0 = clock;

while etime(clock, t0) <= 3
   preview(vid); 
   %disp(clock);
   trigger(vid);
   im=getsnapshot(vid); 
   %im=getdata(vid,1);
    
    filename = [sprintf('%03d',ii) '.jpg'];
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
stop(vid);closepreview(vid);

fileFolder1 = fullfile('C:', 'VGO research', 'vgo', 'images','img');
dirOutput = dir(fullfile(fileFolder1,'0*.jpg'));
fileNames1 = {dirOutput.name};

a= montage(fileNames1, 'Size', [2 4]);
disp(a);
d=a.CData;
IM = imresize(d,[512 1024], 'bilinear');
IM=im2bw(IM);
fileFolder2 = fullfile('C:', 'VGO research', 'vgo', 'images','training','7.bmp');
imwrite(IM,fileFolder2);
