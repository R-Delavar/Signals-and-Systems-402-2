function result=ICSpotPlotting(PCB,IC,correlationResult)
    [IC_row,IC_col , ~]=size(IC);
    threshold=0.94;
    figure,imshow(PCB);
    hold on 

    for l=1:length(correlationResult)
        CorResultM=cell2mat(correlationResult(1,l));
        Detected=find(CorResultM>threshold);
        [rows, columns]=ind2sub(size(CorResultM),Detected);
        for k=1:length(rows)
            disp([columns(k) rows(k) IC_col IC_row ])
            rectangle('Position',[columns(k) rows(k) IC_col IC_row],'EdgeColor','r');
        end
    end

    F=getframe(gcf);
    result=frame2im(F);
end