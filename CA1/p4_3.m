function newX = p4_3 (voice, speed)
    if speed~= 2 && speed ~=0.5
        error('Invalid speed input!');
    end
    [x, samplingFrequency] = audioread(voice);

    if speed == 2
        newX = x(1:2:end);
    end
    if speed == 0.5
        newX = zeros(2*length(x)-1, size(x,2));
        newX(1:2:end , :) = x;
        newX(2:2:end-1,:) = (x(1:end-1,:)+x(2:end,:)) /2;
    end
    audiowrite("newVoice.wav", newX, samplingFrequency);
end