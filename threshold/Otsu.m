function [final,gthresh]=Otsu(I)
tic;

% [filename,pathname]=uigetfile('*.jpeg;*.jpg;*.png;*.bmp;*.tif','Select Image','C:\Users\Pictures');
% addpath(pathname);
% I=imread(filename);

[row,col,r]=size(I);
if (r>1)
    I=rgb2gray(I);
end

greylev=zeros(1,256);
for i=1:row
    for j=1:col
     greylev(1,(I(i,j)+1))=greylev(1,(I(i,j)+1))+1;
    end
end
greylev_n=greylev/(row*col);

 global_mean=0;
for i=1:256
    global_mean=global_mean+(i*greylev_n(i));
end

variance=zeros(1,256);
for i=1:256
    cdf=0;
    local_mean=0;
    for k=1:i
        cdf=cdf+greylev_n(k);
        local_mean=local_mean+(k*greylev_n(k));

    end
    variance(i)=(((global_mean*cdf)-local_mean)^2)/(cdf*(1-cdf));
    
end

op_thresh=[];
for i=1:256
    if(variance(i)==max(variance))
        op_thresh(end+1)=i;
    end
end

gthresh=mean(op_thresh);
gthresh;
gthresh_inbuilt=graythresh(I)*255;

final=zeros(size(I));
for i=1:row
    for j=1:col
        if(I(i,j)<gthresh)
            final(i,j)=0;
        
        else
            final(i,j)=255;
        end
        
    end
end
% final=imbinarize(I,optimal_thresh);
% figure('Name','Otsu Images','NumberTitle','off');
% subplot(1,2,1);
% imshow(I);
% title('Input image');
% subplot(1,2,2);
% imshow(final);
% title('Final image');
% 
% figure('Name','Otsu Histogram','NumberTitle','off');
% subplot(1,2,1);
% stem(greylev);
% title('Input image Histogram');
% subplot(1,2,2);
% I=final;
% greylev=zeros(1,256);
% for i=1:row
%     for j=1:col
%      greylev(1,(I(i,j)+1))=greylev(1,(I(i,j)+1))+1;
%     end
% end
% stem(greylev);
% title('Final image Histogram');
toc;
end
