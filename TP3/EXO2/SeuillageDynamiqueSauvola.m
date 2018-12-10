                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            function [ image_resultat ] = SeuillageDynamiqueSauvola( img)
%SEUILLAGEDYNAMIQUESAUVOLA Summary of this function goes here
%   Detailed explanation goes here[nl,nc]=size(im); %obtenir la taille de l'image 
 [nl,nc]=size(img);                                       
image_resultat=zeros(nl,nc); %Creation de la nouvelle matrice qui sera la destination de notre image résultat
                      
for i=1:(nl)% parcourir les pixels de l'image 
    for j=1:(nc) 
                    cpt=0;
                    tab=(-1)*ones(3,3); % un tableau rempli initilsier avec des valeurs -1, pour le calcule de la varience, les -1 permettent de trouver les extrémité à exclure  
                    som=zeros(1,9); %  un vecteur qui permet de stocker les valeurs pour calculer la moyenne initialisé avec des 0
                    pixelCourrant=img(i,j);   

                                for ii=(i-1):(i+1)           % les boucle permettent trouver les pixel adjacent du pixel courant         
                                    for jj=(j-1):(j+1)       % L'image (les pixels)
                                        if((ii>0) && (ii<=nl) && (jj>0) && (jj<=nc))%cette condition permet de verifier si le pixel adjacent appartient à l'image 
                                           tab(ii-i+2,jj-j+2)= img(ii,jj); % recuperer la valeur des pixel voisin dans une matrice 3*3
                                           som(1,((ii-i+2)*(jj-j+2)))= img(ii,jj);
                                           cpt=cpt+1;
                                         end
                                    end                     
                                end

                      sommmme=sum(som(:));
                      moy =(sommmme/cpt);       %la fonction median() calcule la medienne  dans notre cas pour le vecteur le matrice tab      
                      somVarience=zeros(1,9);
                      compteur=0;
                       for ii=1:3           % les boucle permettent trouver les pixel adjacent du pixel courant         
                        for jj=1:3       % L'image (les pixels)
                           if(tab(ii,jj)~= -1)%cette condition permet de verifier si le pixel adjacent appartient à l'image 
                               somVarience(1,ii*jj)=(tab(ii,jj)-moy)^2;         
                               compteur=compteur+1;                                          
                           end                     
                        end
                      end

                     varience=sum(somVarience(:))/compteur;
                     ecart=sqrt(varience);
                     seuil=moy+1.5*((ecart/12)-1);



                     if (pixelCourrant>seuil)
                      image_resultat(i,j)=1;       % si intensite de pixel > au seuil il reçoi 1 
                     else
                      image_resultat(i,j)=0;       %sinon 0 
                     end
    end
end


end

