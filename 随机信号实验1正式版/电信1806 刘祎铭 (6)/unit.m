function varargout = unit(varargin)
% UNIT MATLAB code for unit.fig
%      UNIT, by itself, creates a new UNIT or raises the existing
%      singleton*.
%
%      H = UNIT returns the handle to a new UNIT or the handle to
%      the existing singleton*.
%
%      UNIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNIT.M with the given input arguments.
%
%      UNIT('Property','Value',...) creates a new UNIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before unit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to unit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help unit

% Last Modified by GUIDE v2.5 15-Jun-2020 01:04:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @unit_OpeningFcn, ...
                   'gui_OutputFcn',  @unit_OutputFcn, ...
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


% --- Executes just before unit is made visible.
function unit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to unit (see VARARGIN)

% Choose default command line output for unit
handles.output = hObject;
handles.Bz=0;
handles.Az=0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes unit wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = unit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath]=uigetfile('.wav','选择音频文件'); 
if(filename==0)
    return; 
end
audeofile= strcat(filepath,filename); 
[handles.tdata,handles.fs]=audioread(audeofile);
set(handles.radiobutton1,'value',1);
set(handles.radiobutton2,'value',0);
set(handles.lWp1,'ENable','on');
set(handles.lWs1,'ENable','on');    
set(handles.lWp2,'ENable','off');
set(handles.lWs2,'ENable','off');
set(handles.popupmenu3,'ENable','off');
set(handles.popupmenu2,'ENable','on');
guidata(hObject, handles);
% --- Executes on button press in storge.
function storge_Callback(hObject, eventdata, handles)
% hObject    handle to storge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath]=uiputfile('.wav','保存音频文件'); 
if(filename==0)
    return; 
end
audeofile= strcat(filepath,filename); 
audiowrite(audeofile,handles.lvtdata,handles.fs);
guidata(hObject, handles);

% --- Executes on button press in pinpu.
function pinpu_Callback(hObject, eventdata, handles)
% hObject    handle to pinpu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tianjia=get(handles.tianjiazaosheng,'Value');
t=[0:1/handles.fs:(length(handles.tdata)-1)/handles.fs];
N=length(t);
if(tianjia==1)
y=wgn(length(handles.tdata),2,str2num(get(handles.xinzaobidb,'string')));
handles.zaotdata=0.1*y+handles.tdata;
else
handles.zaotdata=handles.tdata;
end
handles.lvtdata=filtfilt(handles.Bz,handles.Az,handles.zaotdata);


if get(handles.radiobutton3,'value')
lvtdata=handles.tdata;
elseif get(handles.radiobutton4,'value')
lvtdata=handles.zaotdata;
elseif get(handles.radiobutton5,'value')
lvtdata=handles.lvtdata;
end
plot(handles.axes1,t,lvtdata);
title(handles.axes1,'时域');
Y=fft(lvtdata);
f8=(0:N-1).*handles.fs./length(t)-1./2.*handles.fs;
plot(handles.axes2,f8,fftshift(abs(Y)));
title(handles.axes2,'频域');
% axis(handles.axes2,[-500,500,0,2500]); 
guidata(hObject, handles);
% --- Executes on button press in luzhiyinpin.
function luzhiyinpin_Callback(hObject, eventdata, handles)
% hObject    handle to luzhiyinpin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
R=audiorecorder( 48000, 16 ,2);
disp('Start speaking.');
recordblocking(R, 5);
disp('End of Recording.');
handles.tdata=getaudiodata(R);
handles.fs=48000;
guidata(hObject, handles);
% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'value',1);
set(handles.radiobutton2,'value',0);
set(handles.popupmenu3,'ENable','off');
set(handles.popupmenu2,'ENable','on');
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton2,'value',1);
set(handles.radiobutton1,'value',0);
set(handles.popupmenu2,'ENable','off');
set(handles.popupmenu3,'ENable','on');
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.lRp,'Enable','on');
set(handles.lRs,'Enable','on');
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice3=get(handles.popupmenu3,'Value');
switch choice3
    case 1
set(handles.lRp,'Enable','off');
set(handles.lRs,'Enable','off');
    case 2
set(handles.lRp,'Enable','off');
set(handles.lRs,'Enable','off');
    case 3
set(handles.lRp,'Enable','off');
set(handles.lRs,'Enable','off');
    case 4
set(handles.lRp,'Enable','off');
set(handles.lRs,'Enable','off');
    case 5
