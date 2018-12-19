function [E,Er,Es]=erro(X)
N=length(X);
H0=fft(X);
sqamp=abs(H0).^2;
Er=0;
Es=0;
for i=1:N/4+1
    Er=Er+(sqamp(i)+sqamp(N/2+i)-1)^2;
    Es=Es+sqamp(N/4+i);
end
Er=2*Er;
E=0.7*Er+0.3*Es;
end