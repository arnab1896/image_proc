clc;
clear;

% Select Image
% [file,path] = uigetfile('*.jpeg;*.jpg;*.png;*.bmp;*.tif','Select Image','C:\Users\Pictures');
% addpath(path);
img = imread('skull.tif');
[x,y,z] = size(img);

if z>1
    gray = rgb2gray(img);
else
    gray = img;
end

total = x*y;
prob = zeros(1, 256);
cumulative = zeros(1, 256);
freq = zeros(1,256);
equalised = zeros(1,256);

for i=1:x
    for j=1:y
        freq(gray(i,j) + 1) = freq(gray(i,j) + 1) + 1;
    end
end

tmp = 0;
for i=1:256
    prob(i) = freq(i) / total;
    tmp = tmp + prob(i);
    cumulative(i) = tmp;
    equalised(i) = round(cumulative(i) * 255);
end

gray2 = uint8(zeros([x,y]));
freq2 = zeros([1 256]);
for i=1:x
    for j=1:y
        gray2(i,j) = equalised(gray(i,j) + 1);
        freq2(gray2(i,j) + 1) =  freq2(gray2(i,j) + 1) + 1;
    end
end

figure('Name','Image','NumberTitle','off');
subplot(1,2,1);
imshow(gray);
title('Original Image');
subplot(1,2,2);
imshow(gray2);
title('Equalized Image');
movegui('northwest');

figure('Name','Histogram','NumberTitle','off');
subplot(1,2,1);
stem(0:255, freq, 'Marker', 'none');
xlim([0 255]);
title('Original Histogram');
xlabel('Gray Level');
ylabel('Intensity');
subplot(1,2,2);
stem(0:255, freq2, 'Marker', 'none');
xlim([0 255]);
title('Equalized Histogram');
xlabel('Gray Level');
ylabel('Intensity');
movegui('northeast');
