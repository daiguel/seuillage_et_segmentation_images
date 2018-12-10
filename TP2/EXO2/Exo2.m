img=imread('image.jpg');%lire l'image
imaGray=rgb2gray(img);%convertire l'image en niveau de gris 

%afficher l'image d'origine
subplot(2,3,1);
imshow(img);
title('image d"origine');

%afficher l'image en niveau de gris
subplot(2,3,2); 
imshow(imaGray);
title('image en niveau de gris');

%appele a la fonction qui fait le seuillage pTile le premier paramétre est 
%l'image en niveau de gris  le deuxime paramétre c'est le font de l'objet claire(1) ou sombre(0) le 3éme paramétre  
[imagePtile] = pTile(imaGray,0,50); 
%afficher l'image resultante de la fonction pTile
subplot(2,3,3); 
imshow(imagePtile);   
title('p-tile');   

[imageIsoData]=isodata(imaGray);
subplot(2,3,4); 
imshow(imageIsoData);
title('IsoData'); 
