pkg load statistics

clc;
clear all;
close all;

#TASK A
t=exprnd(0.2, 1,100);
N_t=0:1:100;
x(1)=0; 
for i = 2:101 
 new_t = t(i-1);
 x(i) = x(i-1) + new_t ;
endfor
figure(1);
stairs( x , N_t );
#axis("auto[xN_t]");
title("Counting process");
xlabel("t values");
ylabel("N(t)");
#TASK B 
t=exprnd(0.2, 1,200); 
s=sum(t);
display(s/200 ); # average of events
t=exprnd(0.2, 1,300);
s=sum(t);
display(s/300 ); # mean_exp , average of events
t=exprnd(0.2, 1,500);
s=sum(t);
display(s/500 ); # average of events
t=exprnd(0.2, 1,1000);
s=sum(t);
display(s/1000 ); # average of events
t=exprnd(0.2, 1,10000);
s=sum(t);
display(s/10000); # average of events
#On Command Window all the calculated values are displayed