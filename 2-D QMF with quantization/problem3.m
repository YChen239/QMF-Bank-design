 window=hann(40);
 b=fir1(39,0.5,window);

%b=MyHann(40);
[E0,Er0,Es0]=erro(b);
N=length(b);
[iters, endpt] = hooke(N, b, 0.5, 1e-6, 500);
[E,Er,Es]=erro(endpt);

I0 = rgb2gray(imread('lina.jpg'));
I = im2double(I0);
Out=im2uint8(MyTwoDQMF(b,I));
ESM=mean(mean((I0-Out).^2));
figure(1);imshow(I0)
figure(2);imshow(Out)

