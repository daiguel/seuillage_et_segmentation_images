function [ imgkm ] = segmentationKmeans( img , margeErreur )
                  

[nl,nc,p]=size(img);%recuperer la taille de  l'image 

indexRes=zeros(nl,nc);%la matrice contient l'indice  du cluster au quelle appartien  chaque pixel  
resultat=uint8(zeros(nl,nc,p));%initialser la matrice resultante
R=img(:,:,1);%affecter la matrice en rouge a R
G=img(:,:,2);%%affecter la matrice en vert a G
B=img(:,:,3);%%affecter la matrice en Bleu a B

indiC1=randi([1 nl]);%choix aleatoire de i pour la centre du cluster  c1
indjC1=randi([1 nc]);%choix aleatoire de j pour la centre du cluster  c1

indiC2=randi([1 nl]);%choix aleatoire de i pour la centre du cluster  c2
indjC2=randi([1 nc]);%choix aleatoire de j pour la centre du cluster  c2

indiC3=randi([1 nl]);%choix aleatoire de i pour la centre du cluster  c3
indjC3=randi([1 nc]);%choix aleatoire de j pour la centre du cluster  c3

C1=[R(indiC1,indjC1),G(indiC1,indjC1),B(indiC1,indjC1)]; %trouver la couleur R et G et B pou le centre selon les valeurs aleatoir de i et j  
C2=[R(indiC2,indjC2),G(indiC2,indjC2),B(indiC2,indjC2)];
C3=[R(indiC3,indjC3),G(indiC3,indjC3),B(indiC3,indjC3)];


b=true;%initilaser le b a true  
while ( b ) % tanque on a pas trouver la distance entre l'ancien point  et le nouveau point inferrier a margeErreur on boucle
    %initialiser la somme de tout les points de chaque cluster 
    somC1=zeros(1,3);
    %initialiser le compteur des element de chaque cluster
    cpt1=0;
    somC2=zeros(1,3);
    cpt2=0; 
    somC3=zeros(1,3);
    cpt3=0;
    %initialser les varaible de distance entre les centres et les points
    %dans la matrice a chaque fois quand recalcul les centre 
    dist1=double(0);
    dist2=double(0);
    dist3=double(0);
  
  
      for i=1:nl %parcourire la matrice img  
        for j=1:nc
               %calculer la ditance en utilisant en utilisant les valeurs
               %absolus peux etre remplacer par la ditance euclidienne ou
               %autres methodes pour calculer la ditnace .
             dist1=(abs(double(R(i,j))-double(C1(1,1)))+abs(double(G(i,j))-double(C1(1,2)))+abs(double(B(i,j))-double(C1(1,3))));
             dist2=(abs( double(R(i,j))-double(C2(1,1)))+abs(double(G(i,j))-double(C2(1,2)))+abs(double(B(i,j))-double(C2(1,3))));
             dist3=(abs(double(R(i,j))-double(C3(1,1)))+abs(double(G(i,j))-double(C3(1,2)))+abs(double(B(i,j))-double(C3(1,3))));
             %|R1-R2|+|G1-G2|+|B1-B2|
            
           if ((dist1<=dist2) && (dist1<=dist3))%cette condition permet de trouver si le pixel courrant appartient au cluster 1           
               %calculer la somme des pixels qui appartient au cluster 1              
               somC1(1,1)=somC1(1,1)+double(R(i,j));
               somC1(1,2)=somC1(1,2)+double(G(i,j));
               somC1(1,3)=somC1(1,3)+double(B(i,j));
               indexRes(i,j)=1;% indexé le pixel courant dans la mtrice indexRes avec 1
               cpt1=cpt1+1;% compter le nombre de point du cluster 1
             
           elseif(dist2<=dist3)%cette condition permet de trouver si le pixel courrant appartient au cluster 2
               %calculer la somme des pixels qui appartient au cluster 2    
               somC2(1,1)=somC2(1,1)+double(R(i,j));
               somC2(1,2)=somC2(1,2)+double(G(i,j));
               somC2(1,3)=somC2(1,3)+double(B(i,j));
               indexRes(i,j)=2;% indexé le pixel courant dans la mtrice indexRes  avec 2  
               cpt2=cpt2+1; % compter le nombre de point du cluster 2
             
           else%cette condition permet de trouver si le pixel courrant appartient au cluster 3
               %calculer la somme des pixels qui appartient au cluster 3     
               somC3(1,1)=somC3(1,1)+double(R(i,j));
               somC3(1,2)=somC3(1,2)+double(G(i,j));
               somC3(1,3)=somC3(1,3)+double(B(i,j));
               indexRes(i,j)=3;% indexé le pixel courant dans la mtrice indexRes  avec 3
               cpt3=cpt3+1;% compter le nombre de point du cluster 3
               
               
           end
           
           
        end 
      end 
 
      oldC1=C1;%garder les anciens centroides pour les comprarer avec les nouveaux
      oldC2=C2;
      oldC3=C3;
      
      %calculer les nouveaux centroides en divisant  la somme des pixels qui
      %appartient a un cluster sur son compteur
      C1=[(somC1(1,1)/cpt1),(somC1(1,2)/cpt1),(somC1(1,3)/cpt1)];     
      C2=[(somC2(1,1)/cpt2),(somC2(1,2)/cpt2),(somC2(1,3)/cpt2)];
      C3=[(somC3(1,1)/cpt3),(somC3(1,2)/cpt3),(somC3(1,3)/cpt3)];
   
      %une condition pour verfier que les nouveau centere Ci ne sont pas trop
      %loin des anciens centre oldCi
      if(abs(mean(oldC2)-mean(C2))<margeErreur && abs(mean(oldC1)-mean(C1))<margeErreur && abs (mean(oldC3)-mean(C3))<margeErreur )
          b=false;
      end 
end 



 for i=1:nl %parcourire la matrice des index 
        for j=1:nc
         
         if(indexRes(i,j)==1)%si le pixel appartien au clusteur 1
            %on affcete les valeur de couleur du centroide c1
            resultat(i,j,1)=uint8(C1(1,1));
            resultat(i,j,2)=uint8(C1(1,2));
            resultat(i,j,3)=uint8(C1(1,3));
         elseif (indexRes(i,j)==2)%si le pixel appartien au clusteur 2
            %on affcete les valeurs de couleur du centroide c2
             resultat(i,j,1)=uint8(C2(1,1));
             resultat(i,j,2)=uint8(C2(1,2));
             resultat(i,j,3)=uint8(C2(1,3));
         else%si le pixel appartien au clusteur 3
            %on affcete les valeurs de couleur du centroide c3
             resultat(i,j,1)=uint8(C3(1,1));
             resultat(i,j,2)=uint8(C3(1,2));
             resultat(i,j,3)=uint8(C3(1,3));
          end 
            
           
       end 
  end 
imgkm=resultat;%routourner el resultat finale
end
%l'algo kmeans et fait pour qu'on l'exicute avec le nombre de cluster=3  
