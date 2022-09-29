% T1-Q5
% author：建筑智能化陈凯（2213041002)
% Time:22/9/21
% Version:V2
%效果图：test_e^-25.jpg;       Q5.jpg
%子函数：EXP(x);EXP1(x);EXP2(x);

clc;
clear;

%(1):为了让计算机不陷入死循环，控制计算时间，经过计算，
%     设置阈值1e-15，低于此精度的数据直接舍去不再计算

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%图1
%(2):测试多个x值，与MATLAB的exp(1)作比较求误差
%提前封装好计算函数EXP(X);
X=[-20,-15,-10,-5,-1,1,5,10,15,20];%X数组存放初始值
E=[];%E数组存放误差error
for(i=1:1:10)
    E(i)=exp(X(i))-EXP(X(i));
    subplot(2,2,1);
    plot(X(i),E(i),'o-r');
    plot(X(i),E(i),'*-r');
    title('e*=exp(1)-EXP(X(i))');
    xlabel('图1');
    hold on;
    grid on;
end
    hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%图2
%在-30<x<20多次取值，再看一次
X=[-30:1:20];
for(i=1:1:51)
    E(i)=exp(X(i))-EXP(X(i));
    subplot(2,2,2);
    plot(X(i),E(i),'.-r','DisplayName','E(i)');
    plot(X(i),exp(X(i)),'o-b','DisplayName','exp(X(i))');
    plot(X(i),EXP(X(i)),'*-g','DisplayName','EXP(X(i))');
    title('e*=exp(1)-EXP(X(i))');
    xlabel('图2:改错前/红:误差；蓝:e^x；绿:EXP(X)函数');
    hold on;
    grid on;
end
    hold off;


%(3):从图像2可以看到，x<-25以后，误差呈指数级增大，
%     对函数进行修改：从原理上分析，忽视了X<0的情况，阈值就错误了
%     同时必定发生了大数吃小数的问题，将求和函数
%     修改成EXP1，下面再看一组修改后函数EXP1的效果
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%图3
%在-30<x<20多次取值，看EXP1修改后效果
X=[-50:1:20];
for(i=1:1:71)
    E(i)=exp(X(i))-EXP1(X(i));
    subplot(2,2,3);
    plot(X(i),E(i),'.-r','DisplayName','E(i)');
%     plot(X(i),exp(X(i)),'o-b','DisplayName','exp(X(i))');
%     plot(X(i),EXP(X(i)),'*-g','DisplayName','EXP(X(i))');
    title('e*=exp(1)-EXP1(X(i))');
    xlabel('图3:改错后/红:误差');
    hold on;
    grid on;
end
    hold off;

%(4):从图像3可以看到，-25<x<0阶段误差结果较好，在x<-25时
%     误差呈指数波动，再次分析原因。打开test1文件查看
%     e^-25的级数各项数值:图片'test_e_25.jpg'
%考虑将相邻的正负数相加，同时，对级数中1e10以上的数值
%两两相加以避开MATLAB中16位超额截断的设置
%在此设计思路下，修改算法为EXP2(X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%图4
%查看点位细节，在此算法思路[EXP2]下
%e^(负数）达到了
% error(e^-47)=1096.38的精度！！！
%至于x<-50后产生的巨大误差，暂时还没有解决思路
%涉及到了MATLAB的计算机制：数据超过16位自动四舍五入
%观察test_e_25.jpg可以看到在级数的峰值上达到了1e10以上的大数
%在x<-50后产生的巨大误差正是由此引起的

X=[-50:1:20];
for(i=1:1:71)
    E(i)=exp(X(i))-EXP2(X(i));
    subplot(2,2,4);
    plot(X(i),E(i),'.-r');
    title('e*=exp(1)-EXP2(X(i))');
    xlabel('图4:修正后/红:误差；'); 
    hold on;
    grid on;
end
    hold off;
    
    
    
saveas( 1, 'Q5.jpg');