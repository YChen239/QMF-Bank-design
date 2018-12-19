function x_hat=quantizer(x,num,a,b)

step=(b-a)/(num-1);
[m,n]=size(x);
x_code=[];
for i=1:m
    for j=1:n
%%quantization
        if a<=x(i,j)&&x(i,j)<=b
            x_code(i,j)=round(x(i,j)/step);
        end
        if x(i,j)<a
            x_code(i,j)=0;
        end
        if x(i,j)>b
            x_code(i,j)=num-1;
        end
    end 
end
%%dequantization

x_hat=x_code.*step;
end