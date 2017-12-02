function histogram(I)
%I=rgb2gray(I);
%print I;
[row,col]=size(I);
greylev=zeros(1,256);
for i=1:row
    for j=1:col
     greylev(1,(I(i,j)+1))=greylev(1,(I(i,j)+1))+1;
    end
end
stem(greylev)
end
