function model=CreateModel1064_9()

%     PredList={[], 1, 1, 1, 4, 4, [2 3], [3 5 6], [4 7 8], [2 6], [7 8], [9 10 11]};
      PredList={[],1,1,1,[3,4],2,6,4,[6,8],[5,6,8],[5,7],[9,10,11]};

      t=[0, 5, 2, 6, 10, 7, 10, 9, 3, 8, 10, 0];

    N=numel(t);

    

    R=[ 0     0    0    0
       10    5    8    5
        9    3    8    7
        5    9    4    1
        5    7    6    4
        9    4    2   10
        7    2   10    6
        4    5    2    6
        6    3    6    6
        8   10   10    9
        4    6    4    8       
        0    0    0    0];

     nR=size(R,2);

     Rmax=[33 33 32 37];

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