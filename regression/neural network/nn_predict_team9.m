% la fonction ci dessous est pour tester notre modele avec les meilleures thetas (n'est pas appelée)
function pred= nn_predict_team9(input,output,theta_g1,theta_g2)
   
   base=input';
   pred=[];
  for j=1:size(base,2)
  a2=sigmoid(theta_g1,base(:,j));
    a3=sigmoid(theta_g2,a2);
    
  endfor
  pred=[pred,a3];
endfunction
