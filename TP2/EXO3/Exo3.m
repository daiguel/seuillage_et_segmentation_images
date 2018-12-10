img=imread('effel.jpg');%lire l'image
imaGray=rgb2gray(img);%convertire l'image en niveau de gris 

%afficher l'image en gris
[ Otsu2 ] = Otsu2( imaGray ); 
subplot(2,3,3); 
imshow(Otsu2);
title('Otsu2');

%afficher l'image dorigine
subplot(2,3,1);
imshow(img);
title('image d"origine');


%afficher l'image en niveau de gris
subplot(2,3,2); 
imshow(imaGray);
title('niveau de gris');

%afficher l'image resultante de la fonction pTile
[ imgOtsu1 ] = otsu1( imaGray );
subplot(2,2,4); 
imshow(imgOtsu1);
title('Otsu1');