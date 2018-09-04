function varargout = edge_xiaobo(varargin)
% EDGE_XIAOBO M-file for edge_xiaobo.fig
%      EDGE_XIAOBO, by itself, creates a new EDGE_XIAOBO or raises the existing
%      singleton*.
%
%      H = EDGE_XIAOBO returns the handle to a new EDGE_XIAOBO or the handle to
%      the existing singleton*.
%
%      EDGE_XIAOBO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDGE_XIAOBO.M with the given input arguments.
%
%      EDGE_XIAOBO('Property','Value',...) creates a new EDGE_XIAOBO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before edge_xiaobo_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to edge_xiaobo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help edge_xiaobo

% Last Modified by GUIDE v2.5 02-Jul-2007 23:12:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @edge_xiaobo_OpeningFcn, ...
                   'gui_OutputFcn',  @edge_xiaobo_OutputFcn, ...
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


% --- Executes just before edge_xiaobo is made visible.
function edge_xiaobo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to edge_xiaobo (see VARARGIN)

% Choose default command line output for edge_xiaobo
handles.output = hObject;
% set(handles.text1,'string','基于小波原理的图像边缘检测: 曹海沨   200313021119 ');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes edge_xiaobo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = edge_xiaobo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
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



[FileName,PathName] = uigetfile({'*.jpg';'*.bmp';'*.gif'},'选择图片');
global infile
infile=strcat(PathName,FileName);
% disp(handles.infile);
guidata(hObject, handles);
set(handles.edit1,'String', infile);
global myfigure
myfigure=gcf;

% set(handles.text3,'string','版权所有: 刘颖 学号0600893      ');
% set(handles.text4,'string','版权所有: 刘颖 学号0600893      ');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% set(handles.text3,'string','版权所有: 刘颖 学号0600893      ');
% set(handles.text4,'string','版权所有: 刘颖 学号0600893      ');

global infile
global myfigure
pause(0.5);
% set(handles.text2,'string','程序正在运行,请稍等...');
% set(handles.text2,'string','程序正在运行,请稍等...');
pause(0.5);
xiaobo_edge(infile);
% set(handles.text2,'string','程序运行结束,可以保存结果...');

% set(handles.text3,'string','版权所有: 刘颖 学号0600893      ');
% set(handles.text4,'string','版权所有: 刘颖 学号0600893      ');

% close(h) 

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uiputfile({'*.bmp'},'保存结果');
outfile=strcat(PathName,FileName);
saveas(gcf, outfile,'bmp');
msgbox('保存完毕.....   ');


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

web www.matlabforums.cn -browser



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


