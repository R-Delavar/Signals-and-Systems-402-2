function newX = p4_4 (voice, speed)
    if speed > 10 || speed < 0.00
        error('Invalid speed input!');
    end
    [x, samplingFrequency] = audioread(voice);

    speed = round(speed,1);
    newX = x(round(linspace(1,size(x,1), size(x,1)/speed)));
    audiowrite("newVoice.wav", newX, samplingFrequency);
end
