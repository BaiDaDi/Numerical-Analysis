function ans_ex=EXP(x)%e^x的次数

    ans_ex=0;%存放结果
    y=0;%中间变量

    for(n=0:1:10000)
        if(x^n/factorial(n)>1e-15)
            y=x^n/factorial(n);
            ans_ex=ans_ex+y;
        end
    end
end 