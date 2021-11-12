function h=hypotses(input,theta)
  h=[];
  #  m ---> theta'*input
  m=model_c(input,theta);
  h=sigmoid(m);
  
  
endfunction
