%Matlab Program to Simulate Different Line Codes

clc
clear all
close all

bits=input('Enter the bits to be transmitted')

%NRZ Unipolar Format
carrier1=ones(1,100);
carrier2=zeros(1,100);

NRZ_Unipolar=[];%Start with an empty matrix

for i=1:length(bits)
   if bits(i)==1
      NRZ_Unipolar=[NRZ_Unipolar carrier1];
   else
      NRZ_Unipolar=[NRZ_Unipolar carrier2]; 
   end
end

%To plot NRZ Unipolar Signal
subplot(4,1,1)
plot(NRZ_Unipolar)
grid on
xlabel('Time')
ylabel('Amplitude')
title('NRZ Unipolar Signal')

%RZ Unipolar Format
carrier1=[ones(1,50), zeros(1,50)];
carrier2=zeros(1,100);

RZ_Unipolar=[];%Start with an empty matrix

for i=1:length(bits)
   if bits(i)==1
      RZ_Unipolar=[RZ_Unipolar carrier1];
   else
      RZ_Unipolar=[RZ_Unipolar carrier2]; 
   end
end

%To plot RZ Unipolar Signal
subplot(4,1,2)
plot(RZ_Unipolar)
grid on
xlabel('Time')
ylabel('Amplitude')
title('RZ Unipolar Signal')

%NRZ Polar Format
carrier1=ones(1,100);
carrier2=-ones(1,100);

NRZ_Polar=[];%Start with an empty matrix

for i=1:length(bits)
   if bits(i)==1
      NRZ_Polar=[NRZ_Polar carrier1];
   else
      NRZ_Polar=[NRZ_Polar carrier2]; 
   end
end

%To plot NRZ Unipolar Signal
subplot(4,1,3)
plot(NRZ_Polar)
grid on
xlabel('Time')
ylabel('Amplitude')
title('NRZ Polar Signal')


%RZ Polar Format
carrier1=[ones(1,50), zeros(1,50)];
carrier2=[-ones(1,50), zeros(1,50)];

RZ_Polar=[];%Start with an empty matrix

for i=1:length(bits)
   if bits(i)==1
      RZ_Polar=[RZ_Polar carrier1];
   else
      RZ_Polar=[RZ_Polar carrier2]; 
   end
end

%To plot RZ Polar Signal
subplot(4,1,4)
plot(RZ_Polar)
grid on
xlabel('Time')
ylabel('Amplitude')
title('RZ Polar Signal')

%To plot eye diagram
received_signal=NRZ_Polar+rand(1,length(NRZ_Polar))
eyediagram(received_signal,2)

