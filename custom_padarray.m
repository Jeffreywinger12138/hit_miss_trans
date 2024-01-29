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
function padded_array = custom_padarray(input_array, pad_size, pad_value, pad_type)
    % INPUTS:
    % input_array: The original array to be padded
    % pad_size: Size of the padding [pad_rows, pad_cols]
    % pad_value: The value to pad with (commonly 0 for binary images)
    % pad_type: Type of padding ('both', 'pre', or 'post')
    
    % Default pad_value is 0 if not specified
    if nargin < 3
        pad_value = 0;
    end
    
    % Default pad_type is 'both' if not specified
    if nargin < 4
        pad_type = 'both';
    end
    
    [rows, cols] = size(input_array);
    pad_rows = pad_size(1);
    pad_cols = pad_size(2);
    
    % Initialize the padded array with the pad_value
    if strcmp(pad_type, 'both') || strcmp(pad_type, 'pre')
        pre_pad_rows = pad_rows;
        pre_pad_cols = pad_cols;
    else
        pre_pad_rows = 0;
        pre_pad_cols = 0;
    end
    
    if strcmp(pad_type, 'both') || strcmp(pad_type, 'post')
        post_pad_rows = pad_rows;
        post_pad_cols = pad_cols;
    else
        post_pad_rows = 0;
        post_pad_cols = 0;
    end
    
    % Create the padded array
    padded_array = pad_value * ones(rows + pre_pad_rows + post_pad_rows, ...
                                    cols + pre_pad_cols + post_pad_cols);
    
    % Copy the input array into the padded array
    padded_array(pre_pad_rows + 1 : pre_pad_rows + rows, ...
                 pre_pad_cols + 1 : pre_pad_cols + cols) = input_array;
end


