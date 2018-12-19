function h0=MyHann(N)
n=0:N-1;
h=1/2*(1-cos((2*pi.*n)/(N-1)));
ih=sin(0.5*pi.*(n-N/2))./(pi.*(n-N/2));
ih(N/2+1)=0.5;
h0=h.*ih;
end