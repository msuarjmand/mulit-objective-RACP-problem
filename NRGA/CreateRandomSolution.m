function sol=CreateRandomSolution(model)
%% the resource level

    N=model.N;
    R=model.R;
    Rmax=model.Rmax;
    Rmin=zeros(size(Rmax));
    
    j=numel(Rmax);
    for k=1:j       
       Rmin(k)=max(R(:,k));        
    end
    
    r=zeros(size(Rmax));
    for i=1:j
       r(i)=randi([Rmin(i) Rmax(i)]);    
    end
    
%% the Sequence of the activities 
   
    q=randperm(N);
    
%     q=RepairSchedule(q,model);
    


    

%% Results
   
    sol.r=r;  
    sol.q=q;
    


   
   
    
end