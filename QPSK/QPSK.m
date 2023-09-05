clc
clear all 
close all
 
bits=input('Enter the bits to be transmitted')
n=length(bits)

% QPSK
t=0:0.001:1-0.001;
c1=sin(2*pi*2*t); %To transmit 00, transmit sin(wt)
c2=cos(2*pi*2*t);%To transmit 01,transmit sin(wt+90)=cos(wt)
c3=-sin(2*pi*2*t);%To transmit 10,transmit sin(wt+180)=-sin(wt)
c4=-cos(2*pi*2*t);%To transmit 11,transmit sin(wt+270)=-cos(wt)

mod=[];
for i=1:2:n-1
    if(bits(i)==0 && bits(i+1)==0)%To transmit 00, transmit sin(wt)
        mod=[mod c1];
    elseif(bits(i)==0 && bits(i+1)==1)%To transmit 01,transmit sin(wt+90)=cos(wt)
        mod=[mod c2];
    elseif(bits(i)==1 && bits(i+1)==0)%To transmit 10,transmit sin(wt+180)=-sin(wt)
        mod=[mod c3];
    else%To transmit 11,transmit sin(wt+270)=-cos(wt)
        mod=[mod c4];
    end
end
plot(mod)
grid on
xlabel('time')
ylabel('amplitude')
title('QPSK Modulated Signal')

%demod
demod=[];
for i=1:n/2
    corr1=sum(mod(1+1000*(i-1):1000*i).*c1);%(1:1000), (1001:2000)
    corr2=sum(mod(1+1000*(i-1):1000*i).*c2);
    if (corr1>0.1 && corr2<0.1)
        demod=[demod 0 0];
     elseif(corr1<0.1 && corr2>0.1)
        demod=[demod 0 1];
     elseif(corr1<-0.1 && corr2>-0.1)
        demod=[demod 1 0];
     elseif(corr1>-0.1 && corr2<-0.1)
        demod=[demod 1 1];
    end
end
  demod  
  
        