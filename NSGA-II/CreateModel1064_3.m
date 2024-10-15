function model=CreateModel1064_3()

%     PredList={[], 1, 1, 1, [3 4], 3, [3 5], [2 5], [2 3 6], [2 8], [4 5 6], [9 10 11]};
      PredList={[],1,1,1,3,[4,5],3,[5,7],3,[2,6,7],[6,8],[9,10,11]};
      t=[0, 8, 7, 4, 10, 7, 1, 2, 5, 3, 4, 0];

    N=numel(t);

    

    R=[ 0    0    0    0
        8    2    2    7
        7    5    5    4
        3   10    1    8
        7   10    8    7
        2   10   10   10
        4    6    1   10
        7    1   10    3
        6    5   10    2
        8   10    5    1
        7    9    5    5       
        0    0    0    0 ];

     nR=size(R,2);

     Rmax=[29 35 35 33];
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