function varargout = medicalimg(varargin)
% MEDICALIMG M-file for medicalimg.fig
%      MEDICALIMG, by itself, creates a new MEDICALIMG or raises the existing
%      singleton*.
%
%      H = MEDICALIMG returns the handle to a new MEDICALIMG or the handle to
%      the existing singleton*.
%
%      MEDICALIMG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEDICALIMG.M with the given input arguments.
%
%      MEDICALIMG('Property','Value',...) creates a new MEDICALIMG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before medicalimg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to medicalimg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help medicalimg

% Last Modified by GUIDE v2.5 04-Mar-2015 11:00:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @medicalimg_OpeningFcn, ...
                   'gui_OutputFcn',  @medicalimg_OutputFcn, ...
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


% --- Executes just before medicalimg is made visible.
function medicalimg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to medicalimg (see VARARGIN)

% Choose default command line output for medicalimg
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes medicalimg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = medicalimg_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in "load image".
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
[fn pn] = uigetfile('*.jpg','Select a JPEG file');
complete = strcat(pn,fn);
set(handles.edit1,'string',complete);
loadedImg = imread(complete);
axes(handles.axes1);
imshow(loadedImg,[]);
handles.loadedImg=loadedImg;
guidata(hObject, handles);




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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
[FileName,PathName]=uiputfile('*jpg','Save Image');
Name = fullfile(FileName, PathName);
imwrite(handles.bw, Name, 'jpg');


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in chan-vese.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8

ChVs=handles.I;
I=rgb2gray(ChVs);
axes(handles.axes1);
imshow(I);
hold on
mask = roipoly;
contour(mask,'Color','b');
bw = activecontour(I, mask, 100, 'Chan-Vese');
contour(bw,'Color','r');
guidata(hObject, handles);


% --- Executes on button press in edge based
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9
Edge=handles.I;
I=rgb2gray(Edge);
axes(handles.axes1);
imshow(I);
hold on
mask = roipoly;
contour(mask,'Color','b');
bw = activecontour(I, mask, 100, 'edge');
contour(bw,'Color','r');
guidata(hObject, handles);


% --- Executes on button press in Salt and Pepper.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
I=handles.loadedImg;
SnPImg=imnoise(I,'salt & pepper');
axes(handles.axes1);
imshow(SnPImg,[]);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
handles.I=SnPImg;
guidata(hObject, handles);


% --- Executes on button press in Gaussian.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
I=handles.loadedImg;
GausImg=imnoise(I,'gaussian');
axes(handles.axes1);
imshow(GausImg,[]);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
handles.I=GausImg;
guidata(hObject, handles);

% --- Executes on button press in Speckle.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7
I=handles.loadedImg;
SpecImg=imnoise(I,'speckle');
axes(handles.axes1);
imshow(SpecImg,[]);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
handles.I=SpecImg;
guidata(hObject, handles);

% --- Executes on button press in Poisson.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
I=handles.loadedImg;
PoiImg=imnoise(I,'poisson');
axes(handles.axes1);
imshow(PoiImg,[]);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton7,'value',0);
handles.I=PoiImg;
guidata(hObject, handles);

% --- Executes on key press with focus on radiobutton4 and none of its controls.
function radiobutton4_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
