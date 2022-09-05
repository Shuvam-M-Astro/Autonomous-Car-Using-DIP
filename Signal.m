clc; clear; pkg load image;
im = imread('streetr.jpg');
b = imcrop(im,[1 1 500 500]); subplot(3,2,1); imshow(b);title("signal");
imr1 = b(:,:,1); subplot(3,2,2); imshow(imr1); title("red filter applied");

[center1,radii1] = imfindcircles(imr1,[10 200],'ObjectPolarity','bright','sensitivity',0.75);
if 15<radii1 & radii1< 30
  printf("STOP (as red filter is active--> RED signal is detected.)");
  imr2 = b(:,:,2); subplot(3,2,4); imshow(imr2); title("green filter applied")
  subplot(3,2,3)
  imshow(b): title("red signal detected");
  h = viscircles(center1, radii1);
else
  imr2=b(:,:,2); subplot(3,2,4); imshow(imr2); title("green filter applied")
  
  [center2,radii2] = imfindcircles(imr2,[10 200],'ObjectPolarity','bright','sensitivity',0.75);
  if 15<radii2 & radii2<30
    printf("MOVE (as green filter is active--> GREEN signal is detected.)");
    subplot(3,2,5)
    imshow(b);title("green signal detected");
    h = viscircles(center2, radii2);
  endif
endif



