function h=hypotses(input,theta)
  h=[];
  #  m ---> theta'*input
  m=model_d(input,theta);
  h=sigmoid(m);
  
  
endfunction
