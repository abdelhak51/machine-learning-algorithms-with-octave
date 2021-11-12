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
#accéder au dossier :
cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source';

#entrinement d algoritheme d'imprentissae avec la data set d'entrinement.



#calcule de theta on utilisons la function normal equation.
theta= normal_equation(training_in,training_out,0.3);

#la fonction J_err est dans le dossier:
cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source/model1';

#on clalcule le taux erreur de l'imprentissage du training data set.
taux_err_training_m_a=J_err(training_in,theta,training_out);
#on clalcule le taux erreur de l'imprentissage du cv data set.
taux_err_cv_m_a=J_err(cv_in,theta,cv_out);
#on clalcule le taux erreur de l'imprentissage du test data set.
taux_err_test_m_a=J_err(cv_in,theta,cv_out);

#revenir au dossier prancipale:
cd 'C:/Users/ST/Desktop/projet_IA/LOGISTIQUE REGRESSION_Team09/logistique_regression_code_source';

disp(' ------------------------------------------------------');
disp(' ------------------------------------------------------');
disp('algoritheme d''aprentissage Equation Noramle ');
disp(' ------------------------------------------------------');
disp(' ------------------------------------------------------');
 
disp('taux d erreur de training data  est');
disp(taux_err_training_m_a);
disp('taux d erreur de cross validation data  est');
disp(taux_err_cv_m_a);
disp('taux d erreur de cross test data  est');
disp(taux_err_test_m_a);
disp(' ------------------------------------------------------');
