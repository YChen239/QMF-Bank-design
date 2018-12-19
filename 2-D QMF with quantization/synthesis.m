function out=synthesis(f0,f1,v0,v1,op)
%upsample
[m,n]=size(v0);

switch op
    case 'row'
        for i=1:m
        for j=1:n
            y0(i,2*j-1)=v0(i,j);
            y1(i,2*j-1)=v1(i,j);     
        end
        end
    
    case 'column'
        for i=1:n
        for j=1:m
            y0(2*j-1,i)=v0(j,i);
            y1(2*j-1,i)=v1(j,i);     
        end
        end
end

out=2.*(conv2(y0,f0)+conv2(y1,f1));
end
