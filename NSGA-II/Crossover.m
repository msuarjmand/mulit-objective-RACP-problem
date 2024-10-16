function [ysol1 ysol2]=Crossover(xsol1,xsol2)

        xp1=xsol1.q;
        xp2=xsol2.q;
        
        xr1=xsol1.r;       
        xr2=xsol2.r;
        
        
%         xS1=xsol1.S;       
%         xS2=xsol2.S;
%         
%         
%         xF1=xsol1.F;       
%         xF2=xsol2.F;
%         
        
        [yp1 yp2]=PermutationCrossover(xp1,xp2);
        
        ysol1.q=yp1;
        ysol2.q=yp2;
        
        
        ysol1.r=xr1;
        ysol2.r=xr2;
        
        
        
%         ysol1.S=xS1;
%         ysol2.S=xS2;
%         
% 
%         
%         ysol1.F=xF1;
%         ysol2.F=xF2;
        
         
    
end