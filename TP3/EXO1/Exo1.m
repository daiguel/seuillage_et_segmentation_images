imga=imread('citron.jpg');
imgGray=rgb2gray(imga);%transfomer l'image en niveau de gris  

subplot(2,3,1);
imshow(imga);%afficher l'image 
title('image d"origine');

subplot(2,3,2);
imshow(imgGray);%afficher l'image 
title('image niveau de gris');

[ imgMoyenne ] = SeuillageDynamiqueParMoyenne( imgGray );%appler la fonction qui fait le seuillage par Moyenne
subplot(2,3,3); 
imshow(imgMoyenne);%afficher l'image apres le seuillage par Moyenne
title('dynamique moyenne');

[ imgMediane] = SeuillageDynamiqueParMedianne( imgGray );%appler la fonction qui fait le seuillage par Medianne
subplot(2,3,4);
imshow(imgMediane);%afficher l'image apres le seuillage par Medianne
title('dynamique Medianne');


[ imgMoyenneCST] = SeuillageDynamiqueParMoyenneCST( imgGray );%appler la fonction qui fait le seuillage par moyenne plus constante
subplot(2,3,5);
imshow(imgMoyenneCST);%afficher l'image apres le seuillage par moyenne plus constante
title('dynamique Moyenne+CST');

[ imgMedianeCs] = SeuillageDynamiqueParMedianneCST( imgGray );%appler la fonction qui fait le seuillage par Medianne plus constante
subplot(2,3,6);
imshow(imgMedianeCs);%afficher l'image apres le seuillage par Medianne plus constante
title('dynamique Medianne+CST');

