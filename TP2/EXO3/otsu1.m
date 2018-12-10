matOtsu1=imread('citron.jpg');%lire l'image en specifiant son chemin chemin 
im=rgb2gray(matOtsu1);%convertire l'image en niveau de gris 
%function rslt=otsu1(im)  
[ql, qc]=size(im);
var=zeros(1,256);
rslt=zeros(ql,qc);
h=histo(im,max(im(:)));   %appelle a la fonction histo qui va nous calculer l'histogramme 
                       for i=2:max(im(:))%pour chercher le bon seuille on va calculer la variance pour chaque seuille de 2 a 256
                           
                           S1=0;ws1=0;%initialser des valeurs a cumuler 
                           for j=1:i-1 %de 1 jusqu'au seuille ca represente le elements de la classe c1
                                S1=S1+h(1,j);%les valeurs cumuler de h(1,j) compter tout les element quand la classe c1
                                ws1=ws1+double(j)*h(1,j);%les valeurs cumuler de j*h(1,j)tl que j et la couleur et h(1,j) est le nombre de fois qu'il revient  
                           end
                           W1=S1/(qc*ql);%la probabilite qu'il appartien a la class c1
                           mu1=ws1/S1;%la moyenne de la classe c1
                           S2=0;ws2=0;%initialser des valeurs a cumuler dans la classe c2
                           for j=i:max(im(:))%du seuille jusqu'au max des valeurs qui existe dans la matrice pour compter tout les element de la classe c2
                               S2=S2+h(1,j);%les valeurs cumuler de h(1,j) compter tout les element quand la classe c2
                               ws2=ws2+double(j)*h(1,j);%les valeurs cumuler de j*h(1,j)tl que j et la couleur et h(1,j) est le nombre de fois qu'il revient
                           end
                           W2=S2/(qc*ql);%la probabilite qu'il appartien a la class c2
                           mu2=ws2/S2;%la mayenne de la classe c2;
                           ws=0;
                           for j=1:i-1%de 1 jusqu'au seuille ca represente le elements de la classe c1 pour calculer le poids
                                ws=ws+h(1,j)*(double(j)-mu1)*(double(j)-mu1);
                           end
                           V1=ws/S1;
                           ws=0;
                           for j=i:max(im(:))%du seuille jusqu'au max des valeurs pour calculer le poids
                              ws=ws+h(1,j)*(double(j)-mu2)*(double(j)-mu2);
                           end
                           V2=ws/S2;
                           var(1,i-1)=W1*V1+W2*V2;%calculer la fonction de otsu1 qui cherche a maximiser l'inter class
                       end
                       [~, seuille]= min(var);

                    for ii=1:ql%parcourir l'image  recu en parametre (image d'origine) pour comparer a la medianne est affecter sois un 0 ou un 1 selon les indices de la petite matrice MATMED
                       for jj=1:qc
                            if im(ii,jj)<seuille%la position qu'on recupere avec la fonction max represente notre seuille pour la petite matrice < affecter un 0
                                rslt(ii,jj)=0;%effectuer le seuillage  
                            else%seuille> affecter un 1
                                rslt(ii,jj)=1;
                            end    
                       end
                    end
%end

imshow(rslt);
