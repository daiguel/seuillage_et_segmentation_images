imgOr= imread('image.jpg'); 


[ imageKmeans ] = segmentationKmeans(imgOr , 0.1 );


%afficher l'image apres le traitement de kmeans qui sert a segmenter
%l'image 
subplot(1,2,2);
imshow(imageKmeans);
title('k-means');

%afficher l'image d'orignie 
subplot(1,2,1);
imshow(imgOr);
title('image originale');