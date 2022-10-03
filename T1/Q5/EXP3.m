function add=EXP3(x)  %e^x

syms y a b; 
add=0;

if x<0
    for n=0:1:50000
        a=vpa(x^n,50);
        b=vpa(factorial(n),50);
        y=vpa(a/b,50);
        if(abs(y)>1e-6)
            add=add+y;
        else
            break    
        end
    end
else  
    for n=0:1:100000
            a=vpa(x^n,50);
            b=vpa(factorial(n),50);
            y=vpa(a/b,50);
            if(y>1e-6)
                add=add+y;
            else
            	break
            end
    end
end 


