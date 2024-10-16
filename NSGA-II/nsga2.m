clc;
clear;
close all;

tic;

%% Problem Definition

model=CreateModel3048_10();

CostFunction=@MyCost;

%% NSGA-II Settings

MaxIt=100;

nPop=30;

pCrossover=0.85;
nCrossover=round(pCrossover*nPop/2)*2;

pMutation=0.85;
nMutation=round(pMutation*nPop);

pMovement=0.6;
nMovement=round(pMovement*nPop);

pLocalSearch=0.75;
nLocalSearch=round(pLocalSearch*nPop);

TournamentSelectionSize=4;

%% Initialization

individual.Position=[];
individual.Cost=[];
individual.Sol=[];
individual.Rank=[];
individual.CrowdingDistance=[];
individual.DominationSet=[];
individual.DominatedCount=[];

pop=repmat(individual,nPop,1);

for i=1:nPop
    pop(i).Position=CreateRandomSolution(model);
    [pop(i).Cost, pop(i).Sol]=CostFunction(pop(i).Position,model);
end

[pop, F]=NonDominatedSorting(pop);

pop=CalcCrowdingDistance(pop,F);

[pop, F]=SortPopulation(pop);

A=[pop.Cost]';
    [a1,a2,a3]=unique(A(:,1));
    b=unique(a3);
    nb=numel(b);
    C=zeros(nb,2);
    
     
    for i=1:nb
        C(i,1)=a1(i);
        f=find(a3==i,1,'first');
        C(i,2)=A(f,2);
    end


figure(1);
PlotFronts(pop,F);


MID=zeros(MaxIt+1,1);
MID(1)=sum(sqrt(C(:,1).^2+C(:,2).^2)/nb);



%% NSGA-II Main Loop

for it=1:MaxIt
    
    % Crossover
      pop2=repmat(individual,nCrossover/2,2);
      for k=1:nCrossover/2
  
          
          i1=BinaryTournamentSelection(pop);
          i2=BinaryTournamentSelection(pop);

          p1=pop(i1);
          p2=pop(i2);
            
           [pop2(k,1).Position, pop2(k,2).Position]=Crossover(p1.Position,p2.Position);         
           [pop2(k,1).Cost, pop2(k,1).Sol]=CostFunction(pop2(k,1).Position,model);
           [pop2(k,2).Cost, pop2(k,2).Sol]=CostFunction(pop2(k,2).Position,model);
  
      end
      pop2=pop2(:);
     
     % Mutation
      pop3=repmat(individual,nMutation,1);
      for k=1:nMutation
           
          
          
           i=BinaryTournamentSelection(pop);
           

           pop3(k).Position=Mutate(pop(i).Position);
           [pop3(k).Cost, pop3(k).Sol]=CostFunction(pop3(k).Position,model); 
                   
      end
     % Movement  
          pop4=repmat(individual,nMovement,1);
          for k=1:nMovement
              
    
              i=BinaryTournamentSelection(pop);
              
             pop1=repmat(individual,1,TournamentSelectionSize);
             pop1(1).Position=Movement(pop(i).Position,model);
             pop1_best=pop1(1);
             
             for j=2:TournamentSelectionSize
                 pop1(j).Position=Movement(pop(i).Position,model);
                 
                 if pop1(j).Rank<pop1_best.Rank                 
                     pop1_best=pop1(j);
                     
                 elseif pop1_best.Rank<pop1(j).Rank
                       
                    % Do Nothing
                else 
                      if pop1(j).CrowdingDistance>pop1_best.CrowdingDistance
                         
                          pop1_best=pop1(j);
                      else
                          % DO Nothing
                      end
                 end
             end
              
             pop4(k).Position=pop1_best.Position;
   
             [pop4(k).Cost, pop4(k).Sol]=CostFunction(pop4(k).Position,model);
             
   
         
          end
    
        
     % Local Search   
       pop5=repmat(individual,nLocalSearch,1);
       for k=1:nLocalSearch
           
 
            i=BinaryTournamentSelection(pop);
            
            pop6=repmat(individual,TournamentSelectionSize,1);
            pop6(1).Position=LocalSearch(pop(i).Position,model);
            pop6_best=pop6(1);
                    
           
            for j=2:TournamentSelectionSize
                   pop6(j).Position=LocalSearch(pop(i).Position,model);
 
                   if pop6(j).Rank<pop6_best.Rank                 
                       pop6_best=pop1(j);
 
                   elseif pop6(1).Rank<pop6(j).Rank
 
                       % Do Nothing
                   else 
                        if pop6(j).CrowdingDistance>pop6_best.CrowdingDistance
 
                            pop6_best=pop6(j);
                        else
                            % Do Nothing
                        end
                   end             
                
            end  
                
           pop5(k).Position=pop6_best.Position; 
            
           [pop5(k).Cost, pop5(k).Sol]=CostFunction(pop5(k).Position,model);
           

       end
    % Merge Populations
    pop=[pop
         pop2
         pop3
         pop4
         pop5]; %#ok
    
    % Non-Dominated Sorting
    [pop, F]=NonDominatedSorting(pop);

    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);    
    
    % Sort
    [pop F]=SortPopulation(pop); %#ok
    
    % Delete Extra Members
    pop=pop(1:nPop);
    
    % Non-Dominated Sorting
    [pop, F]=NonDominatedSorting(pop);
    
    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);
    
    % Sort
    [pop, F]=SortPopulation(pop);

    % Plot Fronts
    figure(1);
    PlotFronts(pop,F);
     
    
    % Display Results
    disp(['Iteration ' num2str(it) ': Number of F1 Members = ' num2str(numel(F{1}))]);
    
    % Objective Function Value

     A=[pop.Cost]';
     [a1,a2,a3]=unique(A(:,1));
     b=unique(a3);
     nb=numel(b);
     C=zeros(nb,2);
     for i=1:nb
         C(i,1)=a1(i);
         f=find(a3==i,1,'first');
         C(i,2)=A(f,2);
     end
    
     MID(it+1)=sum(sqrt(C(:,1).^2+C(:,2).^2)/nb);
     
    
    toc;
    
end

%% Results


figure(2);
plot(MID,'-','color','b');





