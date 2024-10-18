function i=ParetoRouletteWheelSelection(F)

    nF=numel(F);
    
    PF=nF:-1:1;
    PF=PF/sum(PF);
    
    f=RouletteWheelSelection(PF);
    
    n=numel(F{f});
    
    P=n:-1:1;
    P=P/sum(P);
    
    k=RouletteWheelSelection(P);
    
    i=F{f}(k);

end