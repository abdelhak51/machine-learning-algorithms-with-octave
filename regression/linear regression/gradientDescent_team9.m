
function [theta,v]=gradientDescent_team9(X,y,theta,alfa,nb_iteration)
  
 v=[];
  for i=1:nb_iteration 
    g= gradian(theta,X,y);
    theta= theta-((alfa/length(y))*g);
    v=[v;costfunction_team9(theta,X,y)];
  end
 
  figure('name','test alpha');
  plot (v, '-b', 'LineWidth', 2);
  % L'axe des X
  xlabel('It?rations');
  % L'axe des Y
  ylabel('Cost J');
  end
