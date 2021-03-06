
for fileno=1:35
    close all;
    
    im = imread(sprintf('Regular/image (%d).png',fileno),'BackgroundColor',[0 1 0]');
    mask = imfilter( im(:,:,2)~=255, fspecial('gaussian',10,10));
 
    [r c x] = size(im);

    start = round(r*0.1);
    stop = round(r*0.9);
    range = stop-start;
    y = zeros(range,1);
    z = zeros(range,1);

    ii = 1;
    for row=start:stop
        y(ii) = find( mask(row,:)==1 , 1, 'first');
        z(ii) = find( mask(row,:)==1 , 1, 'last');

        ii = ii+1;
    end

    x = 1:range+1;
    y = smooth(y,100);
    z = smooth(z,100);
    psy = dpsimplify([x' y], c*0.05);
    psz = dpsimplify([x' z], c*0.05);
    
    ii = 3;
    while ( ii <= length(psy))
        fprintf('\nbottom %f\n',points2angle( psy(ii-2,1),psy(ii-2,2), ...
                                          psy(ii-1,1),psy(ii-1,2),...
                                          psy(ii,1),psy(ii,2) ));       
        ii = ii+1;
    end

    ii = 3;
    while ( ii <= length(psz))
        fprintf('\ntop %f\n',points2angle( psz(ii-2,1),psz(ii-2,2), ...
                                          psz(ii-1,1),psz(ii-1,2),...
                                          psz(ii,1),psz(ii,2) )); 
        ii = ii+1;
    end
    
    
    plot(y,'k');
    hold on;
    plot(z,'g');
    plot(psy(:,1),psy(:,2),'r.-','LineWidth',2);
    plot(psz(:,1),psz(:,2),'r.-','LineWidth',2);
   
    
    input('click to continue');
end