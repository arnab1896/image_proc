function [output_o]=open_close(I,str_ele)

clc;
% 
%  [filename,pathname]=uigetfile('*.jpeg;*.jpg;*.png;*.bmp;*.tif','Select Image','C:\Users\Akash\Pictures');
%  addpath(pathname);
% I=imread(filename);



%str_ele=input('Enter the structuring element:-');
%output=zeros(size(I));


output_d=dilation(I,str_ele);
% figure
% subplot(1,2,1);
% imshow(I);
% title('Input image');
% subplot(1,2,2);
% imshow(output_d);
% title('Dilation Result');
% movegui('northwest');

output_e=erosion(I,str_ele);
% figure
% subplot(1,2,1);
% imshow(I);
% title('Input image');
% subplot(1,2,2);
% imshow(output_e);
% title('Erosion Result');
% movegui('northeast');

output_o=dilation(output_e,str_ele);
% figure
% subplot(1,2,1);
% imshow(I);
% title('Input image');
% subplot(1,2,2);
% imshow(output_o);
% title('Opening Result');

output_c=erosion(output_d,str_ele);
% figure
% subplot(1,2,1);
% imshow(I);
% title('Input image');
% subplot(1,2,2);
% imshow(output_c);
% title('Closing Result');
end