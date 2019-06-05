% Last edit 5 June 2019, by Neeraj Sharma (CMU)
% Modified using the template taken from Srikanth Raj (IISc)

function ret=estimateLPCoeff(sigHw)
%% input sigHw= windowed speech signal
%% output ret= LP coefficients
    global params
    Rm = xcorr(sigHw,sigHw,params.pAR);	% symmetric autocorrelation function            
    Rm = Rm(params.pAR+1:end);            
    [Ak E] = lvdrb1(Rm,params.pAR);		% AR modeling through LD recursion                

    ret=Ak;

return
