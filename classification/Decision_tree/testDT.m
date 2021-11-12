clear ; close all; clc

data = xlsread('myData');
X=data(:,1:8);
y1=data(:,9);
y2=data(:,10);
 Y1_categoriezed = discretize(y1,3, 'categorical', ...
    {'low', 'medium','high'});
Y2_categoriezed = discretize(y2,3, 'categorical', ...
    {'low', 'medium','high'});

indx=randperm(768);

X_train=X(indx(1:538),:);
Y1_trainLabels=Y1_categoriezed(indx(1:538),:);
Y2_trainLabels=Y2_categoriezed(indx(1:538),:);
X_test=X(indx(539:end),:);
Y1_testLabels=Y1_categoriezed(indx(539:end),:);
Y2_testLabels=Y2_categoriezed(indx(539:end),:);
Arbre1= fitctree(X_train,Y1_trainLabels);

Arbre2= fitctree(X_train,Y2_trainLabels);
view(Arbre1,'mode','graph');
view(Arbre2,'mode','graph');


labels_y1=predict(Arbre1,X_test);

labels_y2=predict(Arbre2,X_test);

