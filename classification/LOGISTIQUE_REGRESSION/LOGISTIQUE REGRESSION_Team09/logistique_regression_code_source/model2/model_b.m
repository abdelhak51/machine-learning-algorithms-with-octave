function model= model_b(input,theta)
  model=[];
  for i=1 : length(input),
    # m= t1 + (x1 + x2 + x3 + x4 + x5)*t2 + x6*t7
    model=[model;theta(1)+ theta(2)*(input(i,1) + input(i,2) + input(i,3) + input(i,4) + input(i,5) )+ theta(7)*input(i,6)];
  endfor
endfunction
