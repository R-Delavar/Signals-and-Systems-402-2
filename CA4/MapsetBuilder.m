function mapset = MapsetBuilder()
    mapset = cell(2,32);
    alphabet = 'abcdefghijklmnopqrstuvwxyz .,!";';
    for i = 1:32
        mapset{1,i} = alphabet(i);
        mapset{2,i} = dec2bin(i-1,5);
    end
end