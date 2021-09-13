function varargout = unit1(varargin)
% UNIT1 MATLAB code for unit1.fig
%      UNIT1, by itself, creates a new UNIT1 or raises the existing
%      singleton*.
%
%      H = UNIT1 returns the handle to a new UNIT1 or the handle to
%      the existing singleton*.
%
%      UNIT1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNIT1.M with the given input arguments.
%
%      UNIT1('Property','Value',...) creates a new UNIT1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before unit1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to unit1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help unit1

% Last Modified by GUIDE v2.5 17-Nov-2020 21:40:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @unit1_OpeningFcn, ...
                   'gui_OutputFcn',  @unit1_OutputFcn, ...
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


% --- Executes just before unit1 is made visible.
function unit1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to unit1 (see VARARGIN)

% Choose default command line output for unit1
handles.output = hObject;
handles.numcount=[];
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes unit1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = unit1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % 每个数字用410 个采样点表示
d1=sin(2*pi*697/8192*n)+sin(2*pi*1209/8192*n); % 对应行频列频叠加
space=zeros(1,410); %410 个0 模拟静音信号
phone=[d1,space];%要发送的信号
strnum1=strcat(get(handles.numscreen,'string'),'1');%之前的数字连上数字‘1’
set(handles.numscreen,'string',strnum1);%显示在显示屏上
handles.numcount=[handles.numcount,phone];%整合要发送的信号
sound(d1,8192);%播放按键的声音
guidata(hObject,handles);%更新



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % 每个数字用410 个采样点表示
d2=sin(2*pi*697/8192*n)+sin(2*pi*1336/8192*n); % 对应行频列频叠加
space=zeros(1,410); %410 个0 模拟静音信号
phone=[d2,space];%要发送的信号
strnum2=strcat(get(handles.numscreen,'string'),'2');%之前的数字连上数字‘2’
set(handles.numscreen,'string',strnum2);%显示在显示屏上
handles.numcount=[handles.numcount,phone];%整合要发送的信号
sound(d2,8192);%播放按键的声音
guidata(hObject,handles);%更新


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % 每个数字用410 个采样点表示
d3=sin(2*pi*697/8192*n)+sin(2*pi*1477/8192*n); % 对应行频列频叠加
space=zeros(1,410); %410 个0 模拟静音信号
phone=[d3,space];%要发送的信号
strnum3=strcat(get(handles.numscreen,'string'),'3');%之前的数字连上数字‘3’
set(handles.numscreen,'string',strnum3);%显示在显示屏上
handles.numcount=[handles.numcount,phone];%整合要发送的信号
sound(d3,8192);%播放按键的声音
guidata(hObject,handles);%更新


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % 每个数字用410 个采样点表示
d4=sin(2*pi*770/8192*n)+sin(2*pi*1209/8192*n); % 对应行频列频叠加
space=zeros(1,410); %410 个0 模拟静音信号
phone=[d4,space];%要发送的信号
strnum4=strcat(get(handles.numscreen,'string'),'4');%之前的数字连上数字‘4’
set(handles.numscreen,'string',strnum4);%显示在显示屏上
handles.numcount=[handles.numcount,phone];%整合要发送的信号
sound(d4,8192);%播放按键的声音
guidata(hObject,handles);%更新


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % 每个数字用410 个采样点表示
d5=sin(2*pi*770/8192*n)+sin(2*pi*1336/8192*n); % 对应行频列频叠加
space=zeros(1,410); %410 个0 模拟静音信号
phone=[d5,space];%要发送的信号
strnum5=strcat(get(handles.numscreen,'string'),'5');%之前的数字连上数字‘5’
set(handles.numscreen,'string',strnum5);%显示在显示屏上
handles.numcount=[handles.numcount,phone];%整合要发送的信号
sound(d5,8192);%播放按键的声音
guidata(hObject,handles);%更新


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % 每个数字用410 个采样点表示
d6=sin(2*pi*770/8192*n)+sin(2*pi*1477/8192*n); % 对应行频列频叠加
space=zeros(1,410); %410 个0 模拟静音信号
phone=[d6,space];%要发送的信号
strnum6=strcat(get(handles.numscreen,'string'),'6');%之前的数字连上数字‘6’
set(handles.numscreen,'string',strnum6);%显示在显示屏上
handles.numcount=[handles.numcount,phone];%整合要发送的信号
sound(d6,8192);%播放按键的声音
guidata(hObject,handles);%更新


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % 每个数字用410 个采样点表示
d7=sin(2*pi*852/8192*n)+sin(2*pi*1209/8192*n); % 对应行频列频叠加
space=zeros(1,410); %410 个0 模拟静音信号
phone=[d7,space];%要发送的信号
strnum7=strcat(get(handles.numscreen,'string'),'7');%之前的数字连上数字‘7’
set(handles.numscreen,'string',strnum7);%显示在显示屏上
handles.numcount=[handles.numcount,phone];%整合要发送的信号
sound(d7,8192);%播放按键的声音
guidata(hObject,handles);%更新


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % 每个数字用410 个采样点表示
d8=sin(2*pi*852/8192*n)+sin(2*pi*1336/8192*n); % 对应行频列频叠加
space=zeros(1,410); %410 个0 模拟静音信号
phone=[d8,space];%要发送的信号
strnum8=strcat(get(handles.numscreen,'string'),'8');%之前的数字连上数字‘8’
set(handles.numscreen,'string',strnum8);%显示在显示屏上
handles.numcount=[handles.numcount,phone];%整合要发送的信号
sound(d8,8192);%播放按键的声音
guidata(hObject,handles);%更新


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % 每个数字用410 个采样点表示
d9=sin(2*pi*852/8192*n)+sin(2*pi*1477/8192*n); % 对应行频列频叠加
space=zeros(1,410); %410 个0 模拟静音信号
phone=[d9,space];%要发送的信号
strnum9=strcat(get(handles.numscreen,'string'),'9');%之前的数字连上数字‘9’
set(handles.numscreen,'string',strnum9);%显示在显示屏上
handles.numcount=[handles.numcount,phone];%整合要发送的信号
sound(d9,8192);%播放按键的声音
guidata(hObject,handles);%更新


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num=get(handles.numscreen,'string');%获取屏幕上的字符串
l=length(num);%求其字符串长度L
n11=strrep(num,num,num(1:l-1));%取前(L-1)个字符替换现在的字符串，相当于删掉最后一个字符
set(handles.numscreen,'string',n11);%显示后的字符结果
L=length(handles.numcount);%记录现在的发送数据信号长度
handles.numcount=handles.numcount(1:L-820); %取前(L-1)个字符信号替换现在的信号，相当于发送时删掉最后一个字符
n=[1:410];
d10=sin(2*pi*941/8192*n)+sin(2*pi*1209/8192*n); %对应行频列频叠加
sound(d10,8192); %播放按键声音
guidata(hObject,handles);%更新
 


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % 每个数字用410 个采样点表示
d0=sin(2*pi*941/8192*n)+sin(2*pi*1336/8192*n); % 对应行频列频叠加
space=zeros(1,410); %410 个0 模拟静音信号
phone=[d0,space];%要发送的信号
strnum0=strcat(get(handles.numscreen,'string'),'0');%之前的数字连上数字‘0’
set(handles.numscreen,'string',strnum0);%显示在显示屏上
handles.numcount=[handles.numcount,phone];%整合要发送的信号
sound(d0,8192);%播放按键的声音
guidata(hObject,handles);%更新


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410];
d11=sin(2*pi*941/8192*n)+sin(2*pi*1477/8192*n); % 对应行频列频叠加
sound(d11,8192);%发出按键声音
numlength=length(handles.numcount);%接收到的信号长度
count=numlength/820;%计算出发了多少个数字
set(handles.receivescreen,'string','');%清屏
for i=1:count%一共count个数字
   d=handles.numcount(1+820*(i-1):820*i);%取每位拨号音的采样点
   f=fft(d,8192); % 以N=2048 作FFT 变换d是取出来每位拨号音的采样点
   a=abs(f);
   p=a.*a/8192; % 计算功率谱
   num(1)=find(p(1:1000)==max(p(1:1000))); % 找行频
   num(2)=1000+find(p(1000:1700)==max(p(1000:1700))); % 找列频
   if (num(1) < 730)
       row=1; % 确定行数
   elseif (num(1) < 810)
       row=2;
   elseif (num(1) < 900)
       row=3;
   else
       row=4;     
   end
   if (num(2) < 1250)
       coloum=1; % 确定列数
   elseif (num(2) < 1390)
       coloum=2;
   elseif (num(2) < 1510)
       coloum=3;
   else
       coloum=4;
   end
   if row==4&&coloum==2%计算出对应的数字值
       num=0;
   elseif(row==4&&coloum==1)
       num='*';
   elseif(row==4&&coloum==3)
       num='#';
   elseif(coloum==4)
       if(row==1)
        num='A';
       elseif(row==2)
        num='B';
        elseif(row==2)
        num='C';
       else
        num='D';
       end
   else
       num=coloum+3*(row-1); %根据行列关系计算出对应的数字值
   end
   strnum=strcat(get(handles.receivescreen, 'string'),num2str(num));%连接新旧字符串
   set(handles.receivescreen,'string',strnum);%将结果显示在屏幕上 
