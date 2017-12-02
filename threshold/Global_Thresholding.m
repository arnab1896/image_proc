function [final,T]=Global_Thresholding(img)
[x,y,z] = size(img);
if z>1
    gray = rgb2gray(img);
else
    gray = img;
end

intensity = zeros([1 256]);
for i=1:x
    for j=1:y
        intensity(gray(i,j) + 1) = intensity(gray(i,j) + 1) + 1;
    end
end
intensity2 = intensity;
intensity = intensity / (x*y);
mean = sum((0:255).*intensity);

%%%% Global Thresholding %%%%
T = mean;
T1 = 0;
k = 0;
for i=0:floor(T)
    k = k + intensity2(i+1)*i;
end
m1 = k / sum(intensity2(1:ceil(T)));
k = 0;
for i=ceil(T):255
    k = k + intensity2(i+1)*i;
end
m2 = k / sum(intensity2(ceil(T)+1:end));
while abs(T-T1) > 10^-8
    T1 = T;
    T = (m1+m2)/2;
    k = 0;
    for i=0:floor(T)
        k = k + intensity2(i+1)*i;
    end
    m1 = k / sum(intensity2(1:ceil(T)));
    k = 0;
    for i=ceil(T):255
        k = k + intensity2(i+1)*i;
    end
    m2 = k / sum(intensity2(ceil(T)+1:end));
end
final=zeros(size(img));
for i=1:x
    for j=1:y
        if(img(i,j)<T)
            final(i,j)=0;
        
        else
            final(i,j)=255;
        end
        
    end
end
%%%% END %%%%
