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
n=[1:410]; % ÿ��������410 ���������ʾ
d1=sin(2*pi*697/8192*n)+sin(2*pi*1209/8192*n); % ��Ӧ��Ƶ��Ƶ����
space=zeros(1,410); %410 ��0 ģ�⾲���ź�
phone=[d1,space];%Ҫ���͵��ź�
strnum1=strcat(get(handles.numscreen,'string'),'1');%֮ǰ�������������֡�1��
set(handles.numscreen,'string',strnum1);%��ʾ����ʾ����
handles.numcount=[handles.numcount,phone];%����Ҫ���͵��ź�
sound(d1,8192);%���Ű���������
guidata(hObject,handles);%����



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % ÿ��������410 ���������ʾ
d2=sin(2*pi*697/8192*n)+sin(2*pi*1336/8192*n); % ��Ӧ��Ƶ��Ƶ����
space=zeros(1,410); %410 ��0 ģ�⾲���ź�
phone=[d2,space];%Ҫ���͵��ź�
strnum2=strcat(get(handles.numscreen,'string'),'2');%֮ǰ�������������֡�2��
set(handles.numscreen,'string',strnum2);%��ʾ����ʾ����
handles.numcount=[handles.numcount,phone];%����Ҫ���͵��ź�
sound(d2,8192);%���Ű���������
guidata(hObject,handles);%����


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % ÿ��������410 ���������ʾ
d3=sin(2*pi*697/8192*n)+sin(2*pi*1477/8192*n); % ��Ӧ��Ƶ��Ƶ����
space=zeros(1,410); %410 ��0 ģ�⾲���ź�
phone=[d3,space];%Ҫ���͵��ź�
strnum3=strcat(get(handles.numscreen,'string'),'3');%֮ǰ�������������֡�3��
set(handles.numscreen,'string',strnum3);%��ʾ����ʾ����
handles.numcount=[handles.numcount,phone];%����Ҫ���͵��ź�
sound(d3,8192);%���Ű���������
guidata(hObject,handles);%����


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % ÿ��������410 ���������ʾ
d4=sin(2*pi*770/8192*n)+sin(2*pi*1209/8192*n); % ��Ӧ��Ƶ��Ƶ����
space=zeros(1,410); %410 ��0 ģ�⾲���ź�
phone=[d4,space];%Ҫ���͵��ź�
strnum4=strcat(get(handles.numscreen,'string'),'4');%֮ǰ�������������֡�4��
set(handles.numscreen,'string',strnum4);%��ʾ����ʾ����
handles.numcount=[handles.numcount,phone];%����Ҫ���͵��ź�
sound(d4,8192);%���Ű���������
guidata(hObject,handles);%����


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % ÿ��������410 ���������ʾ
d5=sin(2*pi*770/8192*n)+sin(2*pi*1336/8192*n); % ��Ӧ��Ƶ��Ƶ����
space=zeros(1,410); %410 ��0 ģ�⾲���ź�
phone=[d5,space];%Ҫ���͵��ź�
strnum5=strcat(get(handles.numscreen,'string'),'5');%֮ǰ�������������֡�5��
set(handles.numscreen,'string',strnum5);%��ʾ����ʾ����
handles.numcount=[handles.numcount,phone];%����Ҫ���͵��ź�
sound(d5,8192);%���Ű���������
guidata(hObject,handles);%����


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % ÿ��������410 ���������ʾ
d6=sin(2*pi*770/8192*n)+sin(2*pi*1477/8192*n); % ��Ӧ��Ƶ��Ƶ����
space=zeros(1,410); %410 ��0 ģ�⾲���ź�
phone=[d6,space];%Ҫ���͵��ź�
strnum6=strcat(get(handles.numscreen,'string'),'6');%֮ǰ�������������֡�6��
set(handles.numscreen,'string',strnum6);%��ʾ����ʾ����
handles.numcount=[handles.numcount,phone];%����Ҫ���͵��ź�
sound(d6,8192);%���Ű���������
guidata(hObject,handles);%����


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % ÿ��������410 ���������ʾ
d7=sin(2*pi*852/8192*n)+sin(2*pi*1209/8192*n); % ��Ӧ��Ƶ��Ƶ����
space=zeros(1,410); %410 ��0 ģ�⾲���ź�
phone=[d7,space];%Ҫ���͵��ź�
strnum7=strcat(get(handles.numscreen,'string'),'7');%֮ǰ�������������֡�7��
set(handles.numscreen,'string',strnum7);%��ʾ����ʾ����
handles.numcount=[handles.numcount,phone];%����Ҫ���͵��ź�
sound(d7,8192);%���Ű���������
guidata(hObject,handles);%����


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % ÿ��������410 ���������ʾ
d8=sin(2*pi*852/8192*n)+sin(2*pi*1336/8192*n); % ��Ӧ��Ƶ��Ƶ����
space=zeros(1,410); %410 ��0 ģ�⾲���ź�
phone=[d8,space];%Ҫ���͵��ź�
strnum8=strcat(get(handles.numscreen,'string'),'8');%֮ǰ�������������֡�8��
set(handles.numscreen,'string',strnum8);%��ʾ����ʾ����
handles.numcount=[handles.numcount,phone];%����Ҫ���͵��ź�
sound(d8,8192);%���Ű���������
guidata(hObject,handles);%����


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % ÿ��������410 ���������ʾ
d9=sin(2*pi*852/8192*n)+sin(2*pi*1477/8192*n); % ��Ӧ��Ƶ��Ƶ����
space=zeros(1,410); %410 ��0 ģ�⾲���ź�
phone=[d9,space];%Ҫ���͵��ź�
strnum9=strcat(get(handles.numscreen,'string'),'9');%֮ǰ�������������֡�9��
set(handles.numscreen,'string',strnum9);%��ʾ����ʾ����
handles.numcount=[handles.numcount,phone];%����Ҫ���͵��ź�
sound(d9,8192);%���Ű���������
guidata(hObject,handles);%����


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num=get(handles.numscreen,'string');%��ȡ��Ļ�ϵ��ַ���
l=length(num);%�����ַ�������L
n11=strrep(num,num,num(1:l-1));%ȡǰ(L-1)���ַ��滻���ڵ��ַ������൱��ɾ�����һ���ַ�
set(handles.numscreen,'string',n11);%��ʾ����ַ����
L=length(handles.numcount);%��¼���ڵķ��������źų���
handles.numcount=handles.numcount(1:L-820); %ȡǰ(L-1)���ַ��ź��滻���ڵ��źţ��൱�ڷ���ʱɾ�����һ���ַ�
n=[1:410];
d10=sin(2*pi*941/8192*n)+sin(2*pi*1209/8192*n); %��Ӧ��Ƶ��Ƶ����
sound(d10,8192); %���Ű�������
guidata(hObject,handles);%����
 


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410]; % ÿ��������410 ���������ʾ
d0=sin(2*pi*941/8192*n)+sin(2*pi*1336/8192*n); % ��Ӧ��Ƶ��Ƶ����
space=zeros(1,410); %410 ��0 ģ�⾲���ź�
phone=[d0,space];%Ҫ���͵��ź�
strnum0=strcat(get(handles.numscreen,'string'),'0');%֮ǰ�������������֡�0��
set(handles.numscreen,'string',strnum0);%��ʾ����ʾ����
handles.numcount=[handles.numcount,phone];%����Ҫ���͵��ź�
sound(d0,8192);%���Ű���������
guidata(hObject,handles);%����


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:410];
d11=sin(2*pi*941/8192*n)+sin(2*pi*1477/8192*n); % ��Ӧ��Ƶ��Ƶ����
sound(d11,8192);%������������
numlength=length(handles.numcount);%���յ����źų���
count=numlength/820;%��������˶��ٸ�����
set(handles.receivescreen,'string','');%����
for i=1:count%һ��count������
   d=handles.numcount(1+820*(i-1):820*i);%ȡÿλ�������Ĳ�����
   f=fft(d,8192); % ��N=2048 ��FFT �任d��ȡ����ÿλ�������Ĳ�����
   a=abs(f);
   p=a.*a/8192; % ���㹦����
   num(1)=find(p(1:1000)==max(p(1:1000))); % ����Ƶ
   num(2)=1000+find(p(1000:1700)==max(p(1000:1700))); % ����Ƶ
   if (num(1) < 730)
       row=1; % ȷ������
   elseif (num(1) < 810)
       row=2;
   elseif (num(1) < 900)
       row=3;
   else
       row=4;     
   end
   if (num(2) < 1250)
       coloum=1; % ȷ������
   elseif (num(2) < 1390)
       coloum=2;
   elseif (num(2) < 1510)
       coloum=3;
   else
       coloum=4;
   end
   if row==4&&coloum==2%�������Ӧ������ֵ
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
       num=coloum+3*(row-1); %�������й�ϵ�������Ӧ������ֵ
   end
   strnum=strcat(get(handles.receivescreen, 'string'),num2str(num));%�����¾��ַ���
   set(handles.receivescreen,'string',strnum);%�������ʾ����Ļ�� 
