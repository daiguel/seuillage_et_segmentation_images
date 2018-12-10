function [ h ] = histogrammeCummuler( img ,maxValeur)
[nl, nc]=size(img);%recupere la taille de l'image
histon=zeros(1,maxValeur+1);%intialiser le vecteur de notre tableau histograme
for i=1:nc%parcourire la matrice
    for j=1:nl
        histon(1,img(i,j)+1)=histon(1,img(i,j)+1)+1;%ajouter +1 selon l'indice du tableau 
    end
end
    
for i=1:(maxValeur) % parcourire le vecteur 
    
histon(1,i+1)=histon(1,i)+histon(1,i+1); %cumuler les valeur de l'histogramme
end 

h=histon;%retourner la valeur de l'histogramme cumuler 
end 


