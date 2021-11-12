function h=hypotses(input,theta)
  h=[];
  #  m ---> theta'*input
  m=model_b(input,theta);
  h=sigmoid(m);
  
  
endfunction