end
    set(handles.edit4,'string',count);%��λ����ʾ����Ļ��
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
%�����źŵ�ʱ����� 
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
[filename,filepath]=uigetfile('.wav','ѡ����Ƶ�ļ�');%���ļ�
if(filename==0)
    return%�ж��ļ��Ƿ�Ϊ��
else
audeofile=strcat(filepath,filename);%�γ���Ƶ�ļ�·��
[sampledata1,Fs]=audioread(audeofile);%����Ƶ�ļ�·���ж�ȡ��Ƶ�ļ�����ò����ʺ���Ƶ����
SNR=get(handles.edit5,'String');
sampledata=awgn(sampledata1,str2num(SNR),'measured');
% -----------------------------------------��ͨ�˲� 
Hd=band_pass(600,690,1710,1800);                              %��ͨ�˲���
                            %��ͨ�˲���
sampledata=filter(Hd,sampledata); 
% Hd=bpass(700,710,750,760);  
% sampledata=filter(Hd,sampledata); 
%�˲�
%Hd=band_pass(700,710,750,760);          
%sound(y,Fs)
sound(sampledata,Fs);%������Ƶ�ļ�
%n=max(sampledata(1:length(sampledata)))%�����Ƶ���ݷ�ֵ  
count1=0;%��ʼ��
i=1;%��ʼ��
numcount1=[];%��ʼ��
% while(i<=length(sampledata)-2640/48000*Fs)%���һ�γ�2640�����������������СΪ2640�����������������ɣ���֮���ÿһ�����������
%     for j=i:ceil(i+2640/48000*Fs)%���ڲ�����48000����48000���ʣ���48000*Fs�����ڸ�����Ƶ��%�������Ƿ���Ϊ����������Ҫ��0�ĵ�ĺ����2640�����������
%             if(abs(sampledata(j))>0.3*n)%������Ϊ��ֵ��0.39�����ְ������ͻ��������ı�־��������ɷ�ֵ1.79��ȡ�߶�0.7��Ϊ�ֽ�㣬�������ͼ���ص㣬���������Ͱ������������������������
%                 count1=count1+1;%����
%             end
%         end
%         if(count1>550/48000*Fs)%ͳ���ж��ٸ�����0.39�ĵ㣬��700��Ϊ�ֽ����б���������������ģ�����ʹ��matlab�Գ����ġ���дcount1�ġ��������������ֳ��������е�count1��Ŀ�Ͱ�������Ŀ
%         numcount1=[numcount1,sampledata(i:i+ceil(4799/48000*Fs))']; %��������������������¼������ת�ã�����ʦ�Ĳ�����Ƶ��Ҫ������������%�Ѱ������ϲ��������õ�͸õ�֮��4800�㣬��100ms���ᶪ��һ���ְ�����β�����ݣ������Ҳ����������һЩ�׶����ݣ����������٣����Ұ������м���������߱��������ź��������á�
%           i=ceil(i+5000/48000*Fs);%ȡ�갴�����������öΣ����ظ���ȡ����Ƭ�Ρ�
% %         else
% %           i=ceil(i+600/48000*Fs)-count1;
%         end
%        i=i+1;%����
%         count1=0;%��λ     
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

t=0:1/Fs:(length(sampledata)-1)/Fs;%���ԭʼ���ε�ʱ��ת��  
plot(t,sampledata);%���ԭʼ����
hold on;
plot(t,sampledata1);%���ԭʼ����
hold off;
numlength=length(numcount1);%���յ����źų���
count=numlength/(1+4409);%��������˶��ٸ�����
set(handles.receivescreen,'string','');%����
for i=1:count%һ��count������
   d=numcount1(1+(1+4409)*(i-1):(1+4409)*i);%ȡÿλ�������Ĳ�����
   f=fft(d,Fs); % ��N=2048 ��FFT �任d��ȡ����ÿλ�������Ĳ�����
   a=abs(f);
   p=a.*a/Fs; % ���㹦����
   num(1)=find(p(1:1000)==max(p(1:1000))); % ����Ƶ
   num(2)=1000+find(p(1000:1700)==max(p(1000:1700))); % ����Ƶ
   if (num(1) < 730)
       row=1; % ȷ������
   elseif (num(1) < 810)
       row=2;
   elseif (num(1) < 900)
       row=3;
   else
       row=4;     
   end
   if (num(2) < 1260)
       coloum=1; % ȷ������
   elseif (num(2) < 1395)
       coloum=2;
   elseif (num(2) < 1550)
       coloum=3;
   else coloum=4;
   end
   if row==4&&coloum==2%�������Ӧ������ֵ
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
       num=coloum+3*(row-1); %�������й�ϵ�������Ӧ������ֵ
   end
   strnum=strcat(get(handles.receivescreen, 'string'),num2str(num));
   set(handles.receivescreen,'string',strnum);%�������ʾ����Ļ��
end
    set(handles.edit4,'string',count);%��λ����ʾ����Ļ��
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
