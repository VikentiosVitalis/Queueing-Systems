pkg load statistics

clc;
clear all;
close all;

# TASK 1.A
k = 0:1:70; 
lambda = [3,10,50]; #array of 3 elements , lambda[1]=3 etc
for i=1:columns(lambda) #columns = nummber of columns
 poisson(i,:) = poisspdf(k,lambda(i)); #poisspdf from library statistics
endfor
colors = "gkr"; #green, black, red 
figure(1); # Graph one
hold on;
for i=1:columns(lambda)
 stem(k,poisson(i,:),colors(i),"linewidth",1.2); 
endfor
hold off;
title("PDF of Poisson processes"); #Title of the graph
xlabel("k values");   # x - axe
ylabel("probability"); # y - axe
legend("lambda=3","lambda=10","lambda=50"); # note on the graph
#TASÊ 1.Â
# mean value and variance
index = find(lambda == 30); 
chosen = poisson(index,:);
mean_value = 0;
for i=0:(columns(poisson(index,:))-1)
 mean_value = mean_value + i.*poisson(index,i+1);
endfor
display("Mean Value of Poisson with lambda 30 is");
display(mean_value);
second_moment = 0;
for i=0:(columns(poisson(index,:))-1)
 second_moment = second_moment + i.*i.*poisson(index,i+1);
endfor
variance = second_moment - mean_value.^2;
display("Variance of Poisson with lambda 30 is");
display(variance);
#TASK 1.Ã
# TASK: consider the convolution of the Poisson distribution with lambda 10 with 
# the Poisson distribution with lambda 50. 
first = find(lambda==10);
second = find(lambda==50);
poisson_first = poisson(first,:);
poisson_second = poisson(second,:);
composed = conv(poisson_first,poisson_second); #conv from library
new_k = 0:1:(2*70);
figure(2);
hold on;
stem(k,poisson_first(:),"g","linewidth",1.2);
stem(k,poisson_second(:),"k" ,"linewidth",1.2);
stem(new_k,composed,"r","linewidth",2);
hold off;
title("Convolution of two Poisson processes");
xlabel("k values");
ylabel("Probability");
legend("lambda=10","lambda=50","new process");
#TASK 1.Ä
# TASK: show that Poisson process is the limit of the binomial distribution.
k = 0:1:200;
# Define the desired Poisson Process
lambda = 30;
i = 1:1:5;
n = lambda.*i; 
p = lambda./n;
colors = 'rbgb';
figure(3);
title("Poisson process as the limit of the binomial process");
xlabel("k values");
ylabel("Probability");
hold on;
for i=1:4
 binomial = binopdf(k,n(i),p(i));  #binomial from library
 stem(k,binomial,colors(i),'linewidth',1.2);
endfor
hold off;