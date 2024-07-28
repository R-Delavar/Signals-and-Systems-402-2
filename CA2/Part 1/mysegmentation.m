function [LabeledPic , Ne]=mysegmentation(picture)
    arr = sum(picture);
    subStart = 0;
    insideSubarray = false;
    foundSubarrays = [];
    for i = 1:length(arr)
        if arr(i) == 0
            if insideSubarray
                subEnd = i - 1;
                foundSubarrays = [foundSubarrays; subStart, subEnd];
                insideSubarray = false;
            end
        else
            if ~insideSubarray
                subStart = i;
                insideSubarray = true;
            end
        end
    end
    
    if insideSubarray
        subEnd = length(arr);
        foundSubarrays = [foundSubarrays; subStart, subEnd];
    end
    Ne = size(foundSubarrays , 1);         
    LabeledPic=zeros(size(picture));
    
    for i=1 :Ne
        theStart = foundSubarrays(i , 1 );
        theEnd = foundSubarrays(i , 2);
        [row,column]=find(picture(: , theStart:theEnd)==1);
        indicated=sub2ind(size(picture),row',(column+theStart-1)');
        LabeledPic(indicated)=i;

    end
end