set(handles.lRp,'Enable','off');
set(handles.lRs,'Enable','on');
end
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.popupmenu1,'Value')==1)
set(handles.lWp1,'ENable','on');
set(handles.lWs1,'ENable','on');    
set(handles.lWp2,'ENable','off');
set(handles.lWs2,'ENable','off');
end
if (get(handles.popupmenu1,'Value')==2)
set(handles.lWp1,'ENable','on');
set(handles.lWs1,'ENable','on');    
set(handles.lWp2,'ENable','off');
set(handles.lWs2,'ENable','off');
end
if (get(handles.popupmenu1,'Value')==3)
set(handles.lWp1,'ENable','on');
set(handles.lWs1,'ENable','on');    
set(handles.lWp2,'ENable','on');
set(handles.lWs2,'ENable','on');
end
if (get(handles.popupmenu1,'Value')==4)
set(handles.lWp1,'ENable','on');
set(handles.lWs1,'ENable','on');    
set(handles.lWp2,'ENable','on');
set(handles.lWs2,'ENable','on');
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%--- Executes on button press in queding.
function queding_Callback(hObject, eventdata, handles)
% hObject    handle to queding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice1=get(handles.popupmenu1,'Value');
choice2=get(handles.popupmenu2,'Value');
choice3=get(handles.popupmenu3,'Value');
Wp1=str2num(get(handles.lWp1,'String'));
Ws1=str2num(get(handles.lWs1,'String'));
Wp2=str2num(get(handles.lWp2,'String'));
Ws2=str2num(get(handles.lWs2,'String'));
Rp=str2num(get(handles.lRp,'String'));
Rs=str2num(get(handles.lRs,'String'));
if get(handles.radiobutton1,'value')
switch choice1 
    case 1
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;  
        switch choice2  
        case 1   
        %**********************************************低通滤波器********************
        [N,Wc]=buttord(wp1,ws1,Rp,Rs);%设计数字滤波器
        [handles.Bz,handles.Az]=butter(N,Wc,'low'); 
        case 2
        [N,Wn]=cheb1ord(wp1,ws1,Rp,Rs);
        [handles.Bz,handles.Az]=cheby1(N,Rp,Wn,'low');   
        case 3 
        [N,Wn]=cheb1ord(wp1,ws1,Rp,Rs);
        [handles.Bz,handles.Az]=cheby2(N,Rs,Wn,'low');   
        end
    case 2
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2; 
        switch choice2
        case 1  
        %**********************************************高通滤波器********************
        [N,Wc]=buttord(wp1,ws1,Rp,Rs);%设计数字滤波器
        [handles.Bz,handles.Az]=butter(N,Wc,'high');
        case 2
        [N,Wn]=cheb1ord(wp1,ws1,Rp,Rs);
        [handles.Bz,handles.Az]=cheby1(N,Rp,Wn,'high');
        case 3 
        [N,Wn]=cheb1ord(wp1,ws1,Rp,Rs);
        [handles.Bz,handles.Az]=cheby2(N,Rs,Wn,'high');
        end
         
        case 3
        wp2=[Wp1/handles.fs*2,Wp2/handles.fs*2];%数字滤波器参数
        ws2=[Ws1/handles.fs*2,Ws2/handles.fs*2];       
        switch choice2
        case 1  
        %**********************************************带通滤波器********************
        [N,Wc]=buttord(wp2,ws2,Rp,Rs);%设计数字滤波器
        [handles.Bz,handles.Az]=butter(N,Wc,'bandpass'); 
        case 2
        [N,Wn]=cheb1ord(wp2,ws2,Rp,Rs);
        [handles.Bz,handles.Az]=cheby1(N,Rp,Wn,'bandpass');
        case 3 
        [N,Wn]=cheb1ord(wp2,ws2,Rp,Rs);
        [handles.Bz,handles.Az]=cheby2(N,Rs,Wn,'bandpass');
        end
        case 4
        wp2=[Wp1/handles.fs*2,Wp2/handles.fs*2];%数字滤波器参数
        ws2=[Ws1/handles.fs*2,Ws2/handles.fs*2]; 
        switch choice2
        case 1  
        %**********************************************带阻滤波器********************
        [N,Wc]=buttord(wp2,ws2,Rp,Rs);%设计数字滤波器
        [handles.Bz,handles.Az]=butter(N,Wc,'stop'); 
        case 2
        [N,Wn]=cheb1ord(wp2,ws2,Rp,Rs);
        [handles.Bz,handles.Az]=cheby1(N,Rp,Wn,'stop');
        case 3 
        [N,Wn]=cheb1ord(wp2,ws2,Rp,Rs);
        [handles.Bz,handles.Az]=cheby2(N,Rs,Wn,'stop');
        end    
