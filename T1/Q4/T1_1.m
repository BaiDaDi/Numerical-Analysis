% T1-Q4
% author：建筑智能化-陈凯（2213041002)
% Time:22/9/21
% Version:V2
%效果图：Q4.jpg
clc;clear;

k=1:1:20;
y=(1+1./(10.^k)).^(10.^k);
e=exp(1)-y;

plot(k,y,'-b','DisplayName','y');
hold on;
grid on;
plot(k,e,'-r','DisplayName','e');
hold off;
legend('limit','e*')
title('e*=[exp(1)-(1+1/n)^n]');
xlabel('k的取值');ylabel('误差&极限值');
saveas( 1, 'Q4.jpg');

