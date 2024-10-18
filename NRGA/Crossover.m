function [ysol1 ysol2]=Crossover(xsol1,xsol2)

        xp1=xsol1.q;
        xp2=xsol2.q;
        
        xr1=xsol1.r;       
        xr2=xsol2.r;
         
       
        
        
        [yp1 yp2]=PermutationCrossover(xp1,xp2);
        
        ysol1.q=yp1;
        ysol2.q=yp2;
        
        
        ysol1.r=xr1;
        ysol2.r=xr2;
       
         
    
end