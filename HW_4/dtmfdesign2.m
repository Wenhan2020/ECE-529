function hh = dtmfdesign(fcent, L, fs)
%DTMFDESIGN Returns a matrix (L by length(fcent)) where
% each column contains the impulse response of a BPF,
% one for each frequency in fcent.
% 
% usage: hh = dtmfdesign(fcent, L, fs)
%     fcent = vector of center frequencies
%         L = length of FIR bandpass filters
%        fs = sampling freq
%
% Each BPF must be scaled so that its frequency response has a
% maximum magnitude equal to one.

nn = 0:L-1;

% for each given frequency
for ii = 1:length(fcent)
    % simple band pass filter
     
    h=cos(2*pi*fcent(ii)*nn/fs);
    k=0;
    for w=0:pi/L:(pi-pi/L)
        k=k+1;
        H_t(k)=sum(h.*exp(-j*w*nn));
    end
    hu(ii,:) = H_t;

    % calculate vector of scaling coeffecients
    beta = 1/max(abs(H_t));
    k =0;
    for w=0:pi/L:(pi-pi/L)
        k=k+1;
        H(k)=sum(beta* h.*exp(-j*w*nn));
    end 

    % scale each filter to finish
    ha(ii,:) = H;
end

% put filters in columns
hh = ha';