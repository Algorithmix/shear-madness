

for fileno=0:9
    close all;
    im = imread(sprintf('Regular/image%d.png',fileno));
    bw = im2bw(im);
    
    [r c] = size(bw);
    endy = find(diff(bw(r*0.2:r*0.8,end)) == -1 , 1, 'last');
    endx = find(diff(bw(end,:)) == -1 , 1, 'last');
    rise = r - endy;
    run = c  - endx;

    slope = run/rise;

    top = im(1:endy,:,:);

    focus = im( endy:end, :,:);

    a = slope;
    T = maketform('affine',[1 0 0 ; a 1 0; 0 0 1]);
    result = imtransform(focus,T,'cubic','FillValues',[0 0 0]');
    imshow(result)
    [resR resC ~] = size(result);
    top = [top zeros(endy, resC-c,3)];
    subplot(1,2,1)
    imshow([top; result])
    subplot(1,2,2)
    imshow(im)
    input('enter to continue')
end