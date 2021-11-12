function j=costfunction_team9(theta,X,y)
 %m=length(y);

sub=(hypothese_team9(theta,X)-y).^2;
 sub=sum(sub);
 const=1/(size(y,1)*2);
 j=const*sub;
  
end
