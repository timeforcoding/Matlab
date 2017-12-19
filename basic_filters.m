%in this matlab program you will find the a single code for the following
%filters: 1. Low Pass Smoothing Filter 2. Median Filter, 3. Basic High Pass
%Filter, 4. High pass filter from original image and smoothed filter
%output 5. High Boost Filter, 6. Derivative Filters for Roberts, Prewitts &
%Sobel Operators. for any questions email me at:  samudrala.naren@gmail.com
%Code Developed by : Mr. Jagadeesh Samudrala & Mrs. Tulasi Vinjarapu
tic
clc;
clear all;
close all;
a = imread('im5.png');
% [X,map] = imread('im5.png');
% I = ind2gray(X(:,:,1));
a = imadjust(a,[],[],1.5);
b = im2double(a);
%b = imnoise(a1,'salt & pepper',0.2);
[m,n] = size(b);
A = 2;
c = zeros(m,n);
d = zeros(m,n);
e = zeros(m,n);
f = zeros(m,n);
g = zeros(m,n);
h = zeros(m,n);
k = zeros(m,n);
l = zeros(m,n);
for i = 2:m-1
    for j = 2:n-1
        c(i,j) = 1/9*(b(i-1,j-1) + b(i-1,j) + b(i-1,j+1) + b(i,j-1) + b(i,j) + b(i,j+1) + b(i+1,j-1) + b(i+1,j) + b(i+1,j+1));
        d1 = b(i-1:i+1,j-1:j+1);
        d2 = reshape(d1,1,9);
        d3 = sort(d2);
        d4 = median(d3);
        d(i,j) = d4;
        e(i,j) = 1/9*(8*b(i,j) - (b(i-1,j-1) + b(i-1,j) + b(i-1,j+1) + b(i,j-1) + b(i,j+1) + b(i+1,j-1) + b(i+1,j) + b(i+1,j+1)));
        f(i,j) = b(i,j) - c(i,j);
        g(i,j) = (A - 1)*b(i,j) + f(i,j);
        Gx1 = b(i-1,j-1) - b(i,j);
        Gy1 = b(i-1,j) - b(i,j-1);
        h(i,j) = sqrt(Gx1.^2 + Gy1.^2);
        Gx2 = (b(i+1,j-1) + b(i+1,j) + b(i+1,j+1)) - (b(i-1,j-1) + b(i-1,j) + b(i-1,j+1));
        Gy2 = (b(i-1,j+1) + b(i,j+1) + b(i+1,j+1)) - (b(i-1,j-1) + b(i,j-1) + b(i+1,j-1));
        k(i,j) = sqrt(Gx2.^2 + Gy2.^2);
        Gx3 = (b(i+1,j-1) + 2*b(i+1,j) + b(i+1,j+1)) - (b(i-1,j-1) + 2*b(i-1,j) + b(i-1,j+1));
        Gy3 = (b(i-1,j+1) + 2*b(i,j+1) + b(i+1,j+1)) - (b(i-1,j-1) + 2*b(i,j-1) + b(i+1,j-1));
        l(i,j) = sqrt(Gx3.^2 + Gy3.^2);
        
        
    end
end
imshow(b);title('original image');
figure;
imshow(c);title('low pass filtered image (smoothed)');
figure;
imshow(d);title('Median Filtered Image');
figure;
imshow(e);title('basic high pass filtered image');
figure;
imshow(f);title('high pass filtered image in the form of original - smoothed image');
figure;
imshow(g);title('High Boost Image');
figure;
imshow(h);title('Roberts Derivative Filter Image');
figure;
imshow(k);title('Prewitt Derivative Filter Image');
figure;
imshow(l);title('Sobel Derivative Filter Image');
toc

% Elapsed time is 8.280446 seconds.
% you can use any par for loops 



% find both black and white regions
bw=im2bw(l);
stats = [regionprops(bw); regionprops(not(bw))];
% show the image and draw the detected rectangles on it
imshow(l); 
hold on;
for i = 1:numel(stats)
    rectangle('Position', stats(i).BoundingBox, ...
    'Linewidth', 3, 'EdgeColor', 'r', 'LineStyle', '--');
end



        
        