function sol2=Movement(sol,model)
    
    sol1=ParseSolution(sol,model);

   
    N=model.N;
    nR=model.nR;
    t=model.t;   
    Rmin=model.Rmin;
    Rmax=model.Rmax;
    R=model.R;
    PredList=model.PredList;  
%     Cmax1=sol1.Cmax;
    ST1=sol1.ST;
    RI1=sol1.RI;
    UR1=sol1.UR;
    
    
    q=sol1.q;
    r=sol1.r;

    ST=zeros(1,N);      %new start time
    FT=zeros(1,N);      %new finish time
    %% Choose the effective activity from all effective activities set
    
    e=randi([1 nR]);  %select the resource type

    
    A=find(UR1(:,e)==RI1(e),1,'first');  %find the max level used in the selected resource type 
    EA=find(ST1(:)==A-1);                  %effective activity
    rr=randi([1 numel(EA)]);            %select an effective activity
%     L=UR1(A,e)-R(EA(rr),e);             %the resource level after changing the effective activity

%     EM=find(UR1(A:Cmax1,e)<L,1,'first');      % effective movement
    SA=EA(rr);
    EM=randi([1 10]);
    
    
    
  %%  
    
    
    
    
    T=sum(t(:))+10;
    AR=repmat(RI1,T,1);
    RR=repmat(RI1,T,1);
    UR=zeros(size(RR));
    

    for i=q
        
        if i==SA
            t1=ST1(i)+EM-1;
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

