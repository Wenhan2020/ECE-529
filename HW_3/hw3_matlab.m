%% Problem 2
w = 0:0.01:2*pi;
z = exp(w.*j);
nominator = (z-1).*(z+1).*(z - 0.95 * exp(0.4*pi*j)).*(z - 0.95 * exp(-0.4*pi*j));
denominator = (z- 0.95 * exp(0.2*pi*j)).*(z - 0.95 * exp(-0.2*pi*j)).*(z - 0.95 * exp(0.8*pi*j)).*(z - 0.95*exp(-0.8*pi*j));
H_z = nominator./denominator;
H_abs = abs(H_z);
H_zr = real(H_z);
H_zi = imag(H_z);
Phase = atan(H_zr./H_zi);
%% Maganitude and Phase Response
figure
plot(w,H_abs);
xlabel('w');
ylabel('Amplitude');
title('Maganitude');
figure
plot(w,Phase);
xlabel('w');
ylabel('Phase');
title('Phase Response');

%% Problem 3
clear;
clc;
w = 0:0.01:2*pi;
z = exp(w.*j);
nominator = (z - exp(0.5*pi*j)).*(z - exp(-0.5*pi*j));
denominator = (z- 0.95 * exp(0.5*pi*j)).*(z - 1 * exp(-0.5*pi*j));
H_z = nominator./denominator;
H_abs = abs(H_z);
H_zr = real(H_z);
H_zi = imag(H_z);
Phase = atan(H_zr./H_zi);

%% Maganitude and Phase Response
figure
plot(w,H_abs);
xlabel('w');
ylabel('Amplitude');
title('Maganitude');
figure
plot(w,Phase);
xlabel('w');
ylabel('Phase');
title('Phase Response');

%% Problem 4
fc = 300;
fs = 1000;
[b,a] = butter(2,fc/(fs/2));
freqz(b,a)

%% Problem 5
%Impulse response
wc=0.2*pi;
L=51;
n=0:1:L;
h=1.25.*(cos(wc*n));
figure
subplot(311)
stem(n,h)
xlabel('n')
ylabel('h(n)')
title('impulse response h(n)')
%%
%Frequency response without builtin function
k=0;
for w=0:pi/500:pi
    k=k+1;
    H_t(k)=sum(h.*exp(-j*w*n));
end
w=0:pi/500:pi;
subplot(312)
plot(w/pi,abs(H_t),'m')
xlabel('w/pi')
ylabel('|H(w)|')
title('Magnitude response')
grid on;
subplot(313)
plot(w/pi,angle(H_t),'b')
xlabel('w/pi')
ylabel('<H(w)>')
title('Phase response')
grid on;
wc=round(0.44*pi/(pi/500));
disp('Gain at 0.44pi=')
Hc=abs(H_t(wc))
w1=round(0.3*pi/(pi/500));
disp('Gain at 0.3pi=')
H1=abs(H_t(w1))
w2=round(0.7*pi/(pi/500));
disp('Gain at 0.7pi=')
H2=abs(H_t(w2))


%%
clc;close all;clear all;
L=51;n=0:1:L;
wc=0.2*pi;
h=1.25.*(cos(wc*n));
w=0:pi/1000:pi;
H_t=freqz(h,1,w);
Hmax=max(abs(H_t));
Hmax = 1.1174;
wb=w(abs(H_t)>=0.707*Hmax);
figure;
subplot(211)
plot(w/pi,abs(H_t));title('Magnitude response');xlabel('w / pi');ylabel('|H|')
%To plot pass band
Hmax=max(abs(H_t));
wb=w(find(abs(H_t)>=0.707*Hmax));
Hb=(Hmax.*(w>=min(w) & w<wb(1)))+(0.707*Hmax.*(w>=wb(1) &w<=wb(end)))+(Hmax.*(w>wb(end) & w<=max(w)));
hold on;
plot(w/pi,Hb,'--k');
hold on;
%To plot stop band
Hs=0.25*max(abs(H_t));
ws=w(find(abs(H_t)<Hs));
ws1=ws(find(ws<wc));
ws2=ws(find(ws>wc));
Hss=(Hs.*(w>=min(ws1) & w<max(ws1)))+(Hs.*(w>=min(ws2) & w<max(ws2)));
hold on;
plot(w/pi,Hss,'--k');
hold off;
subplot(212)
plot(w/pi,angle(H_t));grid;title('Phase response');xlabel('w X pi');ylabel('<H>')

%% Problem 5 part a
clc;close all;clear all;
L=51;n=0:1:L;
wc=0.2*pi;
h=(cos(wc*n));
k=0;
for w=0:pi/1000:pi
    k=k+1;
    H_t(k)=sum(h.*exp(-j*w*n));
end
w=0:pi/1000:pi;
figure
subplot(211)
plot(w/pi,abs(H_t))
xlabel('w/pi')
ylabel('|H_t(w)|')
title('Magnitude response')
beta = 1/max(abs(H_t));
k =0;
for w=0:pi/1000:pi
    k=k+1;
    H(k)=sum(beta* h.*exp(-j*w*n));
end
w=0:pi/1000:pi;
%figure
%plot(w/pi,abs(H))
%xlabel('w/pi')
%ylabel('|H(w)|')
%title('Magnitude response')

%% Problem 5 part b
Hmax=max(abs(H));
wb=w(find(abs(H)>=0.707*Hmax));
H_bp=(Hmax.*(w>=min(w) & w<wb(1)))+(0.707*Hmax.*(w>=wb(1) &w<=wb(end)))+(Hmax.*(w>wb(end) & w<=max(w)));
subplot(212)
plot(w/pi,abs(H));title('Magnitude response');xlabel('w/pi');ylabel('|H(w)|')
hold on;
plot(w/pi,H_bp,'--k');
legend('Signal Response','Passband Signal')
%H_p = find(abs(H)>=0.707*Hmax);
%H_pp = H(find(abs(H)>=0.707*Hmax));
%plot(wb,abs(H(find(abs(H)>=0.707*Hmax))),'--k');

%% Problem 5 part c
figure
subplot(311)
stem(n,h)
xlabel('n')
ylabel('h(n)')
title('impulse response h(n)')
w=0:pi/1000:pi;
subplot(312)
plot(w/pi,abs(H),'m')
xlabel('w/pi')
ylabel('|H(w)|')
title('Magnitude response')
grid on;
subplot(313)
plot(w/pi,angle(H),'b')
xlabel('w/pi')
ylabel('<H(w)>')
title('Phase response')
%%
fs = 8000;
T = 1/fs;
ws = w*T;
L=51;n=0:1:L;
wcs= wc*T;
hs=(cos(wc*n));


