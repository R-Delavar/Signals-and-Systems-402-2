function [decoded] = musicDCD(music_address)
    fs=8000;
    [amp,~]=audioread(music_address);



    Notes=["B" , "A#" , "A" , "G#" , "G" , "F#" , "F" , "E" , "D#" , "D" , "C#" , "C"];
    NoteFrequencies=[987.77 , 932.33 , 880 ,830.61 ,783.99,739.99,698.46 , 659.25 , 622.25 , 587.33 , 554.37 , 523.25];




    notes={};
    en=length(amp);
    n=1;
    while en~=0
        for i=2:en
            if amp(i)==0 && amp(i+1)==0 
                break        
            end
        end
        y=amp(1:i-1);
        notes(n)={y};
        n=n+1;
        amp=amp(i+200:en);
        en=length(amp);

    end

    for i=1:length(notes)
    
        y=cell2mat(notes(i));
        N=length(y);
        m=abs(fftshift(fft(y)));
        [row,~]=find(m==max(m));
        frq=(row(2)-N/2-1)*fs/N;
        for n=1:length(NoteFrequencies)
            trsh=2;
            if abs(NoteFrequencies(n)-frq)<trsh
                decoded(1,i)=Notes(n);
                decoded(2,i)=N/4000;
            end
        end
    end
    
end