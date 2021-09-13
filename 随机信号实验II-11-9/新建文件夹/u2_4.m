function varargout = u2_4(varargin)
% U2_4 MATLAB code for u2_4.fig
%      U2_4, by itself, creates a new U2_4 or raises the existing
%      singleton*.
%
%      H = U2_4 returns the handle to a new U2_4 or the handle to
%      the existing singleton*.
%
%      U2_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in U2_4.M with the given input arguments.
%
%      U2_4('Property','Value',...) creates a new U2_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before u2_4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to u2_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help u2_4

% Last Modified by GUIDE v2.5 11-Nov-2020 11:38:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @u2_4_OpeningFcn, ...
                   'gui_OutputFcn',  @u2_4_OutputFcn, ...
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


% --- Executes just before u2_4 is made visible.
function u2_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to u2_4 (see VARARGIN)

% Choose default command line output for u2_4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes u2_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = u2_4_OutputFcn(hObject, eventdata, handles) 
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
[filename,filepath]=uigetfile('.wav','选择音频文件');
audeofile=strcat(filepath,filename);
[y0,Fs]=audioread(audeofile);


SNR=str2double(get(handles.edit2,'string'));
y1=awgn(y0,SNR,'measured');
sound(y1,Fs);
%信号的时域输出
t=0:1:(length(y0)-1);  
plot(handles.axes1,t,y0);
plot(handles.axes2,t,y1);


% -----------------------------------------带通滤波 
Hd=band_pass;                              %带通滤波器
y=filter(Hd,y1);                          %滤波
%sound(y,Fs)



