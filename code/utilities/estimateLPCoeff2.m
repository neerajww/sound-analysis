% Last edit 5 June 2019, by Neeraj Sharma (CMU)
% Modified using the template taken from Srikanth Raj (IISc)

function ret=estimateLPCoeff2(sigHw,pAR)
%% input sigHw= windowed speech signal
% created on 24-04-15, to take pAR as input arg
%% output ret= LP coefficients
    Rm = xcorr(sigHw,sigHw,pAR);	% symmetric autocorrelation function            
    Rm = Rm(pAR+1:end);            
    [Ak E] = lvdrb1(Rm,pAR);		% AR modeling through LD recursion                

    ret=Ak;

return