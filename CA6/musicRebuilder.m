function musicRebuilder(given_song)
    tstart=0;
    T=0.5;

    fs=8000;
    tau=25e-3;

    silence=zeros(1, round(tau*fs));

    Notes=["B" , "A#" , "A" , "G#" , "G" , "F#" , "F" , "E" , "D#" , "D" , "C#" , "C"];
    NoteFrequencies=[987.77 , 932.33 , 880 ,830.61 ,783.99,739.99,698.46 , 659.25 , 622.25 , 587.33 , 554.37 , 523.25];

    song=[];
    for i=1:length(given_song)

        [~,num]=find(Notes==given_song{1,i});
        t = tstart:1/fs:(str2double(given_song{2,i})*T-1/fs);
        y=sin(2*pi*NoteFrequencies(num)*t);

        song=[song y silence];

    end
    sound(song)
    audiowrite('p2_3.wav',song,fs);
    
end