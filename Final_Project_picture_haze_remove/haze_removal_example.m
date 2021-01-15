cd('C:\Users\wenhanzhang\Desktop\ECE 529\Project');

% Input Options
ext           = '.jpg';
filenames     = {'mountain'};
scalingFactor = 0.5;

numFiles = size(filenames, 2);
fileIndex = numFiles;
% Get Filename
filename = char(filenames(fileIndex));
disp(strcat('Processing: ', filename));
    
% Read Image
imageRGB = imresize(readIm(filename, ext), scalingFactor);
figure
imshow(imageRGB);

% Dark Channel Estimation
dark = darkChannel(imageRGB);
figure
imshow(dark);

% Estimating the Atmospheric Light
atmospheric = atmLight(imageRGB, dark);

% Estimating the Transmission Map
transmission = transmissionEstimate(imageRGB, atmospheric);
figure
imshow(transmission);
    
% Refine the Transmission Map
refinedTransmission = matte(imageRGB, transmission);
figure
imshow(refinedTransmission);

% Haze Removal
radiance = getRadiance(atmospheric, imageRGB, transmission);
figure
imshow(radiance);

% Refined Haze Removal
refinedRadiance = getRadiance(atmospheric, imageRGB, refinedTransmission);
figure
imshow(refinedRadiance);
