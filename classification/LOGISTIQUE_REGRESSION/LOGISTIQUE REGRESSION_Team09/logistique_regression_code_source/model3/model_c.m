function model= model_c(input,theta)
  model=[];
  for i=1 : length(input),
    # m= t1 + x1*t2 + x2*t3 + x3*t4 + x4*t5 + x5*t6 + x6*t7
    model=[model;theta(1)+ theta(2)*input(i,1)^2 + theta(3)*input(i,2)^2 + theta(4)*input(i,3)^2 + theta(5)*input(i,4)^2 + theta(6)*input(i,5)^2 + theta(7)*input(i,6)^2];
  endfor
endfunction
