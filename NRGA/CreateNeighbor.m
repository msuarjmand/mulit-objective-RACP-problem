function sol2=CreateNeighbor(sol1)

    p1=sol1.q;
    

    
    m=randi([1 3]);
    
    switch m
        case 1
            % Do Swap
            p2=Swap(p1);
            
        case 2
            % Do Reversion
            p2=Reversion(p1);
            
        case 3
            % Do Insertion
            p2=Insertion(p1);
    end

    sol2.q=p2;
    
    
end

function p2=Swap(p1)

    n=numel(p1);
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);
    
    p2=p1;
    p2([i1 i2])=p1([i2 i1]);
    
end

function p2=Reversion(p1)

    n=numel(p1);
    
    i=randsample(n,2);
    i1=min(i(1),i(2));
    i2=max(i(1),i(2));
    
    p2=p1;
    p2(i1:i2)=p1(i2:-1:i1);

end

function p2=Insertion(p1)

    n=numel(p1);
    
    i=randsample(n,2);
    i1=i(1);
    i2=i(2);
    
    if i1<i2
        p2=[p1(1:i1-1) p1(i1+1:i2) p1(i1) p1(i2+1:end)];
    else
        p2=[p1(1:i2) p1(i1) p1(i2+1:i1-1) p1(i1+1:end)];
    end

end

