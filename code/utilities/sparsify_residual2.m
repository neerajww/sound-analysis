% Last edit 5 June 2019, by Neeraj Sharma (CMU)

%% get the residual
         
         function [sig_res]=sparsify_residual2(sigHw,Akt,wlen,pAR)
         %% input: sigHw(windowed signal), Akt(LPCnts), K(sparsity order) 
         Akt=Akt(:);
         SIG=zeros(wlen,pAR);
               for i=1:wlen
                   for j=1:pAR
                       if(i-j<=0)
                           SIG(i,j)=0;
                       else
                           SIG(i,j)=sigHw(i-j);
                       end
                   end
               end
         % get the residual signal
         sig_res=(sigHw+SIG*Akt(2:end));   
         %sig_res=sig_res.*(1./hw);
         %[r rindx]=sort(abs(sig_res),'descend');
         %% obtain the sparsity for the frame using pitch period estimation
         % p_fr=pitch_praat(frmindx,nFrames,fol)
         % p_fr=pitch_praat(frmindx,nFrames,fol,fil);      % read in Hz
         % K=fix(wmsec*p_fr)+10;
         return