function gradian=gradian(input,theta,output)
  h=hypotses(input,theta);
  #ajouter le bais = 1
  input= [ones(length(input),1) input];
  # h-output (m*1)   input'   (7*m)    j (7,1)
  gradian=1/length(output)*(input'*(h-output));
endfunction
