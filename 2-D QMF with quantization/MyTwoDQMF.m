function out=MyTwoDQMF(h0,X)

H0=fft(h0);
%generate H1
for i=1:length(H0)/2
    H1(i)=H0(length(H0)/2+i);
    H1(length(H0)/2+i)=H0(i);
end
h1=ifft(H1);
f0=h0;f1=-h1;


[v0,v1,v2,v3]=TowDanalysis(h0,h1,X);
[v00,v01,v02,v03]=TowDanalysis(h0,h1,v0);
% [v000,v001,v002,v003]=TowDanalysis(h0,h1,v00);
% v00=TwoDsynthesis(f0,f1,v000,v001,v002,v003);


%%quantizer
v00=quantizer(v00,32,0.1,max(max(v00)));
v01=UniQuantizer(v01,4,-0.05,0.05);
v02=UniQuantizer(v02,4,-0.05,0.05);
v03=UniQuantizer(v03,4,-0.02,0.02);
v1=UniQuantizer(v1,4,-0.03,0.03);
v2=UniQuantizer(v2,4,-0.025,0.025);
v3=UniQuantizer(v3,2,-0.009,0.009);



v0=TwoDsynthesis(f0,f1,v00,v01,v02,v03);
out=TwoDsynthesis(f0,f1,v0,v1,v2,v3);

end