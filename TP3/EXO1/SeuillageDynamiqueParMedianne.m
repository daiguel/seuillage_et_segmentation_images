function [ resultat ] = SeuillageDynamiqueParMedianne( img )

[nl,nc]=size(img); %obtenir la taille de l'image 
                                        
image_resultat=zeros(nl,nc); %Creation de la nouvelle matrice qui sera la destination de notre image résultat
                      
 	for i=1:(nl)                     % parcourir les pixels de l'image 
		for j=1:(nc) 
     
	  tab=zeros(3,3);
    pixelCourrant =img(i,j);                
                for ii=(i-1):(i+1)           % les boucle permettent trouver les pixel adjacent du pixel courant         
                    for jj=(j-1):(j+1)       % L'image (les pixels)
                           if(ii>0&&ii<=nl&& jj>0&&jj<=nc)%cette condition permet de verifier si le pixel adjacent appartient à l'image 
                               tab(ii-i+2,jj-j+2)= img(ii,jj); % recuperer la valeur des pixel voisin dans une matrice 3*3

                           end  
                   end                     
                end
      
      med=median(tab(:));%la fonction median() calcule la medienne  dans notre cas pour le vecteur le matrice tab      
			
		
         if (pixelCourrant<med)
                image_resultat(i,j)=0;       % si intensite de pixel > medienne il reçoi 1 
         else
                image_resultat(i,j)=1;       %sinon 0 
         end
	end
 end

 resultat=image_resultat;                  %retourner l'image resultante
end