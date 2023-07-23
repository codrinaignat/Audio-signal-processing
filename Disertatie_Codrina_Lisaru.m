function varargout = Disertatie_Codrina_Lisaru(varargin)

% Last Modified by GUIDE v2.5 26-Mar-2023 16:20:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Disertatie_Codrina_Lisaru_OpeningFcn, ...
    'gui_OutputFcn',  @Disertatie_Codrina_Lisaru_OutputFcn, ...
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


function Disertatie_Codrina_Lisaru_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% create an axes that spans the whole gui      
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('music_notes.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');

% Update handles structure
guidata(hObject, handles);

function varargout = Disertatie_Codrina_Lisaru_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


function popupmenu1_Callback(hObject, eventdata, handles)
semnal_audio(handles)

function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton1_Callback(hObject, eventdata, handles)
semnal_audio(handles)

function pushbutton2_Callback(hObject, eventdata, handles)
semnal_audio(handles)

function pushbutton3_Callback(hObject, eventdata, handles)
semnal_audio(handles)

function pushbutton4_Callback(hObject, eventdata, handles)
semnal_audio(handles)

function pushbutton6_Callback(hObject, eventdata, handles)
global Var5
semnal_audio(handles)

function pushbutton5_Callback(hObject, eventdata, handles)
global Var4
semnal_audio(handles)

function edit6_Callback(hObject, eventdata, handles)
semnal_audio(handles)

function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
semnal_audio(handles)

function edit5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
semnal_audio(handles)

function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu2_Callback(hObject, eventdata, handles)

semnal_audio(handles)

function popupmenu2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton7_Callback(hObject, eventdata, handles)
AppInfo();

function edit7_Callback(hObject, eventdata, handles)
semnal_audio(handles)

function edit7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
semnal_audio(handles)

function edit8_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton8_Callback(hObject, eventdata, handles)
global Var1

semnal_audio(handles)

function pushbutton9_Callback(hObject, eventdata, handles)
global Var2

semnal_audio(handles)

function pushbutton10_Callback(hObject, eventdata, handles)
global Var3

semnal_audio(handles)

function pushbutton11_Callback(hObject, eventdata, handles)
global Var6
semnal_audio(handles)

function text2_CreateFcn(hObject, eventdata, handles)

function axes1_CreateFcn(hObject, eventdata, handles)

function edit9_Callback(hObject, eventdata, handles)
semnal_audio(handles)

function edit9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton14_Callback(hObject, eventdata, handles)
global Var5
semnal_audio(handles)


function pushbutton17_Callback(hObject, eventdata, handles)
global Var7
semnal_audio(handles)



function semnal_audio(handles)
global Sunet
global Sound
global Fs
global y1
global y2
global y3
global y4

Var1 = get(handles.pushbutton8, 'Value');

if Var1 == 1
    [nume, cale] = uigetfile('*.wav', 'Select a wave file');
    [Sunet, Fs] = audioread(strcat(cale, nume));
    Sound = Sunet(:, 1);
end


Var2 = get(handles.pushbutton9, 'Value');
if Var2 == 1
    soundsc(Sound, Fs)
end

Var3 = get(handles.pushbutton10, 'Value');
if Var3 == 1
    axaFFT=linspace(-Fs/2, Fs/2, length(Sound));
    X=fftshift(abs(fft(Sound)));
    axes(handles.axes1);
    plot(axaFFT,X);
    title('Spectrul semnalului audio original');
    xlabel('f');
    zoom on
    durata_S=(length(Sound)-1)/Fs;
    t_S=0:1/Fs:durata_S;
    axes(handles.axes3);
    plot(t_S, Sound);
    title('Semnal audio cu zgomot, in timp');
    xlabel('t');
    zoom on
end

Filtru = get(handles.popupmenu2, 'Value');
Var4 = get(handles.pushbutton5, 'Value');
Var5 = get(handles.pushbutton14, 'Value');
Var6 = get(handles.pushbutton11, 'Value');
Var7 = get(handles.pushbutton17, 'Value');

