clc;
clear;
close all;

mu=0.2;
MaxIt=100;
pm=zeros(2,MaxIt);
pm(1,1)=1;
 pm(2,1)=0;
pm(2,100)=1;
% pm(100)=0;
pit=zeros(size(pm));
% pit(1)=1;
% pit(100)=1;

for i=2:50

    pm(1,i)=(1-(i-1)/(MaxIt-1))^(1/mu);
    
end

for j=2:50
    
   pm(2,j)=2*(j/MaxIt); 
    
end

plot(pm(1,:),pm(2,:),'-');