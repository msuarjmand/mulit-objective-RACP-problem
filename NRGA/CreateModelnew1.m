function model=CreateModelnew1()

    PredList={[], [], 1, 1,[2 3],[4 5]};

      t=[2 5 3 7 6 0];

    N=numel(t);

    

    R=[      
         4    1    3    
         3    5    1    
         3    1    4    
         3    2    1    
         3    1    2            
         0    0    0];

     nR=size(R,2);

     Rmax=[20 20 20];
     Rmin=zeros(1,nR);
      for i=1:nR
          Rmin(i)=max(R(:,i));   
      end

    model.N=N;
    model.t=t;
    model.PredList=PredList;
    model.nR=nR;
    model.R=R;
    model.Rmax=Rmax;
    model.Rmin=Rmin;

         

   
end