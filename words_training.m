ii=1;
for k = 1:8
    
    filename = [sprintf('%03d',ii) '.jpg'];
    fullname = fullfile('c:', 'VGO research', 'images',filename);
    filename2 = [sprintf('%04d',ii) '.jpg'];
    fullname2 = fullfile('c:', 'VGO research', 'vgo', 'images',filename);
    IMG = imread(fullname);
    IM=rgb2gray(IMG);
    c1=edge(IM,'canny');
    d=im2bw(c1);

% imshow(Out,[]);

C1 = imresize(d, [256 256], 'bilinear'); %

    imwrite(C1,fullname2) 
    %// IMG = some_operation(IMG);
    mov(k).cdata = imresize(IMG,[vidHeight vidWidth]);
    ii = ii+1;
end

%c=corr2(a,b)
% figure;
% c=rgb2grey(a.image);

