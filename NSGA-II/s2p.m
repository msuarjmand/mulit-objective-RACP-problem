clc;
clear;
close all;


S_List={[2 3 4],5,[7 15 21],[6 8 13],[7 8],[10 12 15],11,[9 18],[10 16 17],[19 20 21],[13 19],[14 16 17],14,18,[17 18 19],21,20,20,22,22,22,[]};
    

   M=22;
   P=zeros(M,M);
   PP=cell(1,M);
   
   for i=1:M
       for j=1:M
           
           if ismember(i,S_List{j}(:)); 
               P(i,j)=1;
           end           
       end
   end
   
   for i=1:M
       
            
       PP{i}=find(P(i,:)==1);
            
       
   end
   
   
   disp(PP);