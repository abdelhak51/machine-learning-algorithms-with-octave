function y=sigmoid(x)
  y=[];
  for i=1 : length(x),
    y= [y; 1/(1 + exp(x(i)*(-1)))];
  endfor
endfunction