end
    set(handles.edit4,'string',count);%将位数显示在屏幕上
guidata(hObject,handles);

function numscreen_Callback(hObject, eventdata, handles)
% hObject    handle to numscreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numscreen as text
%        str2double(get(hObject,'String')) returns contents of numscreen as a double


% --- Executes during object creation, after setting all properties.
function numscreen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numscreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function receivescreen_Callback(hObject, eventdata, handles)
% hObject    handle to receivescreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of receivescreen as text
%        str2double(get(hObject,'String')) returns contents of receivescreen as a double


% --- Executes during object creation, after setting all properties.
function receivescreen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to receivescreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.numscreen,'string','');
set(handles.receivescreen,'string','');
set(handles.edit4,'string','');
handles.numcount=[];
guidata(hObject,handles);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sampledata1=handles.numcount;
%语音信号的时域输出 
if(length(handles.numcount)==0)
plot(0);
else
t=0:1/8192:(length(sampledata1)-1)/8192;
plot(t,sampledata1); 
guidata(hObject,handles);
end




% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath]=uigetfile('.wav','选择音频文件');%打开文件
if(filename==0)
    return%判断文件是否为空
else
audeofile=strcat(filepath,filename);%形成音频文件路径
[sampledata1,Fs]=audioread(audeofile);%从音频文件路径中读取音频文件，获得采样率和音频数据
SNR=get(handles.edit5,'String');
sampledata=awgn(sampledata1,str2num(SNR),'measured');
% -----------------------------------------带通滤波 
Hd=band_pass(600,690,1710,1800);                              %带通滤波器
                            %带通滤波器
