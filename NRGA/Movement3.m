function sol2=Movement3(sol,model)
    
    sol1=ParseSolution(sol,model);

   
    N=model.N;

    t=model.t;
    Rmin=model.Rmin;
    Rmax=model.Rmax;
    R=model.R;
    PredList=model.PredList;  
    
    ST1=sol1.ST;
    RI1=sol1.RI;

    
    q=sol1.q;
    r=sol1.r;
    
    %% Choose the effective activity from all effective activities set
    

      n=4;                    
      e=randi([1 n]);         % number of changed activities start time 
%       SA=zeros(1,e);          % selected activities set
      mo=zeros(1,e);          % movement of selected activities
      
      SA=randsample(2:N-1,e);
      for o=1:e
%           SA(o)=randi([2 N-1]);
          mo(o)=randi([1 5]);          
      end
    
    
    
  %%  
    
    ST=zeros(1,N);
    FT=zeros(1,N);
    
    
    T=sum(t)+10;
    AR=repmat(RI1,T,1);
    RR=AR;
    UR=zeros(size(RR));
    

    for i=q
        
        j=find(SA==i);
        if j~=0
            t1=ST1(i)+mo(j);
        elseif ~isempty(PredList{i})
            t1=max(FT(PredList{i}));
        else         
            t1=0;
        end
        
        
        for tt=t1:T
            RR_is_enough=true;
            
            for d=1:t(i)
                if any(RR(tt+d,:)<R(i,:))
                    RR_is_enough=false;
                    break;
                end
            end
            
            if RR_is_enough
                t2=tt;
                break;
            end
        end
        
        ST(i)=t2;
        
        for d=1:t(i)
            RR(ST(i)+d,:)=RR(ST(i)+d,:)-R(i,:);
            UR(ST(i)+d,:)=UR(ST(i)+d,:)+R(i,:);
        end
        
        FT(i)=ST(i)+t(i);
    end
            
     
    Cmax=max(FT);
    
    %% Results
    
    AR=AR(1:Cmax,:);
    RR=RR(1:Cmax,:);
    UR=UR(1:Cmax,:);
    RI=max(UR(1:Cmax,:));
    
    sol2.q=q;
    sol2.r=RI1;

    
    sol2.ST=ST;
    sol2.FT=FT;
    sol2.Cmax=Cmax;
    sol2.AR=AR;
    sol2.RR=RR;
    sol2.UR=UR;
    sol2.RI=RI; 
    sol2.Rmax=Rmax;
    sol2.Rmin=Rmin;
  
    
end

