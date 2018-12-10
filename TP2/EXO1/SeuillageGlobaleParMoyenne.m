function [ rslt ] = SeuillageGlobaleParMoyenne( img )
[nl, nc]=size(img);%récuperer la taille de l'image 
some=sum(img(:));%convertire la matrice en un vecteur et calculer la somme de toute les elements de la matrice avec la fonction sum
moy=some/(nl*nc);%calculer la moyenne en divisant sur le total des elments  nombre de lignes * nombre de colomne
%on peux  calculer la moyenne avec la fonction mean(img) directement on ignorant les deux etapes précedente 
rsltImg=zeros(nl,nc);%intialiser a 0 la matrice de l'image resultante


for i=1:nl       %parcourir la matrice 
    for j=1:nc
        if(img(i,j)<moy)     %si le pixel de l'image < a la moyenne qui represente notre seuille on affect 0 a l'image resultante 
            rsltImg(i,j)=0;
        else                 %sinon si >= on affecte 1
            rsltImg(i,j)=1;
        end
    end
end
rslt=rsltImg;%retourner le resultat
end


