function model=CreateModel1064_7()

%     PredList={[], 1, 1, 1, 4, [3 5], [2 6], [2 4], [3 8], [3 7 9], [5 6 9], [6 9 10 11]};
      PredList={[],1,1,1,2,[3,4],[2,3],[4,5],[6,7,8],4,2,[9,10,11]};
      t=[0, 1, 8, 6, 6, 4, 8, 7, 9, 4, 6, 0];

    N=numel(t);

    

    R=[ 0    0    0    0
        4    6    3    4
        2    6    6    2     
        7    9    5    6       
        2    5    6    3
        5    7    4   10
        6    8    2    1
        4    9    8    1
       10   10    7    3
        7    5    8    3
        2    8    3    5        
        0    0    0    0 ];

     nR=size(R,2);

     Rmax=[22 24 24 21];
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