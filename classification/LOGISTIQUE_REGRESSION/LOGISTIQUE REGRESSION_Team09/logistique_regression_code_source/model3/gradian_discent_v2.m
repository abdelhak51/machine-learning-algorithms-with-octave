function theta=gradian_discent_v2(input,theta,output,alfa,nb_it)
  j=[];
  for i=1:length(output),
    # theta (7,1)   gradian   (7,1)
    theta = theta - alfa*gradian(input,theta,output);
  
  endfor
 
  
endfunction
