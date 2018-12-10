function [ h ] = histo( img ,hist)
[nl, nc]=size(img);
histon=zeros(1,hist+1);
for i=1:nc
    for j=1:nl
        histon(1,img(i,j)+1)=histon(1,img(i,j)+1)+1;
    end
end
    


h=histon;
end

