function sol3=LocalSearch(sol,model,VarMin,VarMax)
    
    N=model.N;
    NR=model.NR;
    M=N+NR;
    
    x=sol(1:N);
    rR=sol(N+1:M);
    

    
%% Decreasing the Level of the Selected Resource Type
   
    
    pm=rand;
    
    nVar=numel(rR);
    j=randi([1 nVar]);
    drR=pm*(VarMax-VarMin);
    i=rand;
    
    if i<0.3
        % one resource changed 
        lb=rR(j)-drR;
        if lb<VarMin
            lb=VarMin;
        end
        ub=rR(j)+drR;
        if ub>VarMax
            ub=VarMax;
        end
        rRnew=rR;
        rRnew(j)=unifrnd(lb,ub);

        
    elseif i<0.6
        % multi resource changed
            lb=zeros(size(rR));
            ub=zeros(size(rR));
         for k=1:j
             lb(k)=rR(k)-drR; 
            if lb(k)<VarMin
               lb(k)=VarMin; 
            end
            ub(k)=rR(j)+drR; 
            if ub(k)>VarMax
               ub(k)=VarMax; 
            end
            rRnew=rR;
            rRnew(k)=unifrnd(lb(k),ub(k));
         end

    else 
          d1=rand;
          rRnew=rR;         
          y=find(rRnew>d1);
          for m=y
              rRnew(m)=rRnew(m)-drR;
              if (rRnew(m)-drR)<=VarMin
                  rRnew(m)=-(rRnew(m)-drR);
              end
          end
          
    end

    %% Results
    

      sol3=[x rRnew];




end