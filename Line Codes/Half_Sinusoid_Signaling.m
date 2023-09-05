%Matlab Program to Simulate Half Sinusoid Line Code

clc
clear all
close all

bits=input('Enter the binary sequence')

%Half Sinusoid Carrier Signals
t=0:0.001:0.5;
carrier1=sin(2*pi*t);
carrier2=-sin(2*pi*t);

%To generate Half Sinusoid Signal
Half_Sinusoid=[];

for i=1:length(bits)
   if bits(i)==1
      Half_Sinusoid=[Half_Sinusoid carrier1];
   else
      Half_Sinusoid=[Half_Sinusoid carrier2]; 
   end
end

%To plot Half_Sinusoid
plot(Half_Sinusoid)
grid on
xlabel('Time')
ylabel('Amplitude')
title('Half Sinusoid Signaling Scheme')
