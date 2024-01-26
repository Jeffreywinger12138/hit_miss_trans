%%%%%%%%%%%%%  Function MakeTrueBinaryImage %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%          Make true-binary image consist of only 0(false) or 1(true)
%
% Input Variables:
%      gray_image    gray scale image, the range of value is [0, 255]
%      threshold     integer number, the range of value is [0, 255]
%      
% Returned Results:
%      true_binary_image   new image consist of only 0(false) or 1(true)
%
% Processing Flow:  
%      1.  Cycle through MxN array. 
%          If the pixel value is higher than threshold then changing the value into 1 else 0
%
%  Restrictions/Notes:
%      This function takes an 8-bit gray scale image as input.  
%
%  The following functions are called:
%      NONE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function true_binary_image = MakeTrueBinaryImage(gray_image, threshold)

% Size of Image
[rows, cols] = size(gray_image);

% Make empty image
true_binary_image = zeros(rows, cols, 'logical');

for i = 1:rows
    for j = 1:cols
        if gray_image(i,j) > threshold
            true_binary_image(i,j) = true;
        else 
            true_binary_image(i,j) = false;
        end
    end
end

end