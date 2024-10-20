function model=CreateModel2064_3()

%     PredList={[], 1, 1, 1, 4, 3, [4 5], [2 7], [2 6], [2 9], [5 9], [3 6 9], [5 8 10], [4 11 12], [4 10 13], [6 7 13], [3 14 15], [8 10], [9 14 15], [11 12 18], [17 19 20], [19 20 21]};
        PredList={[],1,1,1,3,3,[2,4],[6,7],5,4,3,6,[8,11,12],[6,10],[7,11,14],[8,14],[5,12,15],[13,17],[13,16,17],[5,10,13],[9,16,18],[19,20,21]};
      t=[0, 8, 7, 4, 10, 7, 1, 1, 1, 5, 3, 4, 8, 7, 10, 5, 6, 10, 5, 1, 3, 0];

    N=numel(t);

    

    R=[ 0    0    0    0
        9    1   10    5
        5    3    7    6
        9    9    2    9
        2    9   10    3
        8    9    1    4
        5    7    7    3
        3   10    2    4
        1    4    6    3
        1    1    9    7
        7   10    9    1
        2    2    6    5
        6    5    4   10
        7    4    5    7
        7    6    3    2
        5    3    5    5
        8    3    5    9
        8    7    1    9
        1    5   10    2
        1    2    4    6
        9    2    4    4
        0    0    0    0 ];

     nR=size(R,2);

     Rmax=[49 55 55 53];
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