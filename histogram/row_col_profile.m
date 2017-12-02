function row_col_profile(I,r,c)

%I=imread('pout.tif');
%I=rgb2gray(I);
%r=input('Enter the row:-')
%c=input('Enter the column:-')
[row,col]=size(I);
greylev=zeros(1,256);

for j=1:col
     greylev(1,(I(r,j)+1))=greylev(1,(I(r,j)+1))+1;
end

% subplot(3,1,1)
% imshow(I)
subplot(2,1,1)
stem(greylev)
title('Row Profile')

greylev=zeros(1,256);
for i=1:row
    greylev(1,(I(i,c)+1))=greylev(1,(I(i,c)+1))+1;
end
subplot(2,1,2)
stem(greylev)
title('Column Profile')

end
