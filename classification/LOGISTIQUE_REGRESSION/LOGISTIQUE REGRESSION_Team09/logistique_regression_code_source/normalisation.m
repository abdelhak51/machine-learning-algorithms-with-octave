function data=normalisation(data)
  
  for i=1 :size(data,2),
    max1=max(data(:,i));
    min1=min(data(:,i));
    average=(max1-min1)/2;
    for j=1 :size(data,1),
      data(j,i)=(data(j,i)-average)/(max1-min1);
    endfor
    
  endfor
 
 
 
 
 
 
 
 
 
 
 
 
 
 #{
 for i=1:size(a{1}, 1);
 
   for j=1:size(a{1}, 2);
    a{1}(i,j)=(sum(f(i,:))-a{1}(i,j))./max(f(i,:))-min(f(i,:));
   endfor


endfor
#}
endfunction
