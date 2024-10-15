function model=CreateModel1064_1()

%     PredList={[], 1, 1, 1, [3 4], [2 5], [2 3], [4 5], [6 8], [4 7], [3 8 9], [9 10 11]};
      PredList={[],1,1,1,3,2,4,[3,4],[5,6,7],[2,8],[5,6],[9,10,11]};
      t=[0, 5, 5, 10, 4, 4, 8, 1, 9, 1, 6, 0];

    N=numel(t);

    

    R=[ 0    0    0    0
        8    2    4    9
       10    6    4    7
        8   10   10    9
        5    3    5    3
        6    6   10    9
        6    5    8   10
        7    9    2    1
        9   10    9    6
        1    8    7    1
        8    5    8    3       
        0    0    0    0 ];

     nR=size(R,2);

     Rmax=[25 23 28 28];
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