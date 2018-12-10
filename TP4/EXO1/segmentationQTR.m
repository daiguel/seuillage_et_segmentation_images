function [ imgQTR ] = segmentationQTR( img , rayon, nombreMinimumCluster)
                 

[nl,nc,p]=size(img);%recuperer la taille de  l'image 

%%indexRes=zeros(nl,nc);
resultat=uint8(zeros(nl,nc,p));%initialser la matrice resultante
R=img(:,:,1);%affecter la matrice en rouge a R
G=img(:,:,2);%%affecter la matrice en vert a G
B=img(:,:,3);%%affecter la matrice en Bleu a B



indiC1=randi([1 nl]);%choix aleatoire de i pour la centre du cluster  c1
indjC1=randi([1 nc]);%choix aleatoire de j pour la centre du cluster  c1


C1=[R(indiC1,indjC1),G(indiC1,indjC1),B(indiC1,indjC1)]; % on utilise la fonction random afin de generer des indice de centroide 1 aleatoirement. 


matDesIndex=uint8(zeros(nl,nc));%%la matrice contient l'indice  du cluster au quelle appartien  chaque pixel  
numeroDuCluster=0;%la variable qui contient l'indice du cluster


while (length(find(matDesIndex==0))>nombreMinimumCluster)%on verifier si on peux former un cluster avec la taille minimum que nous avons définis
   
   numeroDuCluster=numeroDuCluster+1;%incrementer l'indice du cluster  
           
           for i=1:nl %parcourire la matrice 
              for j=1:nc
              
                   distance= (abs(R(i,j)-C1(1,1))+abs(G(i,j)-C1(1,2))+abs(B(i,j)-C1(1,3)));%calculer la ditance entre le centroids ettout les pixels de la matrice
                   %|R1-R2|+|G1-G2|+|B1-B2|
                    
                 if (distance<=rayon && matDesIndex(i,j)==0)%si la ditance est inferieure au rayon et que le pixel n'a pas ete déja indéxé alors indexe ce pixel 
                     matDesIndex(i,j)=numeroDuCluster;%indexé le pixel courant le dans la matrice des index 
                     %affecter la valeur du centre pourles pixel qui sont dans le meme cluster  
                     resultat(i,j,1)=uint8(C1(1,1));
                     resultat(i,j,2)=uint8(C1(1,2));
                     resultat(i,j,3)=uint8(C1(1,3));         
                   
                 end;
                 
              end 
              
            end 
       
            [indiceI,indiceJ]=find(matDesIndex(:,:)==0);%indiceI et indiceJ sont des vecteurs qui contient les indices lignes et colomnes respectivement des pixels qui n'ont pas été déja affecter
           if (length(indiceI)>1)%la condition etpour eviter une erreur du programme on ca ou tout le poits seron affecter le tableau sera vide 
            ind=randi([1 length(indiceI)]);%selectionner un nombre aléatoire qui represente l'indice dans le tableau des indiceI et indiceJ les vecteurs qui contient les indices des pixels non indexé
            C1=[R(indiceI(ind),indiceJ(ind)),G(indiceI(ind),indiceJ(ind)),B(indiceI(ind),indiceJ(ind))];%affecter les valeurs selectionné aleatoirement  
           end

 end 

imgQTR=resultat;%retourner le resultat
end