function sol1=ParseSolution(sol,model)

    N=model.N;
    t=model.t;
    PredList=model.PredList;
    R=model.R;

     q=sol.q;
     r=sol.r;
    
     q=RepairSchedule(q,model);
    
    ST=zeros(1,N);
    FT=zeros(1,N);
    
    T=sum(t);
    
    AR=repmat(r,T,1);
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
    
    sol1.q=q;  
    sol1.r=r;
   
    
    
    sol1.ST=ST;
    sol1.FT=FT;
    sol1.Cmax=Cmax;
    sol1.AR=AR;
    sol1.RR=RR;
    sol1.UR=UR;
    sol1.RI=RI;


end