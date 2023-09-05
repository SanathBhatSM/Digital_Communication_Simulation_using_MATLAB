%PCM stands for Pulse Code Modulation
%PCM is a technique of A2D conversion
%The steps involved are - sampling, quantizing, encoding

clc
clear all
close all

%original analog signal
t=0:0.0001:0.1;
x1=2*sin(2*pi*10*t);
subplot(3,1,1)
plot(x1)
grid on
xlabel('time')
ylabel('amplitude')
title('original analog signal')

%sampling
fs=100; %sampling frequency : per second 100 samples will be taken
ts=1/fs; %sampling duration 
t=0:ts:0.1;
x2=2*sin(2*pi*10*t); %sampled version of the original analog signal

subplot(3,1,2)
stem(x2)
grid on
xlabel('time')
ylabel('amplitude')
title('sampled version of original analog signal')

%quantization process
n=8 ; %each quantized value will be represented with 8 bits
L=2^n; %number of levels
vmax=2; %max amplitude
vmin=-2; %min amplitude
step_size=(vmax-vmin)/L; %step size of the quantizer
codebook=vmin:step_size:vmax ; 
partition=vmin+step_size/2:step_size:vmax-step_size/2;
index = quantiz(x2, partition)

%encoding
encoded_bits=dec2bin(index)

%decoding at the receiving end
decoded_index=bin2dec(encoded_bits)

%getting back original sample values
reconstructed_samples=[];

for i=1:length(x2)
    reconstructed_samples=[reconstructed_samples partition(decoded_index(i))]
end

subplot(3,1,3)
plot(reconstructed_samples)
grid on
xlabel('time')
ylabel('amplitude')
title('reconstructed signal at the receiving end')