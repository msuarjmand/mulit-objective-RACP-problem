function sol=CreateRandomSolution2(model)

    N=model.N;
    nR=model.nR;
    
      M=N+nR;
      sol=rand(1,M);
      
%       x=sol(1:N);
%       rR=sol(N+1:M);
%       
%       sol.x=x;
%       sol.rR=rR;



end