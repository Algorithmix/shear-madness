im = imread('Regular/image4.png');
bw = im2bw(im);
%hull = bwconvhull(bw);
[r c] = size(bw);
endy = find(diff(bw(:,end)) == -1 , 1, 'last');
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
imshow([top; result])

