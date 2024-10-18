function model=CreateModel1064_4()

%     PredList={[], 1, 1, 1, [2 3 4], 2, [3 4], [5 6 7], [4 7 8], [5 6], [5 10], [8 9 10 11]};
      PredList={[],1,1,1,4,3,4,4,[3,7],[6,7,8],[2,5,8],[9,10,11]};
      t=[0, 5, 8, 2, 8, 6, 2, 2, 7, 4, 1, 0];

    N=numel(t);

    

    R=[ 0    0    0    0
        8    1   10    1
        5   10    6    8
        1    6    2    3       
        9    7    2    6
        1    6    1    9        
       10    9    5    5       
        7    9   10    8
        1    1    6    8
        5    7    7    5
        9   10    6    9       
        0    0    0    0 ];

     nR=size(R,2);

     Rmax=[28 23 34 35];
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