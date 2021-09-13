function varargout = psd(varargin)
% PSD MATLAB code for psd.fig
%      PSD, by itself, creates a new PSD or raises the existing
%      singleton*.
%
%      H = PSD returns the handle to a new PSD or the handle to
%      the existing singleton*.
%
%      PSD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PSD.M with the given input arguments.
%
%      PSD('Property','Value',...) creates a new PSD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before psd_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to psd_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help psd

% Last Modified by GUIDE v2.5 12-Nov-2019 10:34:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @psd_OpeningFcn, ...
                   'gui_OutputFcn',  @psd_OutputFcn, ...
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


% --- Executes just before psd is made visible.
function psd_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to psd (see VARARGIN)

% Choose default command line output for psd
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes psd wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = psd_OutputFcn(hObject, eventdata, handles) 
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
Amp1 = eval(get(handles.Amp1,'String'));
Pha1 = eval(get(handles.Pha1,'String'));
Freq1 = eval(get(handles.Freq1,'String'));
Amp2 = eval(get(handles.Amp2,'String'));
Pha2 = eval(get(handles.Pha2,'String'));
Freq2 = eval(get(handles.Freq2,'String'));
Num =eval( get(handles.Num,'String'));
AmpN = eval(get(handles.AmpN,'String'));
Fs = eval(get(handles.Fs,'String'));
Data = data_process(Amp1,Pha1,Freq1,Amp2,Pha2,Freq2,Num,AmpN,Fs);
axes(handles.axes1);
hold off;
plot(Data.A(:,1),Data.A(:,2));grid on;
title('随机信号时域波形')
axes(handles.axes2);
hold off;
plot(Data.B(:,1),Data.B(:,2));grid on;
xlabel('f（Hz）');
ylabel('Sx1(f)(dB/Hz)');
title('周期图法估计功率谱');
axes(handles.axes3);
hold off;
plot(Data.C(:,1),Data.C(:,2));grid on;
title('直接法加矩形窗平滑');
axes(handles.axes4);
hold off;
plot(Data.D(:,1),Data.D(:,2));grid on;
title('直接法加汉宁窗平滑');

axes(handles.axes5);
hold off;
plot(Data.E(:,1),Data.E(:,2));grid on;
xlabel('f(Hz)');
ylabel('Sx2(f)(dB/Hz)');
title('periodogram函数估计功率谱');
axes(handles.axes6);
hold off;
plot(Data.F(:,1),Data.F(:,2));grid on;
title('直接法加汉宁窗平滑');
axes(handles.axes7);
hold off;
plot(Data.G(:,1),Data.G(:,2));grid on;
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title('psd函数估计功率谱');
axes(handles.axes8);
hold off;
plot(Data.H(:,1),Data.H(:,2));grid on;
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title('Welch函数估计功率谱');



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



function Num_Callback(hObject, eventdata, handles)
% hObject    handle to Num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Num as text
%        str2double(get(hObject,'String')) returns contents of Num as a double


% --- Executes during object creation, after setting all properties.
function Num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



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
