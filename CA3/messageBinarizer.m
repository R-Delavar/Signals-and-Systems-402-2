function BinarizedMessage = messageBinarizer(message, dataset)
    BinarizedMessage = ''; 
    for char = message
        index = find([dataset{1,:}] == char, 1);
        if ~isempty(index)
            BinarizedMessage = [BinarizedMessage dataset{2, index}];
        else
            error(['Character ', char, ' does not exist in the dataset.']);
        end
    end
end