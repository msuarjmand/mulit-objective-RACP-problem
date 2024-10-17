function model=CreateModel3048_9()

    PredList={[], 1, 1, 1, 4, 4, 2, [3 6], 7, 2, 2, [5 7], [5 8], [5 8 10], 8, [3 9 12], [6 10 12], [11 13 15], [3 4 9], [14 16 19], [11 13], [7 14 21], [10 15 21], [14 23], [9 17 23], [17 19 24], [11 12 19], [6 16 27], [20 22 25], [16 24 25], [18 26 28], [29 30 31]};

      t=[0, 5, 2, 6, 10, 7, 10, 9, 3, 8, 10, 1, 6, 6, 9, 9, 4, 4, 4, 3, 9, 4, 3, 6, 9, 3, 8, 3, 5, 8, 10, 0];

    N=numel(t);

    

    R=[0     0    0    0
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
        9    5    4    4
       10    3   10    9
        1    2    1    6
        4    5    4    9
       10    7    9    8
        7    4   10    3
        5    4    6    4
        2    7    3    2
        6   10    3   10
       10    8    9    9
        3    3    5    2
        2    5    4    3
        5    4    9    7
        5    7    8    5
        9    1    4    2
        5    3    7    5
        4   10    2    8
        8    7    9    3
        1    5    7    8
        5    2    8    1
        0    0    0    0];

     nR=size(R,2);

     Rmax=[33 33 32 37];
     NR=numel(Rmax);   % the number of the resources
     Rmin=zeros(1,nR);
     for i=1:nR
         Rmin(i)=max(R(:,i));   
     end
    T=sum(t);
     
    model.NR=NR;
    model.N=N;
    model.t=t;
    model.T=T;
    model.PredList=PredList;
    model.nR=nR;
    model.R=R;
    model.Rmax=Rmax;   
    model.Rmin=Rmin;

         

   
end