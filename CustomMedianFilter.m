%%%%%%%%%%%%%  Function CustomMedianFilter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%           Remove salt-and-pepper nosie using median filter
%
% Input Variables:
%      image    image with salt-and-pepper nosie
%      
% Returned Results:
%      filtered_image   new image without salt-and-pepper nosie
%
% Processing Flow:  
%      1.  Cycle through MxN array. Apply median filter to remove noise.
%
%  Restrictions/Notes:
%      None 
%
%  The following functions are called:
%      NONE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function filtered_image = CustomMedianFilter(image)
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