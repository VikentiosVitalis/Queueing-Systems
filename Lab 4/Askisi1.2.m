pkg load queueing
addpath(pwd);
function Result = erlang_factorial(ro,n)
    i = 0;
    Result = 1;
    while i <= n
        Result = ro * Result/(ro*Result + i);
        i = 1 + i; 
    endwhile
endfunction
