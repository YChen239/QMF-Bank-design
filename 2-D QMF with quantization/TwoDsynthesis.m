function out=TwoDsynthesis(f0,f1,v0,v1,v2,v3)
vl=synthesis(f0',f1',v0,v1,'column');
vr=synthesis(f0',f1',v2,v3,'column');
out=synthesis(f0,f1,vl,vr,'row');
[m,n]=size(out);
out=out(40:m-39,40:n-39);
end