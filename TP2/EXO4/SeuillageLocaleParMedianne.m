function [ bin ] = SeuillageLocaleParMedianne( img,nbrBlockL, nbrBlockC)

[nl, nc]=size(img);%récuperer la taille de l'image
rslt=zeros(nl,nc);%initialiser la matrice resultante
ql=nl/nbrBlockL;%si pour recuperer la taille d'une matrice a l'intériere d'un block dans cette variable c'est le nombre de ligne d'un block
qc=nc/nbrBlockC;%le nombre de colomns a l'intere d'un block 
%ql et qc represente la taille de la  petite matrice a l'interiere de la matrice de l'image  sur la quelle on va effectuer notre taraitement. 
i=1;%initialiser  d'indice des ligns
    while (i<nl)% parcourir l'mage en faisant un saut égale a ql a chaque itération   
        
        j=1;%rénitialser lindices des columns pour revenire  chaque fois a la premiere ligne  
       
        while (j<nc)% parcourir l'mage en faisant un saut égale a qc a chaque itération  
           matriceMediane=img(i:i+ql-1,j:j+qc-1);%recupere la marice qu'on appleras MATMED pour calculer la median pour chaque bloc la taille sera ql*qc
           mdn=median(matriceMediane(:));%calculer la medianne
           
           for ii=i:i+ql-1%parcourir l'image  recu en parametre pour comparer a la medianne est affecter sois un 0 ou un 1 selon les indices de la petite matrice MATMED
               for jj=j:j+qc-1
                    if img(ii,jj)<mdn%medianne < affecter un 0
                        rslt(ii,jj)=0;% remplir les matrices 
                    else%medianne> affecter un 1
                        rslt(ii,jj)=1;
                    end    
               end
            end


        j=j+qc;   %faire un saut selon le nombre de colomnes de la petite matrice (qc) spécifier 
        end
      i=i+ql;%faire un saut selon le nombre de colomnes de la petite matrice(ql) spécifier
        
    end
    bin=rslt;
end
    
    
    
    
 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             