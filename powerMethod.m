function [vec,value]=power(start,A,toler)
%
%Power method for computing eigenvalues
%
dd=1;
x=start;
n=10;
i = 0
iter = 20
while dd> toler
    y=A*x;
    dd=abs(norm(x)-n);
    n=norm(x);
    x=y/n;
    while i < iter 
        plot(x, i)
    end
end
vec=x;
value=n;