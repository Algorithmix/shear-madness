function out = points2angle( ax,ay, bx,by, cx,cy )
%ANGLE Summary of this function goes here
%   Detailed explanation goes here

out = angle(mag(ax,ay,bx,by),mag(bx,by,cx,cy),mag(ax,ay,cx,cy));

end

