function chomp(image,tops,bottoms)

[tr tc] = size(tops);
[br bc] = size(bottoms);

if (tr ~= br)
   return;
else
    len = tr;
end

ii = 2;
while( ii <= len )
    
    slope = (tops(ii,2)-tops(ii-1,2)) / (tops(ii,1)-tops(ii-1,1));
    fprintf('slope = %f \n', slope);
    
    
    % From start to end select focal point of image
    focus = image( tops(ii-1,1):tops(ii,1), :,:);
    f2 = focus;
    a = -1 *slope;

    if(tops(ii,2)-tops(ii-1,2) > 0) 
        %focus = flipdim(focus, 2);
        f2(:,:,1)=flipud(focus(:,:,1));
        f2(:,:,2)=flipud(focus(:,:,2));
        f2(:,:,3)=flipud(focus(:,:,3));
        T = maketform('affine',[1 0 0 ; a 1 0; 0 0 1]);
        result = imtransform(f2 ,T,'cubic','FillValues',[0 0 0]');
        result(:,:,1)=flipud(result(:,:,1));
        result(:,:,2)=flipud(result(:,:,2));
        result(:,:,3)=flipud(result(:,:,3));
    else
        T = maketform('affine',[1 0 0 ; a 1 0; 0 0 1]);
        result = imtransform(focus,T,'cubic','FillValues',[0 0 0]');    
    end


    figure;
    subplot(1,2,1)
    imshow(result)
    subplot(1,2,2)
    imshow(focus)
    
    
    ii = ii +1;
end
end