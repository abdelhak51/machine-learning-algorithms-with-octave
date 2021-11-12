function  j= cost_function(input ,theta,output,lambda)
  cost=0;
  h=hypotses(input,theta);
  for i=1 :length(output),
    # la somme de cout pour chaque linge
     cost=cost+((-output(i)*log(h(i)))-((1-output(i))*log(1-h(i))));
  endfor
  # j(theta)= 1/M * somme (cout);
  j= ((-1/length(output))*cost)+ (lambda/(2*length(output))*sum(theta(2:end).^2));
endfunction
