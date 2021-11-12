 
   % charger la base de donnee 
  load inputdata.txt;
  load outdata.txt;
  %epsilon pour gerer thetas au debut
  
  epsilon=0.12
  %load 'besttheta1.txt'
  %load 'besttheta2.txt'
  % input data
  
  input=input;
  %output data
  output=out;
  % nombre d'iteration
  iter=6;
  % vecteur pour stocker les le cout
  train=[];
  pred=[];
  # ajouter la biaiss 
  input=[ones(rows(input),1),input];
  #pred_in=[ones(rows(pred_in),1),pred_out];
  J=0;
  s=0;
  s2=0;
  e=0;
  g=e;
  theta_2_reg=[];
  theta_1_reg=[];
  theta_grad1=[];
  theta_grad2=[];
  
  
  
  
  #initialisation des theta
  theta_one=rand(4,size(input, 2))* 2 * epsilon - epsilon;
  theta_two=rand(1,4)* 2 * epsilon - epsilon;
  
  #inverser la base 
  
  base=input';
  
  #
  for i= 1:iter
    for j=1:size(base,2)
 
 
   %forward propagation
   
    #fonction d'activation a2= theta * instence J (1*4)   
    a2=sigmoid_team9(theta_one,base(:,j));
    
    #fonction d'activation a3 (1*1)
    a3=theta_two*a2;
    #○a3=sigmoid_team9(theta_two,a2);
    
    
      %backpropagation implementation
    
    % erreur de troisieme coche
    error_three=a3-output(j);
    e=output(j)-a3;
    
    % erreur de deuxieme coche

    error_two=(theta_two' * error_three) .* a2 .*(1-a2);
    theta_grad1= theta_one - (error_two * base(:,j)');
    theta_grad2= theta_two - (error_three * a2');
    
    %substract gradient for calcule the derivate
    theta_2_reg=theta_two; theta_2_reg(:,1)=0;
    theta_1_reg=theta_one; theta_1_reg(:,1)=0;
    
    
   J += -output(j,:)*log(a3)-(1-output(j,:))*log(1-a3); 
    s=J/size(input,2);
    
    

     #vecteur pour stocker les valeur de (y- hypothese) pour voir le taux d'ereur 
     
    
   
  endfor
  # regularisation avec le cout et gradient descent
    # first column is empty 
    %theta_2_reg=theta_two; theta_2_reg(:,1)=0;
    #theta_1_reg=theta_one; theta_1_reg(:,1)=0;
   # J=J/m+lambda/(2*m) * (sum(theta_1_reg.^2)(:))+sum(theta_2_reg.^2)(:)));
   
  %substract  %gradient
    %theta_grad1= theta_one - (error_two * base(:,j)');
    %theta_grad2= theta_two - (error_three * a2');
    
  theta_one=theta_grad1;
  theta_two=theta_grad2;
  
  #pred=[pred,nn_predict(input,output,theta_one,theta_two)];
  train=[train,e];
  
  
endfor
%pred=nn_predict(input,output,besttheta1,besttheta1);
plot(train,"r-");
%hold on;
%plot(pred,"b-");
%hold off;
printf('\n O1 =  \n');
disp(theta_one)
printf('\n O2 =  \n');
disp(theta_two)
printf('\n y_train =  \n');
% afficher la derniere valeur pour verifier
  disp(a3); 



