function varargout = UAS_PCD(varargin)
% UAS_PCD MATLAB code for UAS_PCD.fig
%      UAS_PCD, by itself, creates a new UAS_PCD or raises the existing
%      singleton*.
%
%      H = UAS_PCD returns the handle to a new UAS_PCD or the handle to
%      the existing singleton*.
%
%      UAS_PCD('CALLBAguCK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UAS_PCD.M with the given input arguments.
%
%      UAS_PCD('Property','Value',...) creates a new UAS_PCD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UAS_PCD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UAS_PCD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UAS_PCD

% Last Modified by GUIDE v2.5 07-Jun-2022 02:39:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UAS_PCD_OpeningFcn, ...
                   'gui_OutputFcn',  @UAS_PCD_OutputFcn, ...
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


% --- Executes just before UAS_PCD is made visible.
function UAS_PCD_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UAS_PCD (see VARARGIN)

% Choose default command line output for UAS_PCD
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UAS_PCD wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UAS_PCD_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in seacrh.
function seacrh_Callback(hObject, eventdata, handles)
% hObject    handle to seacrh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
global G;
[nama , alamat] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif'},'Browse Image');
I = imread([alamat,nama]);
handles.image=I; 
guidata(hObject, handles);
axes(handles.axes1);
imshow(I,[]);
G=I; 


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
global I;
citra=handles.image; 
axes(handles.axes2);
cla;
imshow(citra); 
axes(handles.axes4);
cla reset;
G=I;

% --- Executes on slider movement.
function Contrass_Callback(hObject, eventdata, handles)
% hObject    handle to Contrass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global G;
valueKon=get(handles.Contrass,'Value'); 
valueCe=get(handles.brightness,'Value'); 
set(handles.txtC,'String',valueKon); 
citra=handles.image; 
cerah=citra+valueCe; 
kontras=valueKon*cerah; 
G=kontras; 
axes(handles.axes2); 
guidata(hObject, handles); 
imshow(G,[]); 


% --- Executes during object creation, after setting all properties.
function Contrass_CreateFcn(hObject, ~, handles)
% hObject    handle to Contrass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function brightness_Callback(hObject, ~, handles)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global G;
valueK=get(handles.Contrass,'Value');
valueC=get(handles.brightness,'Value');
set(handles.txtB,'String',valueC);
citra=handles.image;
kontras=valueK*(citra+valueC); 
cerah=citra+valueC; 
G=cerah;
axes(handles.axes2);
guidata(hObject, handles);
imshow(G,[]);
axes(handles.axes4);
histogramRGB(G);

% --- Executes during object creation, after setting all properties.
function brightness_CreateFcn(hObject, ~, ~)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



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


function txtC_Callback(hObject, eventdata, handles)
% hObject    handle to txtC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtC as text
%        str2double(get(hObject,'String')) returns contents of txtC as a double


% --- Executes during object creation, after setting all properties.
function txtC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtB_Callback(~, eventdata, handles)
% hObject    handle to txtB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtB as text
%        str2double(get(hObject,'String')) returns contents of txtB as a double


% --- Executes during object creation, after setting all properties.
function txtB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtS_Callback(hObject, eventdata, handles)
% hObject    handle to txtS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS as text
%        str2double(get(hObject,'String')) returns contents of txtS as a double


% --- Executes during object creation, after setting all properties.
function txtS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in translasi1.
function translasi1_Callback(hObject, eventdata, handles)
% hObject    handle to translasi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;

[tinggi, lebar] = size(I);
  G = zeros(size(I));
  G = uint8(G);
  gx = str2num(get(handles.x,'string'));
  gy = str2num(get(handles.y,'string'));
  for y=1:tinggi
    for x=1:lebar
      if(y+gy >= 1) && (y+gy <= tinggi) && ...
        (x+gx >= 1) && (x+gx <= lebar)
        G(y+gy,x+gx) = I(y,x);
        end
    end
  end
axes(handles.axes2);
imshow(G);


function x_Callback(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x as text
%        str2double(get(hObject,'String')) returns contents of x as a double


% --- Executes during object creation, after setting all properties.
function x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_Callback(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y as text
%        str2double(get(hObject,'String')) returns contents of y as a double


% --- Executes during object creation, after setting all properties.
function y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in putarkiri.
function putarkiri_Callback(hObject, eventdata, handles)
% hObject    handle to putarkiri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p = handles.image;
r = rot90(p(:,:,1),1);
g = rot90(p(:,:,2),1);
b = rot90(p(:,:,3),1);
putar = cat(3,r,g,b);
handles.image = putar;
guidata(hObject, handles);
axes(handles.axes2);
imshow(putar);

% --- Executes on button press in putarkanan.
function putarkanan_Callback(hObject, eventdata, handles)
% hObject    handle to putarkanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p = handles.image;
r = rot90(p(:,:,1),3);
g = rot90(p(:,:,2),3);
b = rot90(p(:,:,3),3);
putar = cat(3,r,g,b);
handles.image = putar;
guidata(hObject, handles);
axes(handles.axes2);
imshow(putar);
