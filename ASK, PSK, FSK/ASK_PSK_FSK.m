%Matlab program to simulate ASK, PSK, FSK

clc %clear command window
close all %close all the graphs
clear all %clear all variables

%Ask user to enter bits to be transmitted
bits=input('Enter the bits to be transmitted')
n=length(bits)%this will give us number of bits

%Lets simulate NRZ Polar signal
nrz_polar=[]%lets create an empty matrix

for i=1:n
    if(bits(i)==1) 
        nrz_polar=[nrz_polar ones(1,100)]
    else
        nrz_polar=[nrz_polar -ones(1,100)]
    end
end
subplot(4,1,1)%Create 4 rows and 1 column and select 1st position
plot(nrz_polar)
grid on
xlabel('time')
ylabel('amplitude')
title('NRZ Polar Signal')

%To simulate Carrier Signal
t=0:0.001:1
carrier1=sin(2*pi*2*t)
carrier2=sin(2*pi*4*t)

%To simulate ASK Modulated Signal
ASK_Mod_Sig=[]%lets create an empty matrix
for(i=1:n)
    if(bits(i)==1)
        ASK_Mod_Sig=[ASK_Mod_Sig carrier1]
    else
        ASK_Mod_Sig=[ASK_Mod_Sig 0*carrier1]
    end
end
 
subplot(4,1,2)%Create 4 rows and 1 column and select 2nd position
plot(ASK_Mod_Sig)
grid on
xlabel('time')
ylabel('amplitude')
title('ASK Modulated Signal')

%To simulate PSK Modulated Signal
PSK_Mod_Sig=[]%lets create an empty matrix
for(i=1:n)
    if(bits(i)==1)
        PSK_Mod_Sig=[PSK_Mod_Sig carrier1]
    else
        PSK_Mod_Sig=[PSK_Mod_Sig -carrier1]
    end
end
 
subplot(4,1,3)%Create 4 rows and 1 column and select 3rd position
plot(PSK_Mod_Sig)
grid on
xlabel('time')
ylabel('amplitude')
title('PSK Modulated Signal')

% To simulate FSK Modulated Signal
FSK_Mod_Sig=[]%lets create an empty matrix
for(i=1:n)
    if(bits(i)==1)
        FSK_Mod_Sig=[FSK_Mod_Sig carrier2]
    else
        FSK_Mod_Sig=[FSK_Mod_Sig carrier1]
    end
end
 
subplot(4,1,4)%Create 4 rows and 1 column and select 4th position
plot(FSK_Mod_Sig)
grid on
xlabel('time')
ylabel('amplitude')
title('FSK Modulated Signal')

%Probability of Error for ASK,PSK,FSK
Eb_by_No=0:0.001:5;
PE_ASK=qfunc(sqrt(Eb_by_No/2));
PE_PSK=qfunc(sqrt(2*Eb_by_No));
PE_FSK=qfunc(sqrt(Eb_by_No));

figure
plot(Eb_by_No,PE_ASK)
grid on
xlabel('Eb/No')
ylabel('Probability of Error')
title('Probability of Error')
hold on
plot(Eb_by_No,PE_PSK)
hold on
plot(Eb_by_No,PE_FSK)

legend('PE for ASK','PE for PSK', 'PE for FSK')
 