n=max(y(1:length(y)));
count1=0;
i=1;
numcount1=[];
while(i<=length(y)-2205/44100*Fs)
    for j=i:i+2205/44100*Fs
        a=abs(y(j));
            if(a>0.3)
                count1=count1+1;
            end
     end
        if(count1>600/44100*Fs)
        numcount1=[numcount1,y(i:i+4409/44100*Fs)']; 
          i=i+4000/44100*Fs;
        else
         i=i+610-count1;
        end
      % i=i+1;
       % i=ceil(i+600/44100*Fs)-count1;
        count1=0;     
%  if(count1>600/48000*Fs)%统计有多少个大于0.39的点，用700作为分界点进行保留，不是算出来的，而是使用matlab试出来的。不写count1的‘；’很容易区分出噪声含有的count1数目和按键音数目
%         numcount1=[numcount1,sampledata(i:i+ceil(4799/48000*Fs))']; %！！！！！！！！正常录音不需转置，但老师的测试音频需要！！！！！！%把按键音合并起来，该点和该点之后4800点，即100ms，会丢掉一部分按键音尾端数据，设计中也会舍弃很少一些首端数据，不过数量少，而且按键音中间的声音更具备特征，信号质量更好。
%           i=ceil(i+5000/48000*Fs);%取完按键音后跳过该段，不重复截取声音片段。
%         else
%           i=ceil(i+600/48000*Fs)-count1;
        
    
        
        
end

numlength=length(numcount1);%接收到的信号长度
count=numlength/4410;
set(handles.receivescreen,'string','');
for i=1:count
   d=numcount1(1+4410*(i-1):4410*i);
   f=fft(d,44100); 
   a=abs(f);
   p=a.*a/44100; % 计算功率谱
   num(1)=find(p(1:1000)==max(p(1:1000))); % 找行频
   num(2)=1000+find(p(1000:1700)==max(p(1000:1700))); % 找列频
   if (num(1) < 730)% 确定行数
       row=1; 
   elseif (num(1) < 810)
       row=2;
   elseif (num(1) < 900)
       row=3;
   else
       row=4;     
   end
   if (num(2) < 1270)% 确定列数
       coloum=1; 
   elseif (num(2) < 1390)
       coloum=2;
   elseif (num(2) < 1550)
       coloum=3;
        else
        coloum=4;  
   end
   if      (row==1&&coloum==1)%计算出对应的数字值
        num='1';
   elseif (row==1&&coloum==2)
        num='2';
   elseif (row==1&&coloum==3)
        num='3';
   elseif (row==1&&coloum==4)
        num='A';
   elseif (row==2&&coloum==1)
        num='4';
   elseif (row==2&&coloum==2)
        num='5';
   elseif (row==2&&coloum==3)
        num='6';
   elseif (row==2&&coloum==4)
        num='B';
  elseif (row==3&&coloum==1)
        num='7';
   elseif (row==3&&coloum==2)
        num='8';
   elseif (row==3&&coloum==3)
        num='9';
  elseif (row==3&&coloum==4)
        num='C';
  elseif (row==4&&coloum==1)
        num='*';
  elseif (row==4&&coloum==2)
        num='0';
  elseif (row==4&&coloum==3)
        num='#';
   elseif (row==4&&coloum==4)
        num='D';    
   end
   strnum=strcat(get(handles.receivescreen, 'string'),char(num));
   set(handles.receivescreen,'string',strnum);%将结果显示在屏幕上
end



guidata(hObject,handles);


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

function y = awgn(varargin)
%AWGN Add white Gaussian noise to a signal.
%   Y = AWGN(X,SNR) adds white Gaussian noise to X.  The SNR is in dB.
%   The power of X is assumed to be 0 dBW.  If X is complex, then 
%   AWGN adds complex noise.
%
%   Y = AWGN(X,SNR,SIGPOWER) when SIGPOWER is numeric, it represents 
%   the signal power in dBW. When SIGPOWER is 'measured', AWGN measures
%   the signal power before adding noise.
%
%   Y = AWGN(X,SNR,SIGPOWER,S) uses S to generate random noise samples with
%   the RANDN function. S can be a random number stream specified by
%   RandStream. S can also be an integer, which seeds a random number
%   stream inside the AWGN function. If you want to generate repeatable
%   noise samples, then either reset the random stream input before calling
%   AWGN or use the same seed input.
%
%   Y = AWGN(..., POWERTYPE) specifies the units of SNR and SIGPOWER.
%   POWERTYPE can be 'db' or 'linear'.  If POWERTYPE is 'db', then SNR
%   is measured in dB and SIGPOWER is measured in dBW.  If POWERTYPE is
%   'linear', then SNR is measured as a ratio and SIGPOWER is measured
%   in Watts.
%
%   Example 1: 
%        % To specify the power of X to be 0 dBW and add noise to produce
%        % an SNR of 10dB, use:
%        X = sqrt(2)*sin(0:pi/8:6*pi);
%        Y = awgn(X,10,0);
%
%   Example 2: 
%        % To specify the power of X to be 3 Watts and add noise to
%        % produce a linear SNR of 4, use:
%        X = sqrt(2)*sin(0:pi/8:6*pi);
%        Y = awgn(X,4,3,'linear');
%
%   Example 3: 
%        % To cause AWGN to measure the power of X and add noise to
%        % produce a linear SNR of 4, use:
%        X = sqrt(2)*sin(0:pi/8:6*pi);
%        Y = awgn(X,4,'measured','linear');
%
%   Example 4: 
%        % To specify the power of X to be 0 dBW, add noise to produce
%        % an SNR of 10dB, and utilize a local random stream, use:
%        S = RandStream('mt19937ar','Seed',5489);
%        X = sqrt(2)*sin(0:pi/8:6*pi);
%        Y = awgn(X,10,0,S);
%
%   Example 5: 
%        % To specify the power of X to be 0 dBW, add noise to produce
%        % an SNR of 10dB, and produce reproducible results, use:
%        reset(RandStream.getGlobalStream)
%        X = sqrt(2)*sin(0:pi/8:6*pi);
%        Y = awgn(X,10,0);
%
%
%   See also comm.AWGNChannel, WGN, RANDN, RandStream/RANDN, and BSC.

%   Copyright 1996-2016 The MathWorks, Inc.

%#codegen

narginchk(2,5);

% Validate signal input
sig = varargin{1};
validateattributes(sig, {'numeric'}, ...
    {'2d', 'nonempty'}, 'awgn', 'signal input');

% Validate SNR input
reqSNR = varargin{2};
validateattributes(reqSNR, {'numeric'}, ...
    {'real','scalar','nonempty'}, 'awgn', 'SNR input');

% Validate signal power
if nargin >= 3
    if strcmpi(varargin{3}, 'measured')
       sigPower = sum(abs(sig(:)).^2)/length(sig(:)); % linear
    else
        validateattributes(varargin{3}, {'numeric'}, ...
            {'real','scalar','nonempty'}, 'awgn', 'signal power input');
        sigPower = varargin{3}; % linear or dB
    end
else
    sigPower = 1; % linear, default
end

% Validate state or power type
if nargin >= 4    
    coder.internal.errorIf(ischar(varargin{4}) && ...
        all(~strcmpi(varargin{4}, {'db','linear'})), ...
        'comm:awgn:InvalidPowerType');
    
    isStream = ~isempty(varargin{4}) && ~ischar(varargin{4});
    
    if isStream && ~isa(varargin{4}, 'RandStream') % Random stream seed
        validateattributes(varargin{4}, {'double'}, ...
            {'real','scalar','nonnegative','integer','<',2^32}, ...
            'awgn', 'seed input');
    end
else % Default
    isStream = false;
end

% Validate power type
if nargin == 5
    coder.internal.errorIf(ischar(varargin{4}), ... % Type has been specified as the 4th input
        'comm:awgn:InputAfterPowerType'); 
    coder.internal.errorIf(all(~strcmpi(varargin{5}, {'db','linear'})), ...
        'comm:awgn:InvalidPowerType'); 
end

isLinearScale = ((nargin == 4) && ~isStream && strcmpi(varargin{4}, 'linear')) || ...
    ((nargin == 5) && strcmpi(varargin{5}, 'linear'));

% Cross-validation
coder.internal.errorIf(isLinearScale && (sigPower < 0), ...
    'comm:awgn:InvalidSigPowerForLinearMode');

coder.internal.errorIf(isLinearScale && (reqSNR < 0), ...
    'comm:awgn:InvalidSNRForLinearMode');

if ~isLinearScale  % Convert signal power and SNR to linear scale
    if (nargin >= 3) && ~ischar(varargin{3}) % User-specified signal power
        sigPower = 10^(sigPower/10);
    end
    reqSNR = 10^(reqSNR/10);
end

noisePower = sigPower/reqSNR;

if isStream
    if isa(varargin{4}, 'RandStream')
        stream = varargin{4};
    elseif isempty(coder.target)
        stream = RandStream('shr3cong', 'Seed', varargin{4});
    else        
        stream = coder.internal.RandStream('shr3cong', 'Seed', varargin{4});
    end
    
    if ~isreal(sig)
        noise = sqrt(noisePower/2)* (randn(stream, size(sig)) + ...
                                  1i*randn(stream, size(sig)));
    else
        noise = sqrt(noisePower)* randn(stream, size(sig));
    end
else
    if ~isreal(sig)
        noise = sqrt(noisePower/2)* (randn(size(sig)) + 1i*randn(size(sig)));
    else
        noise = sqrt(noisePower)* randn(size(sig));
    end
end    

y = sig + noise; 


function Hd = band_pass
%BAND_PASS Returns a discrete-time filter object.
 
% MATLAB Code
 
% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.
 
% Generated by MATLAB(R) 9.0 and the Signal Processing Toolbox 7.2.
% Generated on: 18-Dec-2019 14:51:03
% All frequency values are in Hz.
Fs = 44100;  % Sampling Frequency
 
Fstop1 = 500;         % First Stopband Frequency
Fpass1 = 690;         % First Passband Frequency
Fpass2 = 1710;        % Second Passband Frequency
Fstop2 = 1800;        % Second Stopband Frequency
Astop1 = 20;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 30;          % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly
 
% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);
 
