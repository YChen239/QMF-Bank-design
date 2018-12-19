function erplot(b)
N=length(b);
H0=fft(b);
sqamp=abs(H0).^2;
for i=1:N/2
    Er(i)=20*log(sqamp(i)+sqamp(N/2+i));
end
n=0:N/2-1;
w=(2*pi.*n)./N;
plot(w,Er)
xlabel('w')
ylabel('|H0(w)|^2+|H1(w)|^2(dB)')
end