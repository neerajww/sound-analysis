function ret=InvFilImpResp(Ak,K,pAR)
    
%   pAR=length(Ak)-1;
    synFiltQ = [1 zeros(1,K-1)];       % impulse input
    for n = 2:K,                       % zero-state response of synFilt        
        tmp1 = 0;
        for k = 1:min(n-1,pAR),        
            tmp1 = tmp1 + Ak(k+1)*synFiltQ(n-k);            
        end        
        synFiltQ(n) = -tmp1;           % compute IIR upto windsiz         
    end
    ret=synFiltQ';
return;