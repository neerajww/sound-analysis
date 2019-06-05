% Last edit 5 June 2019, by Neeraj Sharma (CMU)
% Modified using the template taken from Srikanth Raj (IISc)

% ------------------------------------------------------------------
% YWEquation solution using Levinson-Durbin recursion; the function
% returns the LPC, reflection coefficients and the prediction error
% of all the recursion stages, unlike the matlab functions LPC or
% LEVINSON. (this is a vectorized form of lvdrb.m)
%
% To call: [Ak,En,rc] = lvdrb(Rm,p); Rm is autocorrelation vector;
%           p is lpc order; Ak is a vector of 1 x p+1; 
%          'p' may be omitted if length(Rm) can be used; so
%          also 'rc' and 'En' can be omitted; if rc is omitted
%          then only the pth order Ak vector is returned.
% ------------------------------------------------------------------
  function [Ak,En,rc] = lvdrb1(Rm,p);
% ------------------------------------

  if nargin < 2, p = length(Rm)-1; end	% set implicit parameters

  Rm = Rm(:);
  En(1) = Rm(1);
  Ak = -Rm(2)/Rm(1);
  rc(1) = Ak;
  V = Rm(1) - Rm(2)^2/Rm(1);
  En(2)=V;
  Am(1,:)=[1 zeros(1,p)];
  Am(2,:)=[1 Ak zeros(1,p-1)];
  for n = 1:p-1,
      alfa = [1 Ak.']*Rm(n+2:-1:2);
      rho = -alfa / V;
      rc(n+1) = rho;
      V = V + rho*alfa;
      En(n+2) = V;
      Ak = [Ak+rho*flipud(Ak); rho];
      Am(n+2,:)=[1 Ak.' zeros(1,p-n-1)];
  end

  if (nargout > 2) Ak = Am;
  else Ak = [1; Ak].';
  end

% --------------------------------------------------------------------