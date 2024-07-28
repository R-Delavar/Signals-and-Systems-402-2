function ICRecognition(ICpath , PCBpath)
    IC = imread(ICpath);
    PCB = imread(PCBpath);
    grayIC = rgb2gray(IC);
    grayPCB = rgb2gray(PCB);
    rotatedGrayIC = imrotate(grayIC , 180);
    out = Corrolator(grayPCB , grayIC);
    outRotated = Corrolator(grayPCB , rotatedGrayIC);
    ICSpotPlotting(PCB , IC , {out , outRotated});
       
end