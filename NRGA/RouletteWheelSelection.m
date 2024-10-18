function i=RouletteWheelSelection(P)

    C=cumsum(P);
    
    i=find(rand<=C,1,'first');

end