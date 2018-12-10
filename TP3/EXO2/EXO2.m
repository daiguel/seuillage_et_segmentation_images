img =imread('image.jpg');
imgGray=rgb2gray(img);%transfomer l'image en niveau de gris

[ imageSauvola ] = SeuillageDynamiqueSauvola( imgGray );
subplot(2,3,1);
imshow(imageSauvola);
title('Dynamique sauvola');

[ imageNilback ]=SeuillageDynamiqueNilback( imgGray );
subplot(2,3,2);
imshow(imageNilback);
title('Dynamique Nilback');

[ imageBernsen ] = SeuillageDynamiqueBernsen( imgGray );
subplot(2,3,3);
imshow(imageBernsen);
title('Dynamique Bernsen');

subplot(2,3,4);
imshow(img);
title('image d"origine');

subplot(2,3,5);
imshow(imgGray);
title('image d"origine');