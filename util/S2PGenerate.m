function S2PGenerate(filename, Freq, S11, S21, S12, S22)
header = ['!Agilent Technologies,N5225A,MY51451268,A.09.80.20\n'...
'!Agilent N5225A: A.09.80.20\n'...
'!Date: Some Date 14:23:51\n'...
'!Correction: S11(Off) \n'...
'!S21(Off) \n'...
'!S12(Off) \n'...
'!S22(Off) \n'...
'!S2P File: Measurements: S11, S21, S12, S22:\n'...
'# Hz S  dB   R 50\n'];
[filehandle, message] = fopen(filename, 'wt'); % open file
disp(message);
fprintf(filehandle, header);
fclose(filehandle);

dlmwrite(filename,[Freq 20*log10(abs(S11)) rad2deg(angle(S11))...
    20*log10(abs(S21)) rad2deg(angle(S21)) ...
    20*log10(abs(S12)) rad2deg(angle(S12)) ...
    20*log10(abs(S22)) rad2deg(angle(S22)) ...
    ],'-append','delimiter',' ','precision','%8.3f');
format longE