function[mean,var]=mean_var(I)

%I=imread('Eienstein.jpg');
%I=rgb2gray(I);
%imshow(I);
%print I
mean=mean2(I);
var=(std2(I)^2);
end
