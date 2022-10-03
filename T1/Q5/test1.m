clc;clear;close all;
syms y1 a b add Q W E;
y1=0;%中间变量
Q=0;W=1;
x=-25;

    for n=0:1:200
        y=(x^n)/factorial(n);
        if(abs(y)>1e-6)
            
            plot(n,y,'.-b');
            hold on;  
            title(['e^',num2str(x),' 每一项级数的值']);
            xlabel('蓝色是大于1e-6的数，红色是小于1e-6的数');
        else
            plot(n,y,'.-r');
            hold on;  
            title(['e^',num2str(x),' 每一项级数的值']);
            xlabel('蓝色是大于1e-6的数，红色是小于1e-6的数');
        end
    end
    saveas( 1, 'test_e^-25.jpg');