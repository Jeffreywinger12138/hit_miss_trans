%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Apply hit-or-miss transformation to identify the smallest and largest circles within and image.  
%
% Input Variables:
%      image                input 2D image (RGB)
%      gray_image           Gray-scale image, Range of value is [0,255]
%      binary_image         Binary image consist of 0(False) or 1(True) Value
%      filtered_image       Filtered image using median filter
%      hit_or_miss_result   Result image applied hit-or-miss transformation 
%      
% Returned Results:
%      image                RGB image
%      gray_image           Gray-scale image, Range of value is [0,255]
%      ShowHistogram        Show histogram of gray-scale image
%      binary_image         Binary image consist of 0(False) or 1(True) Value
%      filtered_image       Filtered image using median filter
%      hit_or_miss_result   Result image applied hit-or-miss transformation
% Processing Flow:
%      1.  Load RGB input image and change it gray scale image
%      2.  Compute threshold of gray scale image and make it true-binary image
%      3.  Apply custom median filter to true-binary image for removing noise 
%      4.  Apply custom hit-or-miss transformation function to image 
%          
%  Restrictions/Notes:
%      This function requires an 8-bit image as input.  
%
%  The following functions are called:
%      ShowHistogram.m          Show histogram of image
%      MakeTrueBinaryImage.m    Return image only consist of 0(False) or 1(True) value
%      CustomMedianFilter.m     Apply median filter to binary image for
%                               removing noise
%      HitorMissTransform2.m    Apply hit-or-miss transform to filtered
%                               image
%          
%
%  Author:      Min Kim, Tingyang Sun
%  Date:        01/28/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
% Read the image into MATLAB
image = imread('RandomDisks-P10.jpg');

% Convert the color image to grayscale
gray_image = rgb2gray(image);

% Show histogram for deciding threshold
ShowHistogram(gray_image)

% Make true-binary image using threshold
binary_image = MakeTrueBinaryImage(gray_image, 130);

% Apply custom-median filtering for getting rid of salt-and-pepper noise
filtered_image = CustomMedianFilter(binary_image);

% Apply custom hit-or-miss transform to filtered_image
hit_or_miss_result = HitorMissTransform2(~filtered_image);

% Display the result
imshow(hit_or_miss_result);
figure, imshow(~filtered_image), title('Filtered Binary Image');
figure, imshow(~filtered_image), title('Filtered Binary Image');
%%%%%%%%%%%%% End of the main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
