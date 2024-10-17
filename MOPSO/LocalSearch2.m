function sol3=LocalSearch2(sol,model)

    sol1=ParseSolution(sol,model);

    q=sol1.q;
    x=sol1.x;
%     r=sol1.r;
    rR=sol1.rR;      
    RI1=sol1.RI;
    
    N=model.N;
    t=model.t;
    PredList=model.PredList;
    R=model.R;
    Rmin=model.Rmin;
    Rmax=model.Rmax;
 
    
%% Determining the number of the resources level changed

    RL=RI1;
    
    j=numel(RI1);
    
    
    rr=randi([1 j]);       % the number of the changed resource level
    m=randperm(j);     % select the m different resource type 
    delta=randi([1 10],1,rr);  % the amount of decreasing
    xx=randi([0 1],1,rr);
%% Decreasing the Level of the each Selected Resource Type

   for n=1:rr
        if xx(n)==0
             if (RL(m(n))-delta(n))>=Rmin(m(n))
                 RL(m(n))=RL(m(n))-delta(n);
             else
                 RL(m(n))=Rmin(m(n));
             end
        else
             if (RL(m(n))+delta(n))<=Rmax(m(n))
                 RL(m(n))=RL(m(n))+delta(n);
             else
                 RL(m(n))=Rmax(m(n));
             end
        end
    end
   
 %%   
    ST=zeros(1,N);
    FT=zeros(1,N);
    
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
    sol3.x=x;
    sol3.rR=rR;
    
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