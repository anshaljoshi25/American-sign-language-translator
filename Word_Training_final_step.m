fileFolder = fullfile('C:', 'VGO research', 'vgo', 'images');
dirOutput = dir(fullfile(fileFolder,'*.jpg'));
fileNames = {dirOutput.name};
figure;
a= montage(fileNames, 'Size', [2 4]);
disp(a);
d=a.CData;
IM = imresize(d,[512 1024], 'bilinear');
IM=im2bw(IM);
imwrite(IM,'images/montagescript.bmp');
