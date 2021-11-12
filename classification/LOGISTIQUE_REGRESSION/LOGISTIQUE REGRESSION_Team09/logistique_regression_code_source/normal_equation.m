function theta= normal_equation(input,output,lambda)
  l=size(input,2)+1;
  X=input;
  id = eye(l);
  id(1,1)=0;
  f=lambda*id;
  X=[ones(length(input),1) input];
  Y=output;
  #pinv(X) ----> inv(X'*X)*X
  theta= pinv(X'*X+f)*(X'*output);
endfunction