sampledata=filter(Hd,sampledata); 
% Hd=bpass(700,710,750,760);  
% sampledata=filter(Hd,sampledata); 
%滤波
%Hd=band_pass(700,710,750,760);          
%sound(y,Fs)
sound(sampledata,Fs);%播放音频文件
%n=max(sampledata(1:length(sampledata)))%获得音频数据峰值  
count1=0;%初始化
i=1;%初始化
numcount1=[];%初始化
% while(i<=length(sampledata)-2640/48000*Fs)%最后一段长2640，如果按键发音，大小为2640的样本长度正好容纳，对之外的每一个点进行讨论
%     for j=i:ceil(i+2640/48000*Fs)%对于采样率48000，用48000合适，但48000*Fs适用于各种音频。%对讨论是否认为是噪声并需要置0的点的后面的2640个点进行讨论
%             if(abs(sampledata(j))>0.3*n)%我们认为峰值的0.39是区分按键音和环境噪音的标志，这个是由峰值1.79的取高度0.7作为分界点，这个是由图像特点，就是噪音和按键音幅度有显著差异决定的
%                 count1=count1+1;%计数
%             end
%         end
%         if(count1>550/48000*Fs)%统计有多少个大于0.39的点，用700作为分界点进行保留，不是算出来的，而是使用matlab试出来的。不写count1的‘；’很容易区分出噪声含有的count1数目和按键音数目
%         numcount1=[numcount1,sampledata(i:i+ceil(4799/48000*Fs))']; %！！！！！！！！正常录音不需转置，但老师的测试音频需要！！！！！！%把按键音合并起来，该点和该点之后4800点，即100ms，会丢掉一部分按键音尾端数据，设计中也会舍弃很少一些首端数据，不过数量少，而且按键音中间的声音更具备特征，信号质量更好。
%           i=ceil(i+5000/48000*Fs);%取完按键音后跳过该段，不重复截取声音片段。
% %         else
% %           i=ceil(i+600/48000*Fs)-count1;
%         end
%        i=i+1;%计数
%         count1=0;%复位     
% end
L=length(sampledata);
while(i<L)
    if(i<L-ceil(Fs/20))
    xh=sampledata(i:i+ceil(Fs/20));
    else
    xh=sampledata(i:L);
    end
    f=fft(xh,Fs);
    b=abs(f);
	p=b.*b/(Fs);
if(max(p(1:1000))>1.1&&max(p(1000:1700))>1.1)
numcount1=[numcount1,sampledata(i:i+4409)'];
i=i+ceil(Fs/14);
    else
i=i+ceil(Fs/200);
    end
end

t=0:1/Fs:(length(sampledata)-1)/Fs;%输出原始波形的时间转换  
plot(t,sampledata);%输出原始波形
hold on;
plot(t,sampledata1);%输出原始波形
hold off;
numlength=length(numcount1);%接收到的信号长度
count=numlength/(1+4409);%计算出发了多少个数字
set(handles.receivescreen,'string','');%清屏
for i=1:count%一共count个数字
   d=numcount1(1+(1+4409)*(i-1):(1+4409)*i);%取每位拨号音的采样点
   f=fft(d,Fs); % 以N=2048 作FFT 变换d是取出来每位拨号音的采样点
   a=abs(f);
   p=a.*a/Fs; % 计算功率谱
   num(1)=find(p(1:1000)==max(p(1:1000))); % 找行频
   num(2)=1000+find(p(1000:1700)==max(p(1000:1700))); % 找列频
   if (num(1) < 730)
       row=1; % 确定行数
   elseif (num(1) < 810)
       row=2;
   elseif (num(1) < 900)
       row=3;
   else
       row=4;     
   end
   if (num(2) < 1260)
       coloum=1; % 确定列数
   elseif (num(2) < 1395)
       coloum=2;
   elseif (num(2) < 1550)
       coloum=3;
   else coloum=4;
   end
   if row==4&&coloum==2%计算出对应的数字值
       num=0;
   elseif(row==4&&coloum==1)
       num='*';
   elseif(row==4&&coloum==3)
       num='#';
   elseif(coloum==4)
       if(row==1)
        num='A';
       elseif(row==2)
        num='B';
        elseif(row==2)
        num='C';
       else
        num='D';
       end
   else
       num=coloum+3*(row-1); %根据行列关系计算出对应的数字值
   end
   strnum=strcat(get(handles.receivescreen, 'string'),num2str(num));
   set(handles.receivescreen,'string',strnum);%将结果显示在屏幕上
end
    set(handles.edit4,'string',count);%将位数显示在屏幕上
end
guidata(hObject,handles);



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Hd = band_pass(Fstop1,Fpass1,Fpass2,Fstop2);
%BAND_PASS Returns a discrete-time filter object.
 
% MATLAB Code
 
% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.
 
% Generated by MATLAB(R) 9.0 and the Signal Processing Toolbox 7.2.
% Generated on: 18-Dec-2019 14:51:03
% All frequency values are in Hz.
Fs = 44100;  % Sampling Frequency
 
% Fstop1 = 500;         % First Stopband Frequency
% Fpass1 = 690;         % First Passband Frequency
% Fpass2 = 1710;        % Second Passband Frequency
% Fstop2 = 1800;        % Second Stopband Frequency
Astop1 = 70;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 70;          % Second Stopband Attenuation (dB)
match  = 'passband';  % Band to match exactly
 
% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
