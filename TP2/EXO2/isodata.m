function resultat=isodata(im)  
      
      h=histo(im,max(im(:)));%calculer l'hitogramme 
      im=double(im);%convertire pour eviter certaines problemes 
      [nl,nc]=size(im);
      t= (im(1,1)+im(nl,1)+im(1,nc)+im(nl,nc))/4;%calculer la moyenne des quatre coins de la matrice
      b=true; 
      while (b)%boucler tant que le nouveau seuille est défférrent e l'ancien 
          st=0;%initialiser
          nbp=0;%intialiser
                  for i=1:t%parcour les elmts de classe c1
                    nbp = nbp+h(1,i);
                    st=st+i*h(1,i);
                  end
          m1=st/nbp;
          st=0;nbp=0;
                    x=double(floor(t+1));
                  for i=x:max(im(:))
                    nbp=nbp+h(1,i);
                    st=st+i*h(1,i);
                  end

          m2= st/nbp;
           t1=(m1+m2)/2;
          if (t==t1)
            b=false;
          end 

          t=t1;  

      end 

        seuil = uint8(floor(t1));
        resultat=zeros(nl,nc);
for i=1:nl%parcourir l'image 
    for j=1:nc
        if(im(i,j)<seuil)%si le pixel de l'image < a la medianne qui represente notre seuille on affect 0 a l'image resultante 
            resultat(i,j)=0;
        else             %sinon si >= on affecte 1
            resultat(i,j)=1;
        end
    end
end
   
      
end















