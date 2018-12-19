function out=UniQuantizer(x,num,a,b)
[m,n]=size(x);
step=4/(num-1);
for i=1:m
    for j=1:n
        if x(i,j)<a
            x_code(i,j)=0;
        end
        if x(i,j)>b
            x_code(i,j)=num-1;
        end
        if a<=x(i,j)&&x(i,j)<=b
            x(i,j)=(x(i,j)/b)*2.5;
            x_map(i,j)=atan(x(i,j))+2.5;
            x_code(i,j)=round(x_map(i,j)/step);
        end
    end
end
x_decode=(x_code.*step-2.5)./2.5;
out=tan(x_decode).*b;
end