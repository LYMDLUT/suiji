function varargout = suiji2_4(varargin)
% SUIJI2_4 MATLAB code for suiji2_4.fig
%      SUIJI2_4, by itself, creates a new SUIJI2_4 or raises the existing
%      singleton*.
%
%      H = SUIJI2_4 returns the handle to a new SUIJI2_4 or the handle to
%      the existing singleton*.
%
%      SUIJI2_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUIJI2_4.M with the given input arguments.
%
%      SUIJI2_4('Property','Value',...) creates a new SUIJI2_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before suiji2_4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to suiji2_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help suiji2_4

% Last Modified by GUIDE v2.5 03-Nov-2020 21:12:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @suiji2_4_OpeningFcn, ...
                   'gui_OutputFcn',  @suiji2_4_OutputFcn, ...
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


% --- Executes just before suiji2_4 is made visible.
function suiji2_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to suiji2_4 (see VARARGIN)

% Choose default command line output for suiji2_4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes suiji2_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = suiji2_4_OutputFcn(hObject, eventdata, handles) 
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
[filename,path]=uigetfile('.wav','ѡ����Ƶ�ļ�');
audeofile= strcat(path,filename); 
[xn,fs]=audioread(audeofile);
set(handles.sbdata,'string',[]);
number=['1','2','3','A';'4','5','6','B';'7','8','9','C';'*','0','#','D';];
%sound(xn,fs);
tp=[];
L=length(xn);
xmm=awgn(xn,-2);
Fs=fs;
Fstop1 = 500;         % First Stopband Frequency
Fpass1 = 697;         % First Passband Frequency
Fpass2 = 1477;        % Second Passband Frequency
Fstop2 = 1600;        % Second Stopband Frequency
Astop1 = 20;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)1
Astop2 = 40;          % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly 
% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, Astop2, Fs);
Hd = design(h,'butter', 'MatchExactly', match);  %��ͨ�˲���
x=filter(Hd,xmm);                          %�˲�
i=1;
while(i<L)
    if(i<L-fs/20)
    xh=x(i:i+fs/20);
    else
    xh=x(i:L);
    end
    f=fft(xh,fs);
    b=abs(f);
	p=b.*b/(fs);
    if(max(p(1:1000))>1.2&&max(p(1000:1700))>1.2)
    num(1)=find(p(1:1000)==max(p(1:1000)));
    num(2)=1000+find(p(1000:1700)==max(p(1000:1700)));
    if(num(1)<730)
        row=1;
    elseif(num(1)<810)
        row=2;
    elseif(num(1)<900)
        row=3;
    else
        row=4;
    end
    if(num(2)<1280)
        col=1;
    elseif(num(2)<1410)
        col=2;
    elseif(num(2)<1600)
        col=3;
    else
        col=4;
    end
    c=strcat(get(handles.sbdata,'string'),number(row,col));
    set(handles.sbdata,'string',c);
    i=i+fs/12;
    else
        i=i+fs/210;
    end
end
axes(handles.axes1)
plot(x);
sound(x,fs);
