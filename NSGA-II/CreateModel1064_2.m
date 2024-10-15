function model=CreateModel1064_2()

%     PredList={[], 1, 1, 1, 4, [2 3 5], [2 6], [3 5], [3 4 7], [5 8 9], [6 7], [9 10 11]};
      PredList={[],1,1,1,2,2,[3,6],[2,4],[5,6],[3,6],[7,8],[9,10,11]};
      t=[0, 1, 2, 6, 3, 2, 10, 7, 3, 4, 5, 0];

    N=numel(t);

    

    R=[ 0    0    0    0
        6    3    1    6
        6    5    9    6
        4    9    5    7
        9    2    5   10
        3    5    6    9
        7    7    3    1
        9    9    9    8
        2    8    1    5
        4    6    9    9
        8    5    5    9       
        0    0    0    0 ];

     nR=size(R,2);

     Rmax=[23 24 28 24];
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