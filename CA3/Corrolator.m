function out=Corrolator (PCB,IC)
    [ICRow, ICCol] = size(IC);
    [PCBRow, PCBCol] = size(PCB);
    IC = double(IC);
    out=zeros(PCBRow-ICRow+1,PCBCol-ICCol+1);

    for i=1:(PCBRow-ICRow+1)
        for j=1:(PCBCol-ICCol+1)
            smallerPCB=double(PCB(i:i + ICRow - 1, j:j + ICCol - 1));
            out(i,j)=corrcoeff(IC,smallerPCB);
        end 
    end
    
end