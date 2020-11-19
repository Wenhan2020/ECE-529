function sc = dtmfscore(xx, hh)
%DTMFSCORE Returns a score based on the max amplitude
% of the filtered output.
% 
% usage: sc = dtmfscore(xx, hh)
%        xx = input DTMF tone
%        hh = impulse response of ONE bandpass filter
%
% The signal detection is done by filtering xx with a length-L
% BPF, hh, and then finding the maximum amplitude of the output.
% The score is either 1 or 0.
%   sc = 1 if max(|y[n]|) is greater than, or equal to, 0.59
%   sc = 0 if max(|y[n]|) is less than 0.59
%

xx = xx*(2/max(abs(xx))); %--Scale the input x[n] to the range [-2,+2]
L=51;n=0:1:L;
wc=0.2*pi;
h=(cos(wc*n));
k=0;
for w=0:pi/1000:pi
    k=k+1;
    H_t(k)=sum(h.*exp(-j*w*n));
end

yy = conv(xx,hh); % find convolution to be scored

%scores 1 if yy is > .59, else scores 0
if max(yy(200:length(yy)-200)) >= .59
    sc = 1;
else
    sc = 0;
end