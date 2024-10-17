function sol2=Mutate(sol,model,pm,VarMin,VarMax)


    N=model.N;
    nR=model.nR;
    M=N+nR;
    
    x=sol(1:N);
    rR=sol(N+1:M);
    
    %% activity mutation
    

    nVar=numel(x);
    j=randi([1 nVar]);
    dx=pm*(VarMax-VarMin);
    i=rand;
    
    if i<=0.3
        % one activity changed 
        lb=x(j)-dx;
        if lb<VarMin
            lb=VarMin;
        end
        ub=x(j)+dx;
        if ub>VarMax
            ub=VarMax;
        end
        xnew=x;
        xnew(j)=unifrnd(lb,ub);
        
    elseif i<=0.6
        % multi activity changed
            lb=zeros(size(x));
            ub=zeros(size(x));
         for k=1:j
             lb(k)=x(k)-dx; 
            if lb(k)<VarMin
               lb(k)=VarMin; 
            end
             ub(k)=x(j)+dx; 
            if ub(k)>VarMax
               ub(k)=VarMax; 
            end
            xnew=x;
            xnew(k)=unifrnd(lb(k),ub(k));
         end
         
    else 
          d1=rand;
          xnew=x;          
          y=find(xnew>d1);
          for m=y
              xnew(m)=xnew(m)-dx;
              if xnew(m)-dx<VarMin
                  xnew(m)=-(xnew(m)-dx);
              end
          end
    end
    
   %% Results
    
      sol2=[xnew rR];

end