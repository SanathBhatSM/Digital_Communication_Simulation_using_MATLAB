%Matlab code for Differential Phase Shift Keying (DPSK)
%Sequence of operations: 
%1)Differential Encoding (dk) (At Transmitting End)
%2)Phase Shift Keying Modulation(At Transmitting End)
%3)Phase Shift Keying Demodulation(At Receiving End)
%4)Differential Decoding(At Receiving End)
clc
clear all
close all

%Binary PSK has the least probability of Error
%But, it does not have immunity to polarity inversion
%Therefore, we combine differential encoding with PSK
%This will result in DPSK

%Differential Encoding
%Example Problem
%Original Bits,   bk=      1    0    1    1    0    1
%Encoded Bits, dk= 1    0    0    1    0    0    1
%dk=   dk-1 XOR  bk

bk=input('Enter the bits to be transmitted')
n=length(bk)

dk(1)=1 %This is arbitrarily chosen
%dk(2)=dk(1) XOR bk(1)
%dk(3)=dk(2) XOR bk(2)
%dk(4)=dk(3) XOR bk(3)

for i=2:n+1
dk(i)=xor(dk(i-1),bk(i-1));
end
disp('Differntially Encoded Bits Are')
dk %To display encoded bits

%To simulate PSK Modulated Signal

%To simulate Carrier Signal
t=0:0.001:1-0.001;%There will be 1000 values in t
carrier1=sin(2*pi*1*t);

PSK_Mod_Sig=[]%lets create an empty matrix
for(i=1:n+1)
    if(dk(i)==1)
        PSK_Mod_Sig=[PSK_Mod_Sig carrier1]
    else
        PSK_Mod_Sig=[PSK_Mod_Sig -carrier1]
    end
end
 
plot(PSK_Mod_Sig)
grid on
xlabel('time')
ylabel('amplitude')
title('DPSK Modulated Signal')

%To demodulate PSK
dk=[]; %start with an empty matrix to store demod bits
for i=0:n %n is the number of bits
    correlator_op=sum(PSK_Mod_Sig(length(t)*i+1:length(t)*(i+1)).*carrier1)
        if(correlator_op>0)
            dk=[dk 1];
        else
            dk=[dk 0];
        end
end 
 dk %To display dk
% 
% %Differntial Decoding Assuming Bits are received correctly
% %Received bits, dk=1    0    0    1    0    0    1
% %Decoded Bits, bk=      1    0    1    1    0    1
% 
% %Differntial Decoding Assuming Bits are Inverted
% %Received bits, dk=0    1    1    0    1    1    0
% %Decoded Bits, bk=      1    0     1    1    0    1
% %bk=dk XOR dk-1
% 
% %bk(1)=dk(1) XOR dk(2)
% %bk(2)=dk(2) XOR dk(3)
% %bk(3)=dk(3) XOR dk(4)

for i=1:n
    bk(i)=xor(dk(i),dk(i+1)); 
end
disp('Decoded Bits Are')
bk %To display bk







