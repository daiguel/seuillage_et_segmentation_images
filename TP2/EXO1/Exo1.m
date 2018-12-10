img=imread('lyes.jpg');%lire l'image
imaGray=rgb2gray(img);%convertire l'image en niveau de gris 

%attention la fonction SeuillageGlobaleManuel demande a l'utilisateur de saisir une valeur si vous ne fetes pas ca rien ne va s'afficher    

%afficher l'image apres le seuillage Manuel a tester sur cette image autour 90 pour
%obtenir des bon resultats donc il faut lui donner la bonne valeur pour avoir des bon resultats 
[ imgManuel ] = SeuillageGlobaleManuel( imaGray );%appler la fonction qui fait le seuillage par Manuelle
subplot(2,3,3);%diviser la fenetre en 5 lots pour afficher l'image d'origine le resultat de chaque fonction de seuillage 
imshow(imgManuel);
title('globale manuelle');

%afficher l'image apres le seuillage par Moyenne
[ imgMoyenne ] = SeuillageGlobaleParMoyenne( imaGray );%appler la fonction qui fait le seuillage par Moyenne
subplot(2,3,4); 
imshow(imgMoyenne); 
title('globale Moyenne');

%afficher l'image apres le seuillage par Medianne
[ imgMediane] = SeuillageGlobaleParMedianne( imaGray );%appler la fonction qui fait le seuillage par Medianne
subplot(2,3,5);
imshow(imgMediane);
title('globale Médiane');

%afficher l'image D'origine
subplot(2,3,1);
imshow(img);
title('image d"origine');

%afficher l'image en niveau de gris
subplot(2,3,2); 
imshow(imaGray);
title('image en niveau de gris');