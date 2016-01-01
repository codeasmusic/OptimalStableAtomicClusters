function [cost] = CostFunc(xCoord, yCoord, zCoord)
    cost = 0;
    num = length(xCoord);

    for i = 1:num
        for j = (i+1):num
           distVec =  [xCoord(i)-xCoord(j), yCoord(i)-yCoord(j), zCoord(i)-zCoord(j)];
           dist = norm(distVec, 2);
           if dist == 0
               continue
           end

           cost = cost + 4 * ((1/dist)^12 - (1/dist)^6);
        end
    end
    
    disp(['cost: ', num2str(cost)]);
end