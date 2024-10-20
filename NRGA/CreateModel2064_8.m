function model=CreateModel2064_8()

%     PredList={[], 1, 1, 1, 4, [3 4], 6, [2 7], [5 6], [2 6], [6 9 10], [2 5], [10 11 12], [4 13], [8 10 13], [3 9 12], [7 13 16], [8 12 16], [5 11 15], [2 9 17], [17 19 20], [19 20 21]};
      PredList={[],1,1,1,4,[3,5],6,[3,5],5,6,4,[7,10],[2,7],[6,8],[9,11,14],[3,4],[9,12,13],[11,16,17],[2,15,16],[14,18],[11,16,17],[19,20,21]};
      t=[0, 4, 5, 3, 6, 6, 1, 1, 10, 5, 6, 5, 3, 9, 9, 7, 9, 6, 2, 4, 1, 0];

    N=numel(t);

    

    R=[ 0    0    0    0        
        3    1    9    4
        6   10    3    7
        1    6    8    7
        6    9    3    6
        6    1   10    8
        3    2    5    6
        1    9    1   10
        4    3    8   10
        4    6    2    7
        5    2    9    5
       10    7    1    1
        3    1    3    4
        2    7   10    4
        2    2    5    9
        9    5    2    7
        5    6    9    9
        1    9    7    3
        2    7   10    8
        6    9    4    5
        9    6    7    9
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