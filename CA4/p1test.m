for counter=0.3:0.01:2
    test1 = coding_amp('hi there!' , 1);
    test1wNoise = NoiseAdder(test1,counter);
    result1 = decoding_amp(test1wNoise,1);
    test2 = coding_amp('hi there' , 2);
    test2wNoise = NoiseAdder(test2,counter);
    result2 = decoding_amp(test2wNoise,2);
    test3 = coding_amp('hi there!' , 3);
    test3wNoise = NoiseAdder(test3,counter);
    result3 = decoding_amp(test3wNoise,3);
    disp([" Sigma = " , counter ]);
    disp(["bit rate = 1, docoded: " , result1]);
    disp(["bit rate = 2, docoded: " , result2]);
    disp(["bit rate = 3, docoded: " , result3]);
end

