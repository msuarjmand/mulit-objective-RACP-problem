function model=CreateModel2064_10()

%     PredList={[], 1, 1, 1, 2, [2 5], [3 4], [3 6], [5 8], 5, [4 6 9], 10, [6 7 12], [3 4 12], [2 7 13], [8 9 13], [11 14 16], [8 10 15], [10 15 17], [9 15 18], [2 7 17], [19 20 21]};
      PredList={[],1,1,1,[2,3],[2,3],5,3,[5,6],[2,4],10,8,[5,10],[4,9],[9,11],4,[7,12,16],[7,11,16],[15,17,18],[13,14,18],[6,10,17],[19,20,21]};
      t=[0, 7, 10, 2, 6, 8, 1, 8, 1, 7, 4, 6, 4, 9, 10, 1, 7, 8, 6, 2, 5, 0];

    N=numel(t);

    

    R=[  0     0     0     0         
         2     6     6     2
         7     7     8    10
         7     9     8     8
         8     1     3     9
         4     6     2     7
        10     2     8     5
         7     9     1     5
         6     3     3     8
         6     2     1     2
         6     5     9     1
         2     3     9     7
         2    10     8     4
        10    10     7     7
         6     7     9     5
         8     6     4     7
         7     5     7     7
         2    10     9     4
         7     9     6     6
        10     4     6     4
         9     4     4     9
         0     0     0     0];

     nR=size(R,2);

     Rmax=[43 40 44 35];
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