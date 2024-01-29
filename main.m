%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Try various very simple things with images  
%
% Input Variables:
%      f       input 2D image
%      M, N    rows (M) and columns in f
%      x       x coordinate of a pixel
%      y       y coordinate of a pixel
%      fzero   A scratch image of zeroes - often needed in image processing
%      
% Returned Results:
%      f1      A clipped version of an input image
%      fmean   3x3 neighborhood-average version of input image
%
% Processing Flow:
%      1.  Load and display input image
%      2.  Compute and write clipped version of input image
%      3.  Compute and display 3x3 neighborhood-average of input image
%          
%
%  Restrictions/Notes:
%      This function requires an 8-bit image as input.  
%
%  The following functions are called:
%      zero.m       create an image full of zeroes
%      mean3x3.m    filter with a 3x3 mean filter
%          worked into the code below - try to do this yourself
%
%  Author:      William E. Higgins
%  Date:        1/4/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;      % Clear out all memory 

%  Read in image "lake.gif" into array "f", get its 2D dimensions,
%      and display it on the screen
%  Note that "lake.gif" is needed in the directory of this .m file

% RGB=imread('RandomDisks-P10.jpg');
% gray_image = rgb2gray(RGB)
% [M, N] = size(gray_image);
% % imtool(f);


% Read the image into MATLAB
image = imread('RandomDisks-P10.jpg');

% Convert the color image to grayscale
gray_image = rgb2gray(image);

% Apply a threshold to convert the image to binary
threshold_value = graythresh(gray_image); % Otsu's method to find optimal threshold
binary_image = imbinarize(gray_image, threshold_value);

% % Display the images
% figure, imshow(image), title('Original Image');
% figure, imshow(gray_image), title('Grayscale Image');
% figure, imshow(binary_image), title('Binary Image');

filtered_image = custom_median_filter(binary_image); % 3x3 kernel size

% Usage:
% Define size_of_disks as the radius for structuring elements A and B
hit_or_miss_result = hit_or_miss_transform(~filtered_image);

% Display the result
imshow(hit_or_miss_result);

figure, imshow(~filtered_image), title('Filtered Binary Image');

figure, imshow(~filtered_image-hit_or_miss_result), title('Result Image');
%%%%%%%%%%%%% End of the main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
