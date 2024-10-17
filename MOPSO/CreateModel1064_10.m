function model=CreateModel1064_10()

%     PredList={[], 1, 1, 1, 2, 5, [3 5], [3 6], [3 5], [5 6 7], [4 7 8 9], [9 10 11]};
    PredList={[],1,1,1,3,5,4,[2,6,7],8,[3,4],[2,4,5],[9,10,11]};

       t=[0,7,10,2,6,8,1,8,1,7,4,0];

        

    N=numel(t);

    

    R=[  0     0     0     0
         3    10     4     4
         5     8     9     8
         4     4     3     9
         7     5     9    10
         4     7     3     4
         2     6     9     7
         3     7     9     8
        10     4     8     3
        10    10     3     1
         4     1     4     5        
         0     0     0     0];

     nR=size(R,2);

     Rmax=[33 30 34 25];
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