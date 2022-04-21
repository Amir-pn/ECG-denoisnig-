% MATLAB PROGRAM ecg2x60.m
clc
clear all               % clears all active variables
close all

% the ECG signal in the file is sampled at 200 Hz
ecg = load('ecg2x60.dat');
fs = 200; %sampling rate
slen = length(ecg);
t=[1:slen]/fs;
figure('name', 'Noisy signal');
plot(t, ecg, 'Linewidth', 2);
xlabel('Time in seconds');
ylabel('ECG');
axis tight;

% Tamrin 1 Notch filter

fs = 200; 
fo = 60; %frequence tadakholi
q = 35; %be soorate pish farz
%Wo=0.6 % noise dar 60 Hz
Wo = 2*pi*(fo/fs);
%r= 0.4;
notch_zeros=[exp(j*Wo) exp(-j*Wo)];
notch_poles=[r*exp(j*Wo) r*exp(-j*Wo)];
b= poly(notch_zeros);
a= poly(notch_poles);

nf=filter(b,a,ecg);
figure(2);
plot(t, nf, 'Linewidth', 2);
title('filter output');
fvtool(b,a);



