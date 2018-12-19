function Out=MyQMF(h0)

H0=fft(h0);
%generate H1
for i=1:length(H0)/2
    H1(i)=H0(length(H0)/2+i);
    H1(length(H0)/2+i)=H0(i);
end
h1=ifft(H1);
f0=h0;f1=-h1;

%Generate Input
%x=1:0.01:10;
Input=[];
for i=1:20
x=normrnd(0,1);
Input(i)=x;
end

%Convolution with h0 and h1
x0=conv(Input,h0);
x1=conv(Input,h1);

%downsample
v0=[];
v1=[];
for i=1:length(x0)
    if mod(i,2)==1
        v0=[v0,x0(i)];
        v1=[v1,x1(i)];
    end
end

%upsample
for i=1:length(v0)
    y0(2*i-1)=v0(i);
    y1(2*i-1)=v1(i);
end

Out=conv(y0,f0)+conv(y1,f1);
subplot(2,1,1)
plot(Input)
axis([1 20 -inf inf])
title('Input signal')
subplot(2,1,2)
plot(Out)
axis([40 59 -inf inf])
title('Output signal')
end