if Var4 == 1
    
    switch Filtru
        case 1
            %implementare FTJ
            Ft=str2double(get(handles.edit7, 'String'));
            N=8000; %ordinul filtrului
            h=zeros(1,N);
            %calcul coeficienti
            for n=-(N-1)/2 : (N-1)/2
                h(n+(N-1)/2 +1)=h(n+(N-1)/2+1)+(2*Ft/Fs)*sinc(2*n*Ft/Fs);
            end
            %caracteristica ideala
            H_ideal(-Fs/2+Fs/2+1:-Ft+Fs/2+1) = 0;
            H_ideal(-Ft+Fs/2+1:Ft+Fs/2+1) = 1;
            H_ideal(Ft+Fs/2+1:Fs/2+Fs/2+1) = 0;
            %caracteristica de amplitudine (reala) a filtrului
            axaFFT1_real=linspace(-Fs/2, Fs/2, length(h));
            H1_real=fftshift(abs(fft(h)));
            %filtrare semnnal si spectrul semnalului filtrat
            y1=conv(Sound,h);
            durata_y1=(length(y1)-1)/Fs;
            t_y1=0:1/Fs:durata_y1;
            axaFFT1_S=linspace(-Fs/2, Fs/2, length(y1));
            Y1=fftshift(abs(fft(y1)));
            axes(handles.axes2);
            plot(axaFFT1_S, Y1);
            title('Spectrul semnalului filtrat');
            xlabel('f');
            zoom on
         
            axes(handles.axes4);
            plot(t_y1, y1);
            title('Semnal audio filtrat, in timp');
            xlabel('t');
            zoom on
    
            axes(handles.axes6);
            hold on
            cla
            plot(axaFFT1_real,H1_real,'r');
            plot(linspace(-Fs/2, Fs/2, length(H_ideal)), H_ideal,'b');
            title('Caracteristica ideala si reala a filtrului curent');
            hold off
     
        case 2
            %implementare FTS
            
            Ft=str2double(get(handles.edit7, 'String'));
            N=8000; %ordinul filtrului
            h=zeros(1,N);
            %calcul coeficienti
            for n=-(N-1)/2 : (N-1)/2
                h(n+(N-1)/2 +1)=h(n+(N-1)/2+1)+sinc(n)-(2*Ft/Fs)*sinc(n*2*Ft/Fs);
            end
            %caracteristica ideala
            H_ideal(-Fs/2+Fs/2+1:-Ft+Fs/2+1) = 1;
            H_ideal(-Ft+Fs/2+1:Ft+Fs/2+1) = 0;
            H_ideal(Ft+Fs/2+1:Fs/2+Fs/2+1) = 1;
            %caracteristica de amplitudine (reala) a filtrului
            axaFFT2_real=linspace(-Fs/2, Fs/2, length(h));
            H2_real=fftshift(abs(fft(h)));
            %filtrare semnnal si spectrul semnalului filtrat
            y2=conv(Sound,h);
            durata_y2=(length(y2)-1)/Fs;
            t_y2=0:1/Fs:durata_y2;
            axaFFT2_S=linspace(-Fs/2, Fs/2, length(y2));
            Y2=fftshift(abs(fft(y2)));
            axes(handles.axes2);
            plot(axaFFT2_S, Y2);
            title('Spectrul semnalului filtrat');
            xlabel('f');
            zoom on
   
            axes(handles.axes4);
            plot(t_y2, y2);
            title('Semnal audio filtrat, in timp');
            xlabel('t');
            zoom on

            axes(handles.axes6);
            hold on
            cla
            plot(axaFFT2_real,H2_real,'r');
            plot(linspace(-Fs/2, Fs/2, length(H_ideal)), H_ideal,'b');
            title('Caracteristica ideala si reala a filtrului curent');
            hold off
   
        case 3
            %implementare FTB
            Ft1=str2double(get(handles.edit5, 'String'));
            Ft2=str2double(get(handles.edit8, 'String'));
            N=8000; %ordinul filtrului
            h=zeros(1,N);
            %calcul coeficienti
            for n=-(N-1)/2 : (N-1)/2
                h(n+(N-1)/2 +1)=h(n+(N-1)/2+1)+(2*Ft2/Fs)*sinc(2*n*Ft2/Fs)-(2*Ft1/Fs)*sinc(2*n*Ft1/Fs);
            end
            %caracteristica ideala
            H_ideal(-Fs/2+Fs/2+1:-Ft1+Fs/2+1) = 0;
            H_ideal(-Ft2+Fs/2+1:-Ft1+Fs/2+1) = 1;
            H_ideal(-Ft1+Fs/2+1:Ft1+Fs/2+1) = 0;
            H_ideal(Ft1+Fs/2+1:Ft2+Fs/2+1) = 1;
            H_ideal(Ft2+Fs/2+1:Fs/2+Fs/2+1) = 0;
            
            %caracteristica de amplitudine (reala) a filtrului
            axaFFT3_real=linspace(-Fs/2, Fs/2, length(h));
            H3_real=fftshift(abs(fft(h)));
            %filtrare semnnal si spectrul semnalului filtrat
            y3=conv(Sound,h);
            durata_y3=(length(y3)-1)/Fs;
            t_y3=0:1/Fs:durata_y3;
            axaFFT3_S=linspace(-Fs/2, Fs/2, length(y3));
            Y3=fftshift(abs(fft(y3)));
            axes(handles.axes2);
            plot(axaFFT3_S, Y3);
            title('Spectrul semnalului filtrat');
            xlabel('f');
            zoom on
  
            axes(handles.axes4);
            plot(t_y3, y3);
            title('Semnal audio filtrat, in timp');
            xlabel('t');
            zoom on
 
            axes(handles.axes6);
            hold on
            cla
            plot(axaFFT3_real,H3_real,'r');
            plot(linspace(-Fs/2, Fs/2, length(H_ideal)), H_ideal,'b');
            title('Caracteristica ideala si reala a filtrului curent');
            hold off

        case 4
            %implementare FOB
            Ft1=str2double(get(handles.edit5, 'String'));
            Ft2=str2double(get(handles.edit8, 'String'));
            N=8000; %ordinul filtrului
            h=zeros(1,N);
            %calcul coeficienti
            for n=-(N-1)/2 : (N-1)/2
                h(n+(N-1)/2 +1)=h(n+(N-1)/2+1)+sinc(n)-(2*Ft2/Fs)*sinc(2*n*Ft2/Fs)+(2*Ft1/Fs)*sinc(2*n*Ft1/Fs);
            end
            %caracteristica ideala
            H_ideal(-Fs/2+Fs/2+1:-Ft1+Fs/2+1) = 1;
            H_ideal(-Ft2+Fs/2+1:-Ft1+Fs/2+1) = 0;
            H_ideal(-Ft1+Fs/2+1:Ft1+Fs/2+1) = 1;
            H_ideal(Ft1+Fs/2+1:Ft2+Fs/2+1) = 0;
            H_ideal(Ft2+Fs/2+1:Fs/2+Fs/2+1) = 1;
            %caracteristica de amplitudine (reala) a filtrului
            axaFFT4_real=linspace(-Fs/2, Fs/2, length(h));
            H4_real=fftshift(abs(fft(h)));
            %filtrare semnnal si spectrul semnalului filtrat
            y4=conv(Sound,h);
            durata_y4=(length(y4)-1)/Fs;
            t_y4=0:1/Fs:durata_y4;
            axaFFT4_S=linspace(-Fs/2, Fs/2, length(y4));
            Y4=fftshift(abs(fft(y4)));
            axes(handles.axes2);
            plot(axaFFT4_S, Y4);
            title('Spectrul semnalului filtrat');
            xlabel('f');
            zoom on
    
            axes(handles.axes4);
            plot(t_y4, y4);
            title('Semnal audio filtrat, in timp');
            xlabel('t');
            zoom on
  
            axes(handles.axes6);
            hold on
            cla
            plot(axaFFT4_real,H4_real,'r');
            plot(linspace(-Fs/2, Fs/2, length(H_ideal)), H_ideal,'b');
            title('Caracteristica ideala si reala a filtrului curent');
            hold off
    end
end
    
    
    if Var5 == 1
        switch Filtru
            case 1
                soundsc(y1, Fs);
            case 2
                soundsc(y2, Fs);
            case 3
                soundsc(y3, Fs);
            case 4
                soundsc(y4, Fs);
        end
    end
    
    if Var6 == 1
         switch Filtru
             case 1
                 audiowrite('FTJ_sound.wav', y1, Fs);
             case 2
                 audiowrite('FTS_sound.wav', y2, Fs);
             case 3
                 audiowrite('FTB_sound.wav', y3, Fs);
             case 4
                 audiowrite('FOB_sound.wav', y4, Fs);
         end
    end
    
    if Var7 == 1
        clear sound
    end
            
