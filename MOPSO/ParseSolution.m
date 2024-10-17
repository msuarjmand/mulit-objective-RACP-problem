function sol1=ParseSolution(sol,model)


    t=model.t;
    PredList=model.PredList;
    R=model.R;  
    Rmin=model.Rmin;
    Rmax=model.Rmax;
    N=model.N;
    nR=model.nR;
    
    M=N+nR;
    
    x=sol(1:N);
    rR=sol(N+1:M);
    
    [~, q]=sort(x);
    q=RepairSchedule(q,model);
    
    j=numel(Rmax);
    
    l=rR.*Rmax;
    r=zeros(size(Rmax));
    for i=1:j
       r(i)=l(i);
       if r(i)<Rmin(i)
           r(i)=Rmin(i);
       end
    end
    
    r=round(r)+Rmin;
    
    
%% Decreasing the Level of the Selected Resource Type


RL=r;
    j=numel(r);
    rr=randi([1 j]);
    delta=randi([1 15]);
    
    xx=rand;
    
    if xx>0.4
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
    
    ST=zeros(1,N); %S; 
    FT=zeros(1,N); %F; 
    
    T=sum(t);
    
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
        ST(i)=t2;%randi([t2,t2+3]);
        
        for d=1:t(i)
            RR(ST(i)+d,:)=RR(ST(i)+d,:)-R(i,:);
            UR(ST(i)+d,:)=UR(ST(i)+d,:)+R(i,:);
        end
        
        FT(i)=ST(i)+t(i);
    end
    
    Cmax=max(FT);
%     S=ST;
%     F=FT;

    
    AR=AR(1:Cmax,:);
    RR=RR(1:Cmax,:);
    UR=UR(1:Cmax,:);
    RI=max(UR(1:Cmax,:));
%% Results

    sol1.q=q;
    sol1.x=x;
    sol1.r=RL;
    sol1.rR=rR;   
    
    sol1.ST=ST;
    sol1.FT=FT;
    sol1.Cmax=Cmax;
    sol1.AR=AR;
    sol1.RR=RR;
    sol1.UR=UR;
    sol1.RI=RI;

    
    
end