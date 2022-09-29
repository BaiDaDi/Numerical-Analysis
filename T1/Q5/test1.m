clc;clear;
y1=0;%中间变量

x=-50;
    for(n=0:1:1000)
        if(abs((x)^n/factorial(n))>=1)
            y1=x^n/factorial(n);
            plot(n,y1,'-*b');
            hold on;
            title('e^-25每一项级数的值');
        else
            y2=x^n/factorial(n);
            plot(n,y2,'-*r');
            hold on;
            title('e^-25每一项级数的值');
        end 
        xlabel('蓝色是大数，红色是小数');
    end
%    saveas( 1, 'test_e_25.jpg');