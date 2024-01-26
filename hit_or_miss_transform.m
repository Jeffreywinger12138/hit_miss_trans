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

function hit_or_miss_image = hit_or_miss_transform(binary_image, size_of_disks)
    % Create structuring elements for the middle-sized disks
    se_A = strel('square', size_of_disks(1)); % A for the object (disk) match
    se_B = strel('square', size_of_disks(2)); % B for the non-object (space around the disk) match
    imshow(se_A.Neighborhood)
    % Erode the binary image with structuring element A
    eroded_A = imerode(binary_image, se_A);

    % Erode the complement of the binary image with structuring element B
    eroded_B = imerode(~binary_image, se_B);
    
    % Apply the hit-or-miss transform
    hit_or_miss_image = eroded_A & eroded_B;
end

