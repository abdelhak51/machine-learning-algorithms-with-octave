function h=hypotses(input,theta)
  h=[];
  #  m ---> theta'*input
  m=model_a(input,theta);
  h=sigmoid(m);
  
endfunction