end
elseif get(handles.radiobutton2,'value')
    switch choice1
        case 1
            switch choice3
                case 1
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;                        
        DB=wp1-ws1;           
        N0 = ceil(4/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=(wp1+ws1)/2; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'low',boxcar(N));                        
                case 2
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;                        
        DB=wp1-ws1;           
        N0 = ceil(8/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=(wp1+ws1)/2; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'low',hamming(N));                     
                case 3
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;                        
        DB=wp1-ws1;           
        N0 = ceil(8/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=(wp1+ws1)/2; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'low',hanning(N));                     
                case 4
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;                        
        DB=wp1-ws1;           
        N0 = ceil(12/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=(wp1+ws1)/2; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'low',blackman(N));               
                case 5
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;
        
        DB=wp1-ws1;
        A = Rs;
        if A<21
            beta = 0;
        elseif A>=21 && A<=50
            beta = 0.5842*(A-21)^0.4+0.07886*(A-21);
        else
            beta = 0.1102*(A-8.7); 
        end
        M = ceil((A-7.95)/(2.285*abs(DB*pi)));
        M = mod(M,2)+M;
        Wn=(wp1+ws1)/2; 
        [handles.Bz,handles.Az]=fir1(M,Wn,'low',kaiser(M+1,beta)); 
  
            end   
        case 2
            switch choice3
              case 1
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;                        
        DB=wp1-ws1;           
        N0 = ceil(4/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=(wp1+ws1)/2; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'high',boxcar(N));  
                case 2
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;                        
        DB=wp1-ws1;           
        N0 = ceil(8/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=(wp1+ws1)/2; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'high',hamming(N));               
                    
                    
                    
                case 3
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;                        
        DB=wp1-ws1;           
        N0 = ceil(8/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=(wp1+ws1)/2; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'high',hanning(N));                        
                case 4
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;                        
        DB=wp1-ws1;           
        N0 = ceil(12/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=(wp1+ws1)/2; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'high',blackman(N));              
                    
                    
                case 5
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;
        wp2=Wp2/handles.fs*2;%数字滤波器参数
        ws2=Ws2/handles.fs*2;
        DB=wp1-ws1;
        A = Rs;
        if A<21
            beta = 0;
        elseif A>=21 && A<=50
            beta = 0.5842*(A-21)^0.4+0.07886*(A-21);
        else
            beta = 0.1102*(A-8.7); 
        end
                M = ceil((A-7.95)/(2.285*abs(DB*pi)));
        M = mod(M,2)+M;
        Wn=(wp1+ws1)/2; 
        [handles.Bz,handles.Az]=fir1(M,Wn,'high',kaiser(M+1,beta));    
            
            
            
            end  
        case 3
           switch choice3
              case 1
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2; 
        wp2=Wp2/handles.fs*2;%数字滤波器参数
        ws2=Ws2/handles.fs*2;
        DB=wp1-ws1;           
        N0 = ceil(4/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=[(wp1+ws1)/2,(wp2+ws2)/2]; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'bandpass',boxcar(N));          
                           
                case 2
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2; 
        wp2=Wp2/handles.fs*2;%数字滤波器参数
        ws2=Ws2/handles.fs*2;
        DB=wp1-ws1;           
        N0 = ceil(8/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=[(wp1+ws1)/2,(wp2+ws2)/2]; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'bandpass',hamming(N));                        
                case 3
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2; 
        wp2=Wp2/handles.fs*2;%数字滤波器参数
        ws2=Ws2/handles.fs*2;
        DB=wp1-ws1;           
        N0 = ceil(8/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=[(wp1+ws1)/2,(wp2+ws2)/2]; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'bandpass',hanning(N));                         
                case 4
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2; 
        wp2=Wp2/handles.fs*2;%数字滤波器参数
        ws2=Ws2/handles.fs*2;
        DB=wp1-ws1;           
        N0 = ceil(12/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=[(wp1+ws1)/2,(wp2+ws2)/2]; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'bandpass',blackman(N));                              
                case 5
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;
        wp2=Wp2/handles.fs*2;%数字滤波器参数
        ws2=Ws2/handles.fs*2;
        DB=wp1-ws1;
        A = Rs;
        if A<21
            beta = 0;
        elseif A>=21 && A<=50
            beta = 0.5842*(A-21)^0.4+0.07886*(A-21);
        else
            beta = 0.1102*(A-8.7); 
        end
                M = ceil((A-7.95)/(2.285*abs(DB*pi)));
        M = mod(M,2)+M;
        Wn=[(wp1+ws1)/2,(wp2+ws2)/2]; 
        [handles.Bz,handles.Az]=fir1(M,Wn,'bandpass',kaiser(M+1,beta));
           end  
        case 4
           switch choice3
              case 1
               wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2; 
        wp2=Wp2/handles.fs*2;%数字滤波器参数
        ws2=Ws2/handles.fs*2;
        DB=wp1-ws1;           
        N0 = ceil(4/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=[(wp1+ws1)/2,(wp2+ws2)/2]; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'stop',boxcar(N));                  
                case 2
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2; 
        wp2=Wp2/handles.fs*2;%数字滤波器参数
        ws2=Ws2/handles.fs*2;
        DB=wp1-ws1;           
        N0 = ceil(8/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=[(wp1+ws1)/2,(wp2+ws2)/2]; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'stop',hamming(N));                         
                case 3
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2; 
        wp2=Wp2/handles.fs*2;%数字滤波器参数
        ws2=Ws2/handles.fs*2;
        DB=wp1-ws1;           
        N0 = ceil(8/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=[(wp1+ws1)/2,(wp2+ws2)/2]; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'stop',hanning(N));                 
                case 4
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2; 
        wp2=Wp2/handles.fs*2;%数字滤波器参数
        ws2=Ws2/handles.fs*2;
        DB=wp1-ws1;           
        N0 = ceil(12/abs(DB));
        N = mod(N0+1,2)+N0;
        Wn=[(wp1+ws1)/2,(wp2+ws2)/2]; 
        [handles.Bz,handles.Az]=fir1(N-1,Wn,'stop',blackman(N));                    
                case 5
        wp1=Wp1/handles.fs*2;%数字滤波器参数
        ws1=Ws1/handles.fs*2;
        wp2=Wp2/handles.fs*2;%数字滤波器参数
        ws2=Ws2/handles.fs*2;
        DB=wp1-ws1;
        A = Rs;
        if A<21
            beta = 0;
        elseif A>=21 && A<=50
            beta = 0.5842*(A-21)^0.4+0.07886*(A-21);
        else
            beta = 0.1102*(A-8.7); 
        end
                M = ceil((A-7.95)/(2.285*abs(DB*pi)));
        M = mod(M,2)+M;
        Wn=[(wp1+ws1)/2,(wp2+ws2)/2]; 
        [handles.Bz,handles.Az]=fir1(M,Wn,'stop',kaiser(M+1,beta));
           end      
         
    end
     
