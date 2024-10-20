function model=CreateModel2064_2()

%     PredList={[], 1, 1, 1, [3 4], [3 5], [2 6], [5 6], [3 6 8], [5 6], [5 7 9], [8 9 10], [4 11], [2 10], [8 10 11], [8 11 13], [7 12 14], [2 4 9], [15 16 18], [6 17 19], [6 14 19], [19 20 21]};
        PredList={[],1,1,1,2,3,2,[2,6],[3,7],4,3,[4,11],[5,6],[8,9,10],[11,13],[5,6,11],[13,16],[7,17],[7,12,15],[9,12,18],[5,12,14],[19,20,21]};
      t=[0, 1, 2, 6, 3, 2, 10, 7, 3, 4, 5, 2, 2, 7, 1, 4, 3, 7, 5, 2, 3, 0];

    N=numel(t);

    

    R=[ 0    0    0    0        
        3    8    6    5
        9    4    4    8
        2    9    4    8
        5    8    2    1
        3    1    9    6
        1   10    7    8
        3    5    6    7
        5    3    2    4
        5    3   10    3
        7    8    1    3
       10    7    4    5
        5   10    8    1
        8    9    9    7
        8    4   10    2
       10    6    8    2
        8    1    4    5
        3    3   10    3
        5    5    7    5
        1    3    3    4
        7    6    2    5
        0    0    0    0 ];

     nR=size(R,2);

     Rmax=[43 44 48 44];
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