function angleout = angle(a,b,c)
%ANGLE Summary of this function goes here
%   Detailed explanation goes here

angleout = acosd((a^2+b^2-c^2)/(2*a*b));

end

