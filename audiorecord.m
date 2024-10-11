function [myAudio,recObj]=audiorecord()
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, 3);
disp('End of recording.');
myAudio = getaudiodata(recObj);
end