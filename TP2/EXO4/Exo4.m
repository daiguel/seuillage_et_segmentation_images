img=imread('citron.jpg');%lire l'image en specifiant son chemin
imaGray=rgb2gray(img);%convertire l'image en niveau de gris 

%afficher l'image d'origine
subplot(2,3,1);
imshow(img);
title('image d"origine ');

%afficher l'image en gris
subplot(2,3,2);
imshow(imaGray);
title('image en niveau de gris');

%afficher l'image traiter avec la foction q'on a implementer du seuillage Locale par mediane
[ imageLocalMediane ] = SeuillageLocaleParMedianne( imaGray,16, 16);%les deux parametres represente le nombre de blocks par lignes et le  nombre de blocks par colomnes
subplot(2,3,3);
imshow(imageLocalMediane);
title('Locale par Mediane');

%afficher l'image traiter avec la foction q'on a implementer du seuillage Locale Otsu1
[imageLocaleOtsu1] = SeuillageLocaleOtsu1(imaGray,16,16);%plus les deux valeur sont petite plut le programme s'execute rapidement 
subplot(2,3,4);
imshow(imageLocaleOtsu1);%afficher l'image apres le seuillage par Medianne
title('Locale par Otsu1 ');

%afficher l'image traiter avec la foction q'on a implementer du seuillage Locale otsu2
[imageLocaleOtsu2] = SeuillageLocaleOtsu2(imaGray,2,2);
subplot(2,3,5);
imshow(imageLocaleOtsu2);
title('Locale par Otsu2 ');
%afficher l'image aprés le traitement avec la fonction du seuillage locale isodata 
[ imageIsoData ] = SeuillageLocaleParIsoData( imaGray,2,2 );
subplot(2,3,6);
imshow(imageIsoData);
title('Locale IsoData ')