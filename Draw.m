function [] = Draw(xCoord, yCoord, zCoord)
    xx = [];
    yy = [];
    zz = [];
    num = length(xCoord);
    
    for i = 1:num
       for j = i:num
           xx = [xx, [xCoord(i), xCoord(j)]];
           yy = [yy, [yCoord(i), yCoord(j)]];
           zz = [zz, [zCoord(i), zCoord(j)]];
           
       end
    end
    plot3(xx, yy, zz);
end