end
%******************************
        [H,W]=freqz(handles.Bz,handles.Az);
        plot(handles.axes3,W*handles.fs/(pi*2),20*log10(abs(H)));
        axis(handles.axes3,[0 5000 -50 0]);
        title(handles.axes3,'衰减频谱图(dB)');
        xlabel(handles.axes3,'频率（Hz）');
        ylabel(handles.axes3,'衰减');
guidata(hObject, handles);

function lWp1_Callback(hObject, eventdata, handles)
% hObject    handle to lWp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lWp1 as text
%        str2double(get(hObject,'String')) returns contents of lWp1 as a double


% --- Executes during object creation, after setting all properties.
function lWp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lWp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lWs1_Callback(hObject, eventdata, handles)
% hObject    handle to lWs1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lWs1 as text
%        str2double(get(hObject,'String')) returns contents of lWs1 as a double


% --- Executes during object creation, after setting all properties.
function lWs1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lWs1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lWp2_Callback(hObject, eventdata, handles)
% hObject    handle to lWp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lWp2 as text
%        str2double(get(hObject,'String')) returns contents of lWp2 as a double


% --- Executes during object creation, after setting all properties.
function lWp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lWp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lWs2_Callback(hObject, eventdata, handles)
% hObject    handle to lWs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lWs2 as text
%        str2double(get(hObject,'String')) returns contents of lWs2 as a double


% --- Executes during object creation, after setting all properties.
function lWs2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lWs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lRp_Callback(hObject, eventdata, handles)
% hObject    handle to lRp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lRp as text
%        str2double(get(hObject,'String')) returns contents of lRp as a double


% --- Executes during object creation, after setting all properties.
function lRp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lRp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lRs_Callback(hObject, eventdata, handles)
% hObject    handle to lRs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lRs as text
%        str2double(get(hObject,'String')) returns contents of lRs as a double


% --- Executes during object creation, after setting all properties.
function lRs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lRs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton3,'value',1);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton5.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton4,'value',1);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton3,'value',0);
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton4.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton5,'value',1);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton3,'value',0);
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in tianjiazaosheng.
function tianjiazaosheng_Callback(hObject, eventdata, handles)
% hObject    handle to tianjiazaosheng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tianjiazaosheng




function xinzaobidb_Callback(hObject, eventdata, handles)
% hObject    handle to xinzaobidb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xinzaobidb as text
%        str2double(get(hObject,'String')) returns contents of xinzaobidb as a double





% --- Executes during object creation, after setting all properties.
function xinzaobidb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xinzaobidb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bofang.
function bofang_Callback(hObject, eventdata, handles)
% hObject    handle to bofang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice=get(handles.popupmenu4,'Value');
switch choice
    case 1
        sound(handles.tdata,handles.fs);
    case 2
        sound(handles.zaotdata,handles.fs);      
    case 3
        sound(handles.lvtdata,handles.fs);    
end     
guidata(hObject, handles);
