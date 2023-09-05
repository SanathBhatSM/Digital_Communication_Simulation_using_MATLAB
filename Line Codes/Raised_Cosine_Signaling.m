%Matlab Program to Simulate Raised Cosine Spectrum Signaling

clc
clear all
close all

t=-4:0.001:4;
alpha=0.1;
raised_cosine_signal=sinc(t).*cos(pi*alpha*t)./(1-4*alpha^2*t.*t);

bits=input('Enter bits to be transmitted')

transmitted_signal=[];
for i=1:length(bits)
   if bits(i)==1
       transmitted_signal=[transmitted_signal raised_cosine_signal];
   else
       transmitted_signal=[transmitted_signal -raised_cosine_signal];
   end    
end

plot(transmitted_signal)
grid on
xlabel('time')
ylabel('amplitude')
title('Raised Cosine Transmitted Signal')


