function model=CreateModel1064_6()

%     PredList={[], 1, 1, 1, 2, [3 4], [2 3], [3 6], [5 7 8], [4 7], [5 6 8], [9 10 11]};
      PredList={[],1,1,1,[2,3],2,6,2,[4,5,7],[5,6],[4,8],[9,10,11]};
      t=[0, 5, 4, 6, 1, 4, 4, 8, 9, 5, 4, 0];

    N=numel(t);

    

    R=[ 0    0    0    0
        2    4    7    9
        3    1    7    2
        1    3   10    2
        2    7    7    3
        5    8    1    5
        9    1    9    7
        2    9    7    3
        8    3    1    3
       10    5    1    2
        6   10    9    5        
        0    0    0    0 ];

     nR=size(R,2);

     Rmax=[24 25 25 27];
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