function ans_ex=EXP1(x)%e^x的次数

    ans_ex=0;%存放结果

    for n=0:1:10000
        y=(x^n)/factorial(n);
        if(abs(y)>1e-10)
            ans_ex=ans_ex+y;
        end
    end
    
end 