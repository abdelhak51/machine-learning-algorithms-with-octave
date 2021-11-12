#importer les datas sets 
load bupa_v2.txt
bupa_in=normalisation(bupa_v2(:,1:6));
bupa_out=bupa_v2(:,7);
#data set d entrinement

training_in=bupa_in(1:207,:);
training_out=bupa_out(1:207,:);

#data set de validation

cv_in=bupa_in(208:277,:);
cv_out=bupa_out(208:277,:);

#data set de test 

test_in=bupa_in(277:345,:);
test_out=bupa_out(277:345,:);

clear ("bupa_in");
clear("bupa_out");
clear("bupa_v2");


#inprentissage 1 on utilisont le modele 1
#accéder au dossier modele 1:
cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source/model1';

#entrinement d algoritheme d'imprentissae avec la data set d'entrinement.

#initialisation de theta.
theta = randn(7,1); # la taille 7*1.

#calcule de theta on utilisons le gradian discent.
nouveau_theta= gradian_discent(training_in,theta,training_out,0.01,100,1,0.03);
#on clalcule le taux erreur de l'imprentissage du training data set.
taux_err_training_m_a=J_err(training_in,nouveau_theta,training_out);
#on clalcule le taux erreur de l'imprentissage du training data set.
taux_err_cv_m_a=J_err(cv_in,nouveau_theta,cv_out);


disp(' ------------------------------------------------------');
 disp(' ------------------------------------------------------');
 
 disp(' algoritheme d''apprentissage Gradient discent');
 
 disp(' ------------------------------------------------------');
 disp(' ------------------------------------------------------');
 
disp('taux d erreur de training data pour le modele 1 est');
disp(taux_err_training_m_a);
disp('taux d erreur de cross validation data pour le modele 1 est');
disp(taux_err_cv_m_a);
disp('    ------------------------------------------------------');



#inprentissage 1 on utilisont le modele 2
#accéder au dossier modele 1:
cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source/model2';
#entrinement d algoritheme d'imprentissae avec la data set d'entrinement.

#initialisation de theta.
theta2 = randn(7,1); # la taille 7*1.

#calcule de theta on utilisons le gradian discent.
nouveau_theta2= gradian_discent(training_in,theta2,training_out,0.01,100,2,0.03);
#on clalcule le taux erreur de l'imprentissage du training data set.
taux_err_training_m_b=J_err(training_in,nouveau_theta2,training_out);
#on clalcule le taux erreur de l'imprentissage du training data set.
taux_err_cv_m_b=J_err(cv_in,nouveau_theta2,cv_out);
 
disp('taux d erreur de training data pour le modele 2 est');
disp(taux_err_training_m_b);
disp('taux d erreur de cross validation data pour le modele 2 est');
disp(taux_err_cv_m_b);


disp('    ------------------------------------------------------');


#inprentissage 1 on utilisont le modele 2
#accéder au dossier modele 1:
cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source/model3';
#entrinement d algoritheme d'imprentissae avec la data set d'entrinement.

#initialisation de theta.
theta3 = randn(7,1); # la taille 7*1.

#calcule de theta on utilisons le gradian discent.
nouveau_theta3= gradian_discent(training_in,theta3,training_out,0.01,100,3,0.03);
#on clalcule le taux erreur de l'imprentissage du training data set.
taux_err_training_m_c=J_err(training_in,nouveau_theta3,training_out);
#on clalcule le taux erreur de l'imprentissage du training data set.
taux_err_cv_m_c=J_err(cv_in,nouveau_theta3,cv_out);
 
disp('taux d erreur de training data pour le modele 3 est');
disp(taux_err_training_m_c);
disp('taux d erreur de cross validation data pour le modele 3 est');
disp(taux_err_cv_m_c);


disp('    ------------------------------------------------------');


#inprentissage 1 on utilisont le modele 4
#accéder au dossier modele 1:
cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source/model4';
#entrinement d algoritheme d'imprentissae avec la data set d'entrinement.

#initialisation de theta.
theta4 = randn(7,1); # la taille 7*1.

#calcule de theta on utilisons le gradian discent.
nouveau_theta4= gradian_discent(training_in,theta4,training_out,0.01,100,4,0.03);
#on clalcule le taux erreur de l'imprentissage du training data set.
taux_err_training_m_d=J_err(training_in,nouveau_theta4,training_out);
#on clalcule le taux erreur de l'imprentissage du training data set.
taux_err_cv_m_d=J_err(cv_in,nouveau_theta4,cv_out);
 
 
 
disp('taux d erreur de training data pour le modele 4 est');
disp(taux_err_training_m_d);
disp('taux d erreur de cross validation data pour le modele 4 est');
disp(taux_err_cv_m_d);


disp(' ------------------------------------------------------');



#revenir au dossier prancipale:
cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source';

histograme=[taux_err_training_m_a,taux_err_cv_m_a;taux_err_training_m_b,taux_err_cv_m_b;taux_err_training_m_c,taux_err_cv_m_c;taux_err_cv_m_d,taux_err_training_m_d];
figure(5);
bar(histograme,0.9,'grouped');
title("le taux d erreur de training et cv pour les 4 modele")
xlabel('modele'); ylabel('le taux d erreur');
legend('taux d erreur de reaning','taux d erreur de cross valida'); 


#choix de model
#on prende le model qui a le plus minimum d'erreur

erreur_cv=[taux_err_cv_m_a,taux_err_cv_m_b,taux_err_cv_m_c,taux_err_cv_m_d]
min = 1;
for i=2 :length(erreur_cv),
  
  if(erreur_cv(1,i) < erreur_cv(1,min)),
    min = i;
    disp(erreur_cv(1,i));
    disp(min);
  endif
endfor
disp(min);
if(min == 1),
  disp("je suis dans model 1");
  cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source/model1';
endif

if(min == 2),
  disp("je suis dans model 2");  
  cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source/model2';
endif

if(min == 3),
  disp("je suis dans model 3");
  cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source/model3';
endif

if(min == 4),
  disp("je suis dans model 4");
  cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source/model4';
endif









tab_err_traiining=[];
tab_err_cv=[];
tab_err_test=[];
for i=1 : 25,
   disp("boucle");
   theta_initiale=randn(7,1);
   new_theta=gradian_discent_v2(training_in,theta_initiale,training_out,0.03,50);
   err_training=J_err(training_in,new_theta,training_out);
   tab_err_traiining=[tab_err_traiining,err_training] ;
   
   err_cv=J_err(cv_in,new_theta,cv_out);
   tab_err_cv=[tab_err_cv,err_cv];
   
   err_test=J_err(test_in,new_theta,test_out);
   tab_err_test=[tab_err_test,err_test];
 
 endfor
  figure(7);
    plot(tab_err_traiining,'r');
    hold on;
    plot(tab_err_cv,'b');
    plot(tab_err_test,'g');
    grid('on'); 
    xlabel('nb iteration'); ylabel('erreur de coût');
    legend('err training','err cv','err test'); 


#revenir au dossier prancipale:
cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source';


