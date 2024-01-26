%%%%%%%%%%%%%  Function mean3x3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a 3X3 mean (neighborhood average) filter at each pixel 
%           in an image 
%
% Input Variables:
%      f       MxN input 2D gray-scale image to be filtered
%      fzero   MxN image full of zeroes
%      M, N    rows (M) and columns (N) in f
%      x       x coordinate of a pixel
%      y       y coordinate of a pixel
%      xlo, xhi, ylo, yhi   Limits on what can be processed by filter
%      
% Returned Results:
%     mean     new image cantaining the filtered results
%
% Processing Flow:
%      1.  Set a new image full of ZEROS
%      2.  For each valid pixel,
%             compute the mean of the 3x3 neighborhood about the
%             pixel and assign this value to the mean image
%
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%      none
%
%  Author:      William E. Higgins
%  Date:        1/8/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function filtered_image = custom_median_filter(image)
    % Get the dimensions of the image
    [rows, cols] = size(image);
    
    % Preallocate the filtered_image matrix with zeros
    filtered_image = zeros(rows, cols);
    
    % Pad the image array with zeros on all sides
    padded_image = padarray(image, [1, 1], 0, 'both');
    
    % Perform median filtering
    for i = 2 : (rows + 1)
        for j = 2 : (cols + 1)
            % Extract the 3x3 neighborhood
            window = padded_image(i-1:i+1, j-1:j+1);
            
            % Find the median of the neighborhood
            median_value = median(window(:));
            
            % Assign the median value to the filtered image
            filtered_image(i-1, j-1) = median_value;
        end
    end
    
    % % Convert the filtered_image back to uint8 if original image was uint8
    % filtered_image = uint8(filtered_image);
end

% Usage:
% gray_image = rgb2gray(imread('RandomDisks-P10.jpg')); % Convert to grayscale first if needed
% binary_image = imbinarize(gray_image); % Convert to binary image
% binary_image_no_noise = custom_median_filter(binary_image);
