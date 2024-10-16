function sol=CreateRandomSolution(model)
%% the resource level

    N=model.N;
%     R=model.R;
    Rmax=model.Rmax;
    Rmin=model.Rmin;
    
     
     j=numel(Rmax);

     r=zeros(size(Rmax));
          for i=1:j
             r(i)=randi([Rmin(i) Rmax(i)]);
          end
%         r=[10 10 10 10];
%% the Sequence of the activities 
   
    q=randperm(N);
    
%     q=RepairSchedule(q,model);
    


%% Results
   
    sol.r=r;  
    sol.q=q;


 
end