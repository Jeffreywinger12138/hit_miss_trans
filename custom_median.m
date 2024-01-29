function median_val = custom_median(data)
    % Flatten the data to a 1D array (if it's not already)
    data = data(:);
    
    % Sort the data
    sorted_data = sort(data);
    
    % Compute the number of elements
    n = numel(sorted_data);
    
    % Find the median
    if mod(n, 2) == 1
        % If odd number of elements, take the middle element
        median_val = sorted_data((n + 1) / 2);
    else
        % If even number of elements, average the two middle elements
        median_val = (sorted_data(n / 2) + sorted_data(n / 2 + 1)) / 2;
    end
end

