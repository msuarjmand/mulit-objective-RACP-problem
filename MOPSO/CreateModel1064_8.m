function model=CreateModel1064_8()

%     PredList={[], 1, 1, 1, 4, [3 4], [2 6], [3 7], [2 5 6], [2 6 7], [6 8], [9 10 11]};
      PredList={[],1,1,1,[2,3],[2,4],[2,3],3,6,[7,8],[5,7],[9,10,11]};
      t=[0, 4, 5, 3, 6, 6, 1, 1, 10, 5, 6, 0];

    N=numel(t);

    

    R=[ 0    0    0    0
        5    6    7    7
        8    7    6   10
        6    9    4    6
        8    2    0    4
        5    6    4   10
        7    5   10    6
        4    9    8    9
        8    4    1    7
        4    6    6    5
        2   10    1    9       
        0    0    0    0 ];

     nR=size(R,2);

     Rmax=[42 43 41 44];
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