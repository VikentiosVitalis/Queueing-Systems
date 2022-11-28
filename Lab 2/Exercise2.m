clc;
clear all;
close all;
pkg load statistics 
#ÔASK A

m_array=[5.01:0.01:10];
lamda = 5;

U=[0,10000]; #utiliaztion 
R=[0,10000]; #server responce time
Q=[0,10000]; #average naumber of requests
X=[0,10000]; #server throughput

 for i=1:columns(m_array)
[U(i),R(i),Q(i),X(i)] = qsmm1(lamda,m_array(i));
  endfor
 
figure(1) ;
plot(m_array,U);
xlabel("ì values");
ylabel("utilization");
 
figure(2);
plot(m_array,R);
xlabel("ì values");
ylabel("average time delay");
 
figure(3);
plot(m_array,Q);
xlabel("ì values");
ylabel("average number of requests");
 
 
figure(4);
plot(m_array,X);
xlabel("ì values");
ylabel("throughput");
 
figure(5);
hold on
plot(m_array,U);
plot(m_array,R);
plot(m_array,Q);
plot(m_array,X);
hold off

#TASK B
# The system is defined and its first state
lambda = 5;
mu = 20;
states = [0, 1, 2, 3, 4];
initial_state = [1, 0, 0, 0, 0];
genniseis = [lambda, lambda/2, lambda/3, lambda/4];
thanatoi = [mu, mu, mu, mu];
# Calculation and print of the transitional array
metavatikos = ctmcbd(genniseis, thanatoi);
disp("The transition matrix of the system is:");
display (metavatikos);
# Caculation and print of ergodic probabilities
ergodic_prob = ctmc(metavatikos);
disp("The ergodic probabilities of the system are (for each state):");
display(ergodic_prob);
# Calculation and print of the average number of customers in the system
avg_customers = ergodic_prob(2) + 2 * ergodic_prob(3) + 3 * ergodic_prob(4) + 4 * ergodic_prob(5);
disp("The average number of customers in the system is "), disp (avg_customers);
# Calculation and print of the block probability
pblock = ergodic_prob(5);
display("The blocking probability of the system is "), disp(pblock);
# Calculation and graphs of the evolution of probabilities for each state individually 
index = 0;
for T = 0:0.01:50
 index = index + 1;
 pithanotita = ctmc(metavatikos, T, initial_state);
 Prob0(:,index) = pithanotita;
 if (pithanotita - ergodic_prob < 0.01)
 break;
 endif
endfor
T = 0:0.01:T;
figure (6)
for i = 1:1:5 subplot (3, 2, i);
 plot(T,Prob0(i,:),"r","linewidth",1.3);
 ttlstring = strcat("Probability changes over time for state ", num2str(i-1)); 
 title(ttlstring);
 xlabel("Time");
 ylabel("Probability");
 grid on;
endfor