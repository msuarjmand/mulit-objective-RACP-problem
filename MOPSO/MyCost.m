function [z sol]=MyCost(sol,model)

    global NFE;
    NFE=NFE+1;
    v=rand;
   if ~isfield(sol,'RI')
       if v<0.7
          sol=LocalSearch2(sol,model);
       else
          sol=ParseSolution(sol,model);         
                                
       end
   end
    
    z1=sol.Cmax;
    r=sol.r;
    c=[1 1 1 1];      
    z2=sum(c.*r);
      
     z=[z1 z2]';
      
     
end