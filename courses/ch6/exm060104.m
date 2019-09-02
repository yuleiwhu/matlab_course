function [S,N]=exm060104(epsilon)
% [S,N]=exm060104(epsilon)
% 			Calculate the sum of a special series S=1+1/(1+2)+бн+1/(1+2+бн+N)
% S			Sum of a special series
% N     		The minimum among all numbers to have 1/sum(1:N)<epsilon
% epsilon  	Given accuracy
 
k=0;
s=0;
d=inf;
S=0;
while d>epsilon
    k=k+1;
    s=s+k;              
    d=1/s;  
    S=S+d;
end
N=k;
end