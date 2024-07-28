tstart=0;
tend=0.5;
T=0.5;

fs=8000;
tau=25e-3;

t=tstart:1/fs:tend-1/fs;


silence=zeros(1, round(tau*fs));



Notes=["B" , "A#" , "A" , "G#" , "G" , "F#" , "F" , "E" , "D#" , "D" , "C#" , "C"];
NoteFrequencies=[987.77 , 932.33 , 880 ,830.61 ,783.99,739.99,698.46 , 659.25 , 622.25 , 587.33 , 554.37 , 523.25];

inputSongNotes = {'G','A','G','F','E','F','G','D','E','F','E','F','G'};
inputSongNoteDurations = [T,T,T,T,T,T,2*T,T,T,2*T,T,T,2*T]; 


song=[];
for i=1:length(inputSongNotes)

    [~,num]=find(Notes==inputSongNotes{1,i});
    t = tstart:1/fs:(inputSongNoteDurations(i)-1/fs);
    y=sin(2*pi*NoteFrequencies(num)*t);

    song=[song y silence];

end
sound(song)
audiowrite('mysong.wav',song,fs);