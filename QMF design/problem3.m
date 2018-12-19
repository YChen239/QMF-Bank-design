 window=hann(40);
 b=fir1(39,0.5,window);

%b=MyHann(40);
[E0,Er0,Es0]=erro(b);
N=length(b);
[iters, endpt] = hooke(N, b, 0.5, 1e-6, 500);
[E,Er,Es]=erro(endpt);

I = imread('lina.jpg');
Out=MyQMF(b);

%h0=[0.48998,0.69428e-1,0.70652e-1,0.93872e-2,0.93872e-2,0.70652e-1,0.69428e-1,0.48998];

