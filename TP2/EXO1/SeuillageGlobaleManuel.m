function [ imgManuelle ] = SeuillageGlobaleManuel( img )
[nl, nc]=size(img);%récuperer la taille de l'image
seuille=input('Choisir un seuille  ?\n') ;%demander a l'utilisteur d'introduire un seuille manuellement 
rsltImg=zeros(nl,nc);%intialiser a 0 la matrice de l'image resultante

for i=1:nl %parcourir la matrice 
    for j=1:nc
        if(img(i,j)<seuille)%si le pixel de l'image < au seuille on affect 0 a l'image resultante
            rsltImg(i,j)=0;
        else                %sinon si >= on affecte 1
            rsltImg(i,j)=1;
        end
    end
    imgManuelle=rsltImg;%

end

