function sol3=LocalSearch(sol,model)
    

       sol1=ParseSolution(sol,model);

    N=model.N;
    t=model.t;
    PredList=model.PredList;
    R=model.R;
    RI=sol1.RI;
    q=sol1.q;
    r=sol1.r;

    
    Rmin=model.Rmin;
    Rmax=model.Rmax;
    
%% Decreasing(increasing) the Level of the Selected Resource Type
    
    RL=r;
    j=numel(RI);
    rr=randi([1 j]); 
    delta=randi([1 10]);
    x=rand;
    if x>0.4
        if (RL(rr)-delta)>=Rmin(rr)
            RL(rr)=RL(rr)-delta;
        else
            RL(rr)=Rmin(rr);
        end
    else
        if (RL(rr)+delta)<=Rmax(rr)
            RL(rr)=RL(rr)+delta;
        else
            RL(rr)=Rmax(rr);
        end
    end
    %%
    ST=zeros(1,N);
    FT=zeros(1,N);
    
    T=sum(t)+10;
    
    AR=repmat(RL,T,1);
    RR=AR;
    UR=zeros(size(RR));
    
    for i=q
        if ~isempty(PredList{i})
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
    
    AR=AR(1:Cmax,:);
    RR=RR(1:Cmax,:);
    UR=UR(1:Cmax,:);
    RI=max(UR(1:Cmax,:));
    %% Results
    
    sol3.q=q;
    sol3.r=RL;

    
    sol3.ST=ST;
    sol3.FT=FT;
    sol3.Cmax=Cmax;
    sol3.AR=AR;
    sol3.RR=RR;
    sol3.UR=UR;
    sol3.RI=RI;
    sol3.RL=RL;
    sol3.Rmax=Rmax;
    sol3.Rmin=Rmin;




end