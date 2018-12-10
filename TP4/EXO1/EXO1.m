imgOr= imread('image.jpg');  


[ imgQTR ] = segmentationQTR( imgOr, 20,10);%le preimier paramétre limage deuxieme le rayon 3eme le nombre minimum quil faut avoir dans un cluster
%afficher l'image apres la segmentation QTR c les resultats affiche ne sont
%pa bon il faut refaire l'éxecution jusqu'a obtention d'un bon resultat
%cela est dus au choix aléatoir du centre de depart
subplot(1,2,2);
imshow(imgQTR);
title('QTR');

%afficher l'image d'orignie 
subplot(1,2,1);
imshow(imgOr);
title('image originale');
