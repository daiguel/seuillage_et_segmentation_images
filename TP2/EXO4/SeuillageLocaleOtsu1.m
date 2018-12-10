function [imageOtsu1] = SeuillageLocaleOtsu1(img,nbrBlockL,nbrBlockC)%l'image puis les deux dernier arguments represente le nombre de block qu'on veux avoir avec notre matrice 
[nl, nc]=size(img);%récuperer la taille de l'image
rslt=zeros(nl,nc);%initialiser la matrice resultante

ql=nl/nbrBlockL;%si pour recuperer la taille d'une matrice a l'intériere d'un block dans cette variable c'est le nombre de ligne d'un block
qc=nc/nbrBlockC;%le nombre de colomns a l'intere d'un block 

%ql et qc represente la taille de la  petite matrice a l'interiere de la
%matrice de l'image  sur la quelle on va effectuer loperation otsu1


k=1;%initialiser  l'indice des lignes pour revenire  chaque fois a la premiere ligne

while (k<nl)% parcourir l'image en faisant un saut égale a ql (nombre de lignes) a chaque itération   
        
        l=1;%rénitialser l'indices des columns pour revenire  chaque fois a la premiere colomns 
       
        while (l<nc)% parcourir l'image en faisant un saut égale a qc a chaque itération  
               matOtsu1=img(k:k+ql-1,l:l+qc-1);%recupere la marice qu'on appleras MATOTSU2 pour calculer la variance  pour chaque bloc ca taille sera ql*qc
               var=zeros(1,256);%tableau de variance initialiser a zeros
               
                       h=histo(matOtsu1,max(matOtsu1(:)));   %appelle a la fonction histo qui va nous calculer l'histogramme 
                       for i=2:max(matOtsu1(:))%pour chercher le bon seuille de 2 a 256  on va calculer la variance pour chaque seuille 
                           S1=0;ws=0;%initialser des valeurs a cumuler 
                           for j=1:i-1 %de 1 jusqu'au seuille ca represente le elements de la classe c1
                                S1=S1+h(1,j);%les valeurs cumuler de h(1,j) sommer tout les element de la classe c1
                                ws=ws+double(j)*h(1,j);%les valeurs cumuler de j*h(1,j) tel que j et la couleur et h(1,j) est le nombre de fois que la couleur revient  
                           end
                           W1=S1/(qc*ql);%la probabilite qu'il appartien a la class c1
                           mu1=ws/S1;%la mayenne de la classe c1
                           S2=0;ws1=0;%initialser des valeurs a cumuler dans la classe c2
                           for j=i:max(matOtsu1(:))%du seuille jusqu'au max des valeurs qui existe dans la matrice pour compter tout les element de la classe c2
                               S2=S2+h(1,j);%les valeurs cumuler de h(1,j) compter tout les element quand la classe c2
                               ws1=ws1+double(j)*h(1,j);%les valeurs cumuler de j*h(1,j) tel que j et la couleur et h(1,j) est le nombre de fois qu'il revient
                           end
                           W2=S2/(qc*ql);%la probabilite qu'il appartien a la class c2
                           mu2=ws1/S2;%la mayenne de la classe c2
                           ws=0;
                           for j=1:i-1%de 1 jusqu'au seuille ca represente le elements de la classe c1
                                ws=ws+h(1,j)*(double(j)-mu1)*(double(j)-mu1); %calculer le poid de la classe c1
                           end
                           V1=ws/S1;%la variance de la classe c1
                           ws=0;
                           for j=i:max(matOtsu1(:))%du seuille jusqu'au max des valeurs qui existe dans la matrice pour compter tout les element de la classe c2
                              ws=ws+h(1,j)*(double(j)-mu2)*(double(j)-mu2);%calculer le poid de la classe c2
                           end
                           V2=ws/S2;%la variance de la classe c2
                           var(1,i-1)=W1*V1+W2*V2;%calculer la fonction de otsu1 qui cherche a maximiser l'inter class
                       end
                       [~, seuille]= min(var);%on cherche le minimum puis dans ca position on aura le meilleure seuille. 

                  for ii=k:k+ql-1%parcourir l'image  recu en parametre (image d'origine) pour comparer a la medianne est affecter sois un 0 ou un 1 selon les indices de la petite matrice MATMED
                       for jj=l:l+qc-1
                            if img(ii,jj)<seuille%la position qu'on recupere avec la fonction max represente notre seuille pour la petite matrice < affecter un 0
                                rslt(ii,jj)=0;%effectuer le seuillage  
                            else%seuille> affecter un 1
                                rslt(ii,jj)=1;
                            end    
                       end
                  end
                       l=l+qc;   %faire un saut selon le qc spécifier le nombre de colomns d'un block
        end
      k=k+ql;%faire un saut selon le ql spécifier le nombre de lignes d'un block
        
end
    
    imageOtsu1=rslt;

end