function sum_err=J_err(input,theta,output)
  h=hypotses(input,theta);
  err=[];
  
  for i=1 : length(h)
    if((h(i) >= 0.5)&&(output(i)==0))||((h(i) < 0.5)&&(output(i)==1)),
      err=[err,1];
    else
      err=[err,0];
    end
  endfor
  sum_err=(1/length(output))*sum(err);
endfunction
