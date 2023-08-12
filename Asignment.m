clearvars;
clc;
close all;

%% Root locus 1+kG(s)H(s)=0
% G(s)H(s)=1/(s+1)(s+2)(s+3)=1/(6 + 11 s + 6 s^2 + s^3)
% s = solve(1+k*GH,s)
%% Code for responses while varying k

figure('Position',[1,1,1200,585])
set(gcf,'color','w');
title('$G(s)H(s) = \frac{1}{(s+1)(s+2)(s+3)}$','interpreter','latex','FontSize',16)

subplot(1,2,1);
hold on
grid on
xlabel('$\Re$','interpreter','latex','FontSize',16)
ylabel('$\Im$','interpreter','latex','FontSize',16)
xline(0,'k--')
yline(0,'k--')
plot(-1,0,'rx','LineWidth',4) % 1st pole 
plot(-2,0,'rx','LineWidth',4) % 2nd pole
plot(-3,0,'rx','LineWidth',4) % 3th pole
axis([-10 4 -6 6]) 

subplot(1,2,2);
hold on
grid on
xlabel('$t$','interpreter','latex','FontSize',16)
ylabel('$y$','interpreter','latex','FontSize',16)

pause(1)        
for k=0:0.5:61
    r = roots([1 6 11 k+6]); %Plot the roots of the characteristic polynomial varying k
    subplot(1,2,1); 
    plot(real(r),imag(r),'b.','LineWidth',2)
    
    gain = num2str(k);    
    kval = strcat('K= ',gain); 
    leg = text(-2,1,kval,'HorizontalAlignment','right','FontSize', 16);
    
    subplot(1,2,2);
    sys=tf(1,[1 6 11 k+6]);
    [y,tOut] = step(sys,10);
    plot(tOut,y,'k');

    pause(0.1)  
    delete(leg)   
end
%% MATLAB root locus
figure(2)
rlocus(1,[1 6 11 6])
