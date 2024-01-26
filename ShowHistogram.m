%%%%%%%%%%%%%  Function ShowHistogram %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%           Show histrogram of gray scale image and help decide threshold
%
% Input Variables:
%      rows, cols    rows and columns in grayscale_image
%      
% Returned Results:
%      None
%
% Processing Flow:  
%      1.  Cycle through MxN array and calculate the number of pixel value
%
%  Restrictions/Notes:
%      This function takes an 8-bit gray scale image as input.  
%      The range of value is [0, 255]
%  The following functions are called:
%      NONE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ShowHistogram(grayscale_image)
% Size of Image
[rows, cols] = size(grayscale_image);

% Initialize histogram array (to 0)
histogram = zeros(1, 256);

% Calculate histogram by iterating over the pixel values of the image
for i = 1:rows
    for j = 1:cols
        grayLevel = grayscale_image(i, j) + 1; % MATLAB indices start at 1.
        histogram(grayLevel) = histogram(grayLevel) + 1;
    end
end

% Histogram display
bar(histogram);
xlim([1 256]); % Adjust the range of the x-axis to the gray level.
title('Histogram of the Image');
xlabel('Gray Level');
ylabel('Frequency');
end