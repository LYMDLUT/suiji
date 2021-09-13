function varargout = LYM_GUI(varargin)
% LYM_GUI MATLAB code for LYM_GUI.fig
%      LYM_GUI, by itself, creates a new LYM_GUI or raises the existing
%      singleton*.
%
%      H = LYM_GUI returns the handle to a new LYM_GUI or the handle to
%      the existing singleton*.
%
%      LYM_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LYM_GUI.M with the given input arguments.
%
%      LYM_GUI('Property','Value',...) creates a new LYM_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LYM_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LYM_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LYM_GUI

% Last Modified by GUIDE v2.5 09-Nov-2020 23:03:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LYM_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LYM_GUI_OutputFcn, ...
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


% --- Executes just before LYM_GUI is made visible.
function LYM_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LYM_GUI (see VARARGIN)

% Choose default command line output for LYM_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LYM_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LYM_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Amp1_Callback(hObject, eventdata, handles)
% hObject    handle to Amp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Amp1 as text
%        str2double(get(hObject,'String')) returns contents of Amp1 as a double


% --- Executes during object creation, after setting all properties.
function Amp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Amp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Freq1_Callback(hObject, eventdata, handles)
% hObject    handle to Freq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Freq1 as text
%        str2double(get(hObject,'String')) returns contents of Freq1 as a double


% --- Executes during object creation, after setting all properties.
function Freq1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Freq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pha1_Callback(hObject, eventdata, handles)
% hObject    handle to Pha1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pha1 as text
%        str2double(get(hObject,'String')) returns contents of Pha1 as a double


% --- Executes during object creation, after setting all properties.
function Pha1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pha1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Amp2_Callback(hObject, eventdata, handles)
% hObject    handle to Amp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Amp2 as text
%        str2double(get(hObject,'String')) returns contents of Amp2 as a double


% --- Executes during object creation, after setting all properties.
function Amp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Amp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Freq2_Callback(hObject, eventdata, handles)
% hObject    handle to Freq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Freq2 as text
%        str2double(get(hObject,'String')) returns contents of Freq2 as a double


% --- Executes during object creation, after setting all properties.
function Freq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Freq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pha2_Callback(hObject, eventdata, handles)
% hObject    handle to Pha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pha2 as text
%        str2double(get(hObject,'String')) returns contents of Pha2 as a double


% --- Executes during object creation, after setting all properties.
function Pha2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NUM_Callback(hObject, eventdata, handles)
% hObject    handle to NUM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NUM as text
%        str2double(get(hObject,'String')) returns contents of NUM as a double


% --- Executes during object creation, after setting all properties.
function NUM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NUM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fs_Callback(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fs as text
%        str2double(get(hObject,'String')) returns contents of Fs as a double


% --- Executes during object creation, after setting all properties.
function Fs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AmpN_Callback(hObject, eventdata, handles)
% hObject    handle to AmpN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AmpN as text
%        str2double(get(hObject,'String')) returns contents of AmpN as a double


% --- Executes during object creation, after setting all properties.
function AmpN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AmpN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Amp1 = eval(get(handles.Amp1,'String'));
Pha1 = eval(get(handles.Pha1,'String'));
Freq1 = eval(get(handles.Freq1,'String'));
Amp2 = eval(get(handles.Amp2,'String'));
Pha2 = eval(get(handles.Pha2,'String'));
Freq2 = eval(get(handles.Freq2,'String'));
Num =eval( get(handles.NUM,'String'));
AmpN = eval(get(handles.AmpN,'String'));
Fs = eval(get(handles.Fs,'String'));
%两个带随机相位的单谱信号与白噪声之和
t=(0:Num-1)/Fs;                       %时间序列
xn=Amp1*cos(2*pi*Freq1*t+Pha1)+Amp2*cos(2*pi*Freq2*t+Pha2)+AmpN*randn(1,Num); %产生含噪声的随机序列
plot(handles.axes1,t,xn);
title(handles.axes1,'随机信号时域波形')
xlim(handles.axes1,[0,(Num-1)/Fs]);
%% 直接法谱估计
%对样本进行傅里叶变换，取模平方时间平均
Sx1=abs(fft(xn)).^2/Num;              %估计功率谱
f=(0:Num/2-1)*Fs/Num;                   %频率轴坐标
plot(handles.axes2,f,10*log10(Sx1(1:Num/2))); %用dB/Hz做功率谱单位，画图
xlabel(handles.axes2,'f（Hz）');
ylabel(handles.axes2,'Sx1(f)(dB/Hz)');
title(handles.axes2,'周期图法估计功率谱');
%% 与内置函数对比
%periodogram
Sx2=periodogram(xn);
plot(handles.axes3,f,10*log10(Sx2(1:Num/2)));
xlabel(handles.axes3,'f(Hz)');
ylabel(handles.axes3,'Sx2(f)(dB/Hz)');
title(handles.axes3,'periodogram函数估计功率谱');

%% 间接法谱估计
Rxx=xcorr(xn,'biased');                     %估计自相关函数Rxx
Sx3=abs(fft(Rxx));                          %对Rxx进行FFT得到功率谱
f=(0:Num-1)*Fs/Num/2;                           %频率轴坐标
plot(handles.axes4,f,10*log10(Sx3(1:Num)));          %用dB/Hz做功率谱单位，画图
xlabel(handles.axes4,'f(Hz)');
ylabel(handles.axes4,'Sx(f)(dB/Hz)');
title(handles.axes4,'自相关函数法估计功率谱');
%% 内置函数psd
Nseg=256;                                   %分段间隔为256
window=hanning(Nseg);                       %汉宁窗
noverlap=Nseg/2;                            %重叠点数为128
f=(0:Nseg/2)*Fs/Nseg;                       %频率轴坐标
Sx4=psd(xn,Nseg,Fs,window,noverlap,'none');  %psd函数估计功率谱
plot(handles.axes5,f,10*log10(Sx4));
xlabel(handles.axes5,'f(Hz)');
ylabel(handles.axes5,'Sx(f)(dB/Hz)');
title(handles.axes5,'Bartlett法估计功率谱');

%% 内置函数pwelch
Sx5=pwelch(xn,window,128,Nseg,Fs,'onesided')*Fs/2;                                %Welch函数估计功率谱
plot(handles.axes6,f,10*log10(Sx5));grid on;
xlabel(handles.axes6,'f(Hz)');
ylabel(handles.axes6,'Sx(f)(dB/Hz)');
title(handles.axes6,'Welch法估计功率谱');

guidata(hObject, handles);
