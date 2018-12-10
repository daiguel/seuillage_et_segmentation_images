function [ rslt ] = SeuillageGlobaleParMedianne( img )
[nl, nc]=size(img);%récuperer la taille de l'image
imgVect=img(:);%convertir l'image matrice en un vecteur pour applique la fonctione median() 
medn=median(imgVect);%la fonction median(imgVect) calcule la median dans notre cas pour le vecteur imgVect
rsltImg=zeros(nl,nc);%intialiser a 0 la matrice de l'image resultante
for i=1:nl%parcourir l'image 
    for j=1:nc
        if(img(i,j)<medn)%si le pixel de l'image < a la medianne qui represente notre seuille on affect 0 a l'image resultante 
            rsltImg(i,j)=0;
        else             %sinon si >= on affecte 1
            rsltImg(i,j)=1;
        end
    end
end
    rslt=rsltImg;%retourner le resultat
end
