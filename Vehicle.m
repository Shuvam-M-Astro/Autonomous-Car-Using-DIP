clc
clear
pkg load image
img1 = imread('streetg.jpg');
bw1 = im2bw(img1);
bw2 = imcrop(bw1, [100 500 500 100]);
stats1 = [regionprops(bw2, 'Centroid','BoundingBox')]
subplot(2,2,1)
imshow(bw1);
imshow(bw2); title('image1')
hold on;
for i = 1:numel(stats1)
rectangle('Position',stats1(i).BoundingBox, ...
'Linewidth', 3, 'EdgeColor', 'r');
centroids1=cat(1,stats1.Centroid);
hold on
plot(centroids1(:,1),centroids1(:,2),'r*')
hold off
end
for i = 1:numel(stats1)
x1(i)=(stats1(i).Centroid)(:,1);
y1(i)=(stats1(i).Centroid)(:,2);
end
img2 = imread('streetg.jpg');
bw3 = im2bw(img2);
bw4 = imcrop(bw3, [100 500 500 100]);
stats2 = [regionprops(bw4, 'Centroid','BoundingBox')]
subplot(2,2,2)
imshow(bw4); title('image2')
hold on;
for j = 1:numel(stats2)
rectangle('Position',
stats2(j).BoundingBox, ...
'Linewidth', 3, 'EdgeColor', 'r');
centroids2=cat(1,stats2.Centroid);
hold on
hold off
end
for j = 1:numel(stats2)
x2(j)=(stats2(j).Centroid)(:,1);
y2(j)=(stats2(j).Centroid)(:,2);
end
if sum(y2-y1)>0
printf('increase pace of left wheel')
else if (y2-y1)<0
printf('increase pace of right wheel');
else if (y2-y1)==0
printf('keep pace of both wheels constant');
else
printf('not clear');
end
end
end
