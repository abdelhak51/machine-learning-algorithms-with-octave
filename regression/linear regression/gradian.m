function g=gradian(theta,X,y)
  m=size(y,1);
  h= hypothese_team9(theta,X);
  dj=h-y ;  % pour matirce dj(m*1) 
  dj=X'*dj ;         %pour matirce X' (2*m)
  g=(1/m)*dj ;  %donc g = (2*1)
end
