pkg load statistics

clc;
clear all;
close all;

#TASK 2.A
# TASK: In a common diagram, design the Probability Mass Function of Exp processes
# with lambda parameters 0.5, 1, 3. 
#In the horizontal axes, choose k between 0 and 8. 
k = 0:0.0001:8; # array from 0 to 8 with step 0.00001 
lambda = [0.5,1,3]; #array of 3 elements , lambda[1]=0.5 and all the others desired values
for i=1:columns(lambda) #columns = nummber of columns
 expon(i,:) = exppdf(k,lambda(i)); #exppdf from library statistics
endfor
colors = "gkr"; #red-blue-magenta
figure(1);
hold on;
for i=1:columns(lambda) #3 loops for each exponential
 plot(k,expon(i,:),colors(i),"linewidth",1.2);
endfor
hold off;
title("PDF of exponential processes");
xlabel("k values");
ylabel("probability");
legend("lambda=0.5","lambda=1","lambda=3");

#TASK 2.B
k = 0:0.0001:8; # array from 0 to 8 with step 0.00001 
lambda = [0.5,1,3]; #array of 3 elements , lambda[1]=0.5 etc
#lambda parameter equals the mean value of expon (ë=1/ë)
for i=1:columns(lambda) #columns = nummber of columns
 expon(i,:) = expcdf(k,lambda(i)); #poisspdf from library statistics
endfor
colors = "gkr"; #green, black, red
figure(2);
hold on;
for i=1:columns(lambda) #from 1 to 3
 plot(k,expon(i,:),colors(i),"linewidth",1.2);
endfor
hold off;
title("CDF of exponential processes");
xlabel("k values");
ylabel("probability");
legend("lambda=0.5","lambda=1","lambda=3");

#TASK 2.Ã
#expon = expcdf(k,lambda); #poisspdf from library statistics
#k = 0:0.00001:8; # array from 0 to 8 with step 0.00001 
lambda=2.5; 
probvalue1 = 1 - expcdf(0.3,lambda);
probvalue2nom = 1 - expcdf(0.5,lambda);
probvalue2den = 1 - expcdf(0.2,lambda);
probvalue2 = probvalue2nom ./ probvalue2den;
TASK 3.Á + 3.B
mean_exp = 0.2 # mean_exp = 1/L =1/5 =0.2