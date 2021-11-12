function theta= equation_normal_team9(input,output,lambda)
  l=size(input,2);
  X=input;
  id = eye(l);
  id(1,1)=0;
  f=lambda*id;
  %pinv(X) ----> inv(X'*X)*X
  theta= pinv(X'*X+f)*(X'*output);
end