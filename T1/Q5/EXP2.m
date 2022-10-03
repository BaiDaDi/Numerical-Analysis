function ans_ex=EXP2(x)%e^x的次数

    ans_ex=0;%存放结果

    for n=0:1:10000
        if(abs(x^n/factorial(n))>1e-6)
            y=(x^n)/factorial(n);
            ans_ex=ans_ex+y;
        end
    end
end 