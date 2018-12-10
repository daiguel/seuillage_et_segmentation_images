function [ rslt ] = Otsu2( imaG )
[nl, nc]=size(imaG);%récuperer la taille de l'image
var=zeros(1,max(imaG(:)));
rslt=zeros(nl,nc); 

h=histo(imaG,max(imaG(:)));% le detaille et dans la fonction seuillage locale otsu2
                       for i=2:max(imaG(:))
                           S=0;ws=0;
                           for j=1:i-1
                                S=S+h(1,j);
                                ws=ws+double(j)*h(1,j);
                           end
                           W1=S/(nl*nc);
                           mu1=ws/S;
                           S1=0;ws1=0;
                           for j=i:max(imaG(:))
                               S1=S1+h(1,j);
                               ws1=ws1+double(j)*h(1,j);
                           end
                           W2=S1/(nl*nc);
                           mu2=ws1/S1;
                           var(1,i-1)=W1*W2*(mu1-mu2)*(mu1-mu2);%calculer la fonction de otsu2 qui manimise la variance intra class  
                       end
                       [~, position]=max(var);

                       for k=1:nl%parcourir l'image  recu en parametre pour comparer a la medianne est affecter sois un 0 ou un 1 selon les indices de la petite matrice MATMED
                           for i=1:nc
                                if (imaG(k,i)<position)%medianne < affecter un 0
                                    rslt(k,i)=0;% remplir les matrices 
                                else
                                    rslt(k,i)=1;
                                end
                           end

                       end
end