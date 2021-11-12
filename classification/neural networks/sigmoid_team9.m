%%% activate function sigmoid function 

function g=sigmoid_team9(theta,x)
  g=1 ./(1+ e.^-(theta*x));
endfunction
