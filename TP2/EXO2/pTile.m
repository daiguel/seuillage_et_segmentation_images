function [imagePtl] = pTile(img,font,occupationObjet) 
    
   
    [nl,nc]=size(img);%récuperer la taille de l'image
    imagePtl=zeros(nl,nc);
    histCummuler = histogrammeCummuler(img, max(img(:)))/(nl*nc);%le tableu contient les valeurs cumuler sur le total des elts de la matrice
    
    occupationObjet=occupationObjet/100;%diviser sur cent pour pouvoir comparer au tableau cumuler
    
   
    if (font == 0)%si l'objet qu'on veut faire apparaitre est sombre 
        i =1;%intialiser le i a 1 pour parcourire les couleurs qui sont claire 
        
        
        while (i <= 256 && histCummuler(i)<occupationObjet)%tanque on a pas parcourus tout le tableau est on a pas encore depasser le le pourcentage que occupe l'objet qu'on veu avoir en boucle 
            i=i+1;%incrementer le i
        end
       seuille= i;%qu'on en sort de la boucle ca veux dire q'on a trouver notre seuille
        
    
    else%
        i=max(img(:));%si l'objet qu'on veut faire apparaitre est claire
        
        
        while  (i >= 1 && histCummuler(i)>occupationObjet)
            i=i-1;%tanque on a pas parcourus tout le tableau est on a pas encore decendue jusqu'au  pourcentage que occupe l'objet qu'on veu avoir en boucle
        end
       seuille= i;%si l'objet qu'on veut faire apparaitre est claire
    end
     for i=1:nl%parcourire la matrice
         for j=1:nc

             if (img(i,j)<seuille)%affecter un 0 ou 1 selon le seuille 
                    imagePtl(i,j)=0;
             else
                    imagePtl(i,j)=1;
             end

         end
    end
    
end