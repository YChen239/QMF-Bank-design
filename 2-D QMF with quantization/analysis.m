function [v0,v1]=analysis(h0,h1,x,op)
%Convolution with h0 and h1
x0=conv2(x,h0);
x1=conv2(x,h1);



%downsample
switch op
    case 'row'
    [m,n]=size(x0);
    v0=zeros(m,1);
    v1=zeros(m,1);
    for i=1:m
    for j=1:n
        if mod(j,2)==1
            v0(i,(j+1)/2)=x0(i,j);
            v1(i,(j+1)/2)=x1(i,j);
        end
    end
    end
    case 'column'
    [m,n]=size(x0);
    v0=zeros(1,n);
    v1=zeros(1,n);
    for i=1:n
    for j=1:m
        if mod(j,2)==1
            v0((j+1)/2,i)=x0(j,i);
            v1((j+1)/2,i)=x1(j,i);
        end
    end
    end
end

end