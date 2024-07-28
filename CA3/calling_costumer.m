function called = calling_costumer(number1,number2)
files = dir('voice/*.wav'); 
len = length(files);
TRAIN = cell(2, len);

input = number1;

for i = 1:len
    filename = fullfile('voice', files(i).name);
    [a, Fs] = audioread(filename); 
    TRAIN{1, i} = a;
    [~, name, ~] = fileparts(files(i).name); 
    TRAIN{2, i} = str2double(name);
end

save('TRAININGSET.mat', 'TRAIN');

digits = zeros(2,1);
digits(2,1) = rem(input,10);
digits(1,1) = floor(input/10)*10;
newX = zeros(1000,2);
starter =1;
fade_length = 0.001 * Fs; 
fade_window = hann(fade_length * 2); 

if input <= 20
    for i = 1:28
        if TRAIN{2, i} == input
            audio = TRAIN{1, i};
            fadeIn = audio(1:fade_length, :) .* fade_window(1:fade_length);
            fadeOut = audio(end-fade_length+1:end, :) .* flipud(fade_window(fade_length+1:end));
            crossfade = linspace(1, 0, fade_length).' .* fadeOut(1:fade_length, :) + linspace(0, 1, fade_length).' .* fadeIn(end-fade_length+1:end, :);
            newX(1:length(audio), :) = [fadeIn; audio(fade_length+1:end-fade_length, :); crossfade];
            starter = starter + length(audio);
            break; 
        end
    end
else
    for j = 1:2
        for i = 1:size(TRAIN, 2)
            if TRAIN{2, i} == digits(j, 1)
                audio = TRAIN{1, i};
                fadeIn = audio(1:fade_length, :) .* fade_window(1:fade_length);
                fadeOut = audio(end-fade_length+1:end, :) .* flipud(fade_window(fade_length+1:end));
                crossfade = linspace(1, 0, fade_length).' .* fadeOut(1:fade_length, :) + linspace(0, 1, fade_length).' .* fadeIn(end-fade_length+1:end, :);
                newX(starter:starter+length(audio)-1, :) = [fadeIn; audio(fade_length+1:end-fade_length, :); crossfade];
                starter = starter + length(audio) - fade_length;
                break; 
            end
        end
        if digits(j, 1) > 10
            audio = TRAIN{1, 28}; 
            fadeIn = audio(1:fade_length, :) .* fade_window(1:fade_length);
            fadeOut = audio(end-fade_length+1:end, :) .* flipud(fade_window(fade_length+1:end));
            crossfade = linspace(1, 0, fade_length).' .* fadeOut(1:fade_length, :) + linspace(0, 1, fade_length).' .* fadeIn(end-fade_length+1:end, :);
            newX(starter:starter+length(audio)-1, :) = [fadeIn; audio(fade_length+1:end-fade_length, :); crossfade];
            starter = starter + length(audio) - fade_length;
        end
    end
end

audio = TRAIN{1, 29}; 
fadeIn = audio(1:fade_length, :) .* fade_window(1:fade_length);
fadeOut = audio(end-fade_length+1:end, :) .* flipud(fade_window(fade_length+1:end));
crossfade = linspace(1, 0, fade_length).' .* fadeOut(1:fade_length, :) + linspace(0, 1, fade_length).' .* fadeIn(end-fade_length+1:end, :);
newX(starter:starter+length(audio)-1, :) = [fadeIn; audio(fade_length+1:end-fade_length, :); crossfade];
starter = starter + length(audio) - fade_length;
for i = 1:28
        if TRAIN{2, i} == number2
            audio = TRAIN{1, i};
            fadeIn = audio(1:fade_length, :) .* fade_window(1:fade_length);
            fadeOut = audio(end-fade_length+1:end, :) .* flipud(fade_window(fade_length+1:end));
            crossfade = linspace(1, 0, fade_length).' .* fadeOut(1:fade_length, :) + linspace(0, 1, fade_length).' .* fadeIn(end-fade_length+1:end, :);
            newX(starter:starter+length(audio)-1, :) = [fadeIn; audio(fade_length+1:end-fade_length, :); crossfade];
            break; 
        end
end
called=1;
audiowrite("final.wav",newX,Fs);
end