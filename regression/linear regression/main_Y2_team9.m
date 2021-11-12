%importer la data set 
data= load ('energy_normalise.txt');
%division des instances 
%apprentissage
x_train = data(1:537,1:8);
y_train = data (1:537,10);
%test
x_test_1 =data(538:653,1:8);
y_test_1 = data (538:653,10);
%validation
x_validation = data(653:768,1:8);
y_validation = data (653:768,10);
%Enregister la taille de output dans une varriable m
m=length(y_train);

%Ajouter une colonne X0 itialise a 1 dans le vecteur X(l'input) 
x_train = [ones(m, 1) x_train];


% initilaliser alpha et nombre d'iterations
alpha = 0.5;
iteration = 10000;

% Initialiser le vecteur de theta
theta = rand(9,1);

% Appel de la fonction gradientDescent
v =[]; 
[theta,v]= gradientDescent_team9(x_train, y_train, theta, alpha, iteration);
fprintf('les theta de gradient descent sont \n');
disp(theta);


%afficher la valeur la valeur de cout 
fprintf ('la valeur de cout  %f \n',v(90000) ) ;


%afficher les theta de l'equation normal
lambda = 0 ; 
thetaeq=equation_normal_team9(x_train ,y_train ,lambda);
fprintf('les theta de lequation normal sont \n');
disp(thetaeq);

%Ploter l'hypothese H avec les donnees
figure('name','hypothese avec gradientDescent');
plot(x_train(:,2)+x_train(:,3)+x_train(:,4)+x_train(:,5)+x_train(:,6)+x_train(:,7)+x_train(:,8), y_train, 'r+', 'MarkerSize', 10);
hold on;
H = hypothese_team9(thetaeq,x_train);
plot (x_train(:,2)+x_train(:,3)+x_train(:,4)+x_train(:,5)+x_train(:,6)+x_train(:,7)+x_train(:,8), H, '-');
legend('data','Hypoth?se');
  % L'axe des Y
ylabel('OUTPUT'); 
  % L'axe des X
xlabel('INPUT');
hold off;


%% partie 2 predition des valeurs restantes
x_rest = data (653:768,1:8);
y_rest = data (653:768,9);
x_rest = [ones(size(x_rest,1), 1), x_rest(:,:)];
%predicter les y 
y_predict=x_rest * thetaeq;
%%precision entre reel et predit

%plot predict et reel dans le mm graphe
plotHypo(y_rest,y_predict);
diff = abs(y_rest-y_predict);
precision=mean(diff);

fprintf('la precision utilsant normal equqtion est  %f \n',precision);

y_predictgd=x_rest * theta;
diff = abs(y_rest-y_predictgd);
precision=mean(diff);
fprintf('la precision utilisant gradient descent %f \n',precision);

%prediction 
x_t = [ones(size(x_train,1), 1), x_train(:,:)];
x_v = [ones(size(x_validation,1), 1), x_validation(:,:)];
predictionTrain=hypothese_team9(theta,x_train);
predictionvld=hypothese_team9(theta,x_v);
%calcule precision
precision=mean(abs(predictionTrain-y_train));
precisionvld=mean(abs(predictionvld-y_validation));
fprintf('la precision de la partie train  est  %f \n',precision);
fprintf('la precision de la partie validation  est %f \n',precisionvld);

y= [1.00 1.00 0.64 0.71 0.50 1.00 1.00 0.00 0.00];

y_predicteq= y* thetaeq ;
y_predictgd= y* theta; 



