function binary_image = custom_imbinarize(gray_image, threshold_value)
    % Check if threshold_value is provided, if not, compute using Otsu's method
    if nargin < 2 || isempty(threshold_value)
        threshold_value = otsu_threshold(gray_image);
    end
    
    % Perform thresholding
    binary_image = gray_image > threshold_value;
    
    % Convert the binary image to logical type (consistent with MATLAB's imbinarize)
    binary_image = logical(binary_image);
end