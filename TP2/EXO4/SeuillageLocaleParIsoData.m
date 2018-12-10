function [ rslt ] = SeuillageLocaleParIsoData( img,nbrBlockL,nbrBlockC )
[nl, nc]=size(img);%récuperer la taille de l'image
rslt=zeros(nl,nc);%initialiser la matrice resultante

ql=nl/nbrBlockL;%si pour recuperer la taille d'une matrice a l'intériere d'un block dans cette variable c'est le nombre de ligne d'un block
qc=nc/nbrBlockC;%le nombre de colomns a l'intere d'un block 

%ql et qc represente la taille de la  petite matrice a l'interiere de la
%matrice de l'image  sur la quelle on va effectuer les operations de isodata

i=1;%initialiser  l'indice des ligns

    while (i<nl)% parcourir l'mage en faisant un saut égale a ql a chaque itération   
        
        j=1;%rénitialser l'indices des columns pour revenire  chaque fois a la premiere ligne  
       
        while (j<nc)% parcourir l'mage en faisant un saut égale a qc a chaque itération  
           matRT=img(i:i+ql-1,j:j+qc-1);%recupere la marice qu'on appleras MATMED pour calculer la median pour chaque bloc la taille sera ql*qc
           matRT=double(matRT);
           T=(matRT(1,1)+matRT(ql,1)+matRT(1,qc)+matRT(ql,qc))/4;
           b=true;
            h=histo(matRT,256); 
           while(b==true)
                 
               SI=0;NBP=0;
               
               for ii=1:T
               NBP=NBP+h(1,ii);
               SI=SI+ii*h(1,ii);
               end
               M1=SI/NBP;

               SI=0;NBP=0;
               T=double(floor(T+1));
               for ii=T:max(matRT(:))
               NBP=NBP+h(1,ii);
               SI=SI+ii*h(1,ii);
               end
               M2=SI/NBP;
               T1=(M1+M2)/2;
               if ((abs(T-T1))<1)%medianne < affecter un 0
                            b=false; 
                            seuil = uint8(floor(T));
              for ii=i:i+ql-1%parcourir l'image  recu en parametre pour comparer a la medianne est affecter sois un 0 ou un 1 selon les indices de la petite matrice MATMED
                   for jj=j:j+qc-1
                        if img(ii,jj)<seuil%medianne < affecter un 0
                            rslt(ii,jj)=0;% remplir les matrices 
                        else%medianne> affecter un 1
                            rslt(ii,jj)=1;
                        end    
                   end
              end
                            
               else%medianne> affecter un 1
                            T=T1;
               end
           end
           j=j+qc;   %faire un saut selon le nombre de colomnes de la petite matrice qc spécifier 
        end
      i=i+ql;%faire un saut selon le nombre de colomnes de la petite matrice ql spécifier
        
    end
    
    bin=rslt;
end