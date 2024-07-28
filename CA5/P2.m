for counter=0.0001:0.01:2
    test1 = coding_freq('signal' , 1);
    test1wNoise = noiseAdder(test1,counter);
    result1 = decoding_freq(test1wNoise,1);
  %  test2 = coding_freq('signal' , 2);
  %  test2wNoise = noiseAdder(test2,counter);
  %  result2 = decoding_freq(test2wNoise,2);
    test3 = coding_freq('signal' , 5);
    test3wNoise = noiseAdder(test3,counter);
    result3 = decoding_freq(test3wNoise,5);
    disp([" Sigma = " , counter ]);
    disp(["bit rate = 1, decoded: " , result1]);
   % disp(["bit rate = 2, decoded: " , result2]);
    disp(["bit rate = 5, decoded: " , result3]);
end