function model=CreateModel1064_5()

%     PredList={[], 1, 1, 1, [2 4], [2 3], [3 5], [5 6], [3 6 7], [2 8 9], [6 8 9], [9 10 11]};
      PredList={[],1,1,1,3,2,[4,6],7,[5,7],[3,8],[4,5,6],[9,10,11]};
      t=[0, 8, 10, 9, 7, 9, 3, 4, 10, 1, 10, 0];

    N=numel(t);

    

    R=[ 0    0    0    0
        1    3    6    1
        3   10    9    4
       10   10    7    3
        8    6    4   10
        2    1    5    2
       10    6    3    6
        4    9    7    7
        8   10    7    8
        7    1    8    7
        3    4    1    7        
        0    0    0    0 ];

     nR=size(R,2);

     Rmax=[24 23 26 29];
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