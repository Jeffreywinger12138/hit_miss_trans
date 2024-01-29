%%%%%%%%%%%%%  Function zero %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Set up an MxN image full of zeros - useful for dealing with
%      border effects
%
% Input Variables:
%      M, N    rows (M) and columns (N) in f
%      x       x coordinate of a pixel
%      y       y coordinate of a pixel
%      
% Returned Results:
%      fzero   new image full of all zeros
%
% Processing Flow:  
%      1.  Cycle through MxN array and fill with ZEROS
%
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%      NONE
%
%  Author:      William E. Higgins
%  Date:        1/4/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function hit_or_miss_image = hit_or_miss_transform(binary_image)
    se_foreground = strel('square', 13);  % Adjust size as needed A

    % Define the size of the window W
    window_size = [70, 70];  % Example size, adjust as needed
    
    % Define the size of the square hole A
    square_size = 60;  % Example size, adjust as needed
    
    % Create the window W filled with ones
    W = true(window_size);
    
    % Calculate the position to place the square A in the center of W
    start_pos = floor((window_size - square_size) / 2) + 1;
    end_pos = start_pos + square_size - 1;
    
    % Create the square hole A in the center of W
    W(start_pos(1):end_pos(1), start_pos(2):end_pos(2)) = false;
    
    % B is the structuring element that represents the local background of A
    se_background = strel('arbitrary', W);

    % Convert structuring elements to logical arrays
    se_foreground_logical = se_foreground.getnhood();
    se_background_logical = se_background.getnhood();
    
    % Get dimensions of the structuring elements
    [fg_rows, fg_cols] = size(se_foreground_logical);
    [bg_rows, bg_cols] = size(se_background_logical);
    
    % Calculate padding sizes
    pad_fg = floor([fg_rows, fg_cols] / 2);
    pad_bg = floor([bg_rows, bg_cols] / 2);
    
    % Pad the binary image to handle borders during the erosion process
    padded_image = custom_padarray(binary_image, pad_fg, 0, 'both');
    padded_image_inv = custom_padarray(~binary_image, pad_bg, 0, 'both');
    
    % Initialize the output image
    hit_or_miss_image = false(size(binary_image));
    
    % Perform manual erosion for foreground
    for i = 1:size(binary_image, 1)
        for j = 1:size(binary_image, 2)
            % Get the region of the image that corresponds to the current position
            region_fg = padded_image(i:i+fg_rows-1, j:j+fg_cols-1);
            region_bg = padded_image_inv(i:i+bg_rows-1, j:j+bg_cols-1);
            
            % Check if the structuring element fits the region (foreground)
            match_fg = all(region_fg(se_foreground_logical) == 1);
            
            % Check if the structuring element fits the region (background)
            match_bg = all(region_bg(se_background_logical) == 1);
            
            % Set the output pixel value to true if both foreground and background match
            hit_or_miss_image(i, j) = match_fg && match_bg;
        end
    end
end

