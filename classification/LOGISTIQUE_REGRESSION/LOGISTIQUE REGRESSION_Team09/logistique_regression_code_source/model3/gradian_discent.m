function theta=gradian_discent(input,theta,output,alfa,nb_it,nb_f,lambda)
  j=[];
  for i=1:length(output),
    # theta (7,1)   gradian   (7,1)
    theta = theta - alfa*gradian(input,theta,output);
    
    j= [j;cost_function(input,theta,output,lambda)];
  endfor
  
  figure(nb_f);
  plot(j);
  title("changement de cout de modele 3 par apport aux nombre d'iteration");
  xlabel('nb iteration');
  ylabel('cost');
endfunction
