% M/M/1/N simulation. We will find the probabilities of the first states.
% Note: Due to ergodicity, every state has a probability >0.

clc;
clear all;
close all;

%rand("seed",1);   %ίδιες ακολουθίες τυχαίων αριθμών
total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;

lambda = 10;  %{1,5,10}
mu = 5;
max_clients = 10;
number_of_states = max_clients + 1;
arrivals = zeros (number_of_states, 1);
threshold  = lambda/(lambda + mu); % the threshold used to calculate probabilities

transitions = 360000; % holds the transitions of the simulation in transitions steps
                      % transitions = 34000, 113000, 360000

while transitions >= 0
  transitions = transitions + 1; % one more transitions step
  
  if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
    index = index + 1;
    for i=1:1:number_of_states
        P(i) = arrivals(i)/total_arrivals; % calculate the probability of every state in the system
    endfor
    
    mean_clients = 0; % calculate the mean number of clients in the system
    for i=1:1:number_of_states
       mean_clients = mean_clients + (i-1).*P(i);
    endfor
    
    to_plot(index) = mean_clients;
        
    if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
      break;
    endif
    
    previous_mean_clients = mean_clients;
    
  endif
  
  random_number = rand(1); % generate a random number (Uniform distribution)
  %display(current_state);
  if current_state == 0 || random_number < threshold % arrival
    %display("arrival");
    total_arrivals = total_arrivals + 1;
    arrivals(current_state + 1) = arrivals(current_state + 1) + 1;
    %display(arrivals(current_state + 1));
    if current_state != max_clients
      current_state = current_state + 1;
    %else if current_state==max_clients  stay in 10 until new arrival
    endif
    
    else     %departure
    %display("departure");
    %display(arrivals(current_state + 1));
    if current_state != 0 % no departure from an empty system
      current_state = current_state - 1;
    endif
  endif
endwhile

for i=1:1:number_of_states
  display(P(i));
endfor

Pblocking = P(number_of_states)      % πιθανότητα απόρριψης πελάτη = PN (δηλ η 
gamma = lambda * (1-Pblocking);
display(mean_clients);              %μέσος αριθμός πελατών
mean_time = mean_clients / gamma;       %μέσος χρόνος καθυστέρησης πελάτη(Little)
display(mean_time);

figure(1);
plot(to_plot,"r","linewidth",1.3);
title("Average number of clients in the M/M/1/Ν queue: Convergence");
xlabel("transitions in thousands");
ylabel("Average number of clients");

figure(2);
k = 0:1:10;
bar(k,P,'r',0.4);
title("Probabilities")