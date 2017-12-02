function [x]=pseudocolor(I)

%I=imread('Eienstein.jpg');
[p,q,r]=size(I);
if (r>1)
    I=rgb2gray(I);
end
I=double(I);
x=zeros(p,q,3);
for i=1:p
    for j=1:q
        x(i,j,1)=255*sin(((pi * I(i,j) /255)-pi/4));
        x(i,j,2)=255*sin(((pi * I(i,j) /255)+pi/6));
        x(i,j,3)=255*sin(((pi * I(i,j) /255)+pi/3));
    end
end

end
