%main function
function [X, Y, Z] = StableAtoms(numOfAtoms)
    kValue = 0.1;
    lamda = 0.9;
    currIterations = 0;
    maxIterations = 200;
    global xCoord yCoord zCoord;
    
    initCoord(numOfAtoms);
    tValue = initTValue(kValue, numOfAtoms);
    
    while currIterations < maxIterations
        moveVertex(numOfAtoms, tValue);
        tValue = tValue * lamda;
        
        currIterations = currIterations + 1;
    end
    
    scaleCoord(numOfAtoms);
    X = xCoord;
    Y = yCoord;
    Z = zCoord;
end

%randomly initialize the coordinate of atoms
function [] = initCoord( num )
    global xCoord yCoord zCoord;
    c = sqrt(num);
    xCoord = c * rand(1, num);
    yCoord = c * rand(1, num);
    zCoord = c * rand(1, num);
end

%initialize the temperature of simulated annealing
function [tValue] = initTValue(num, KValue)
    tValue = KValue * sqrt(num);
end

%move atoms to new positions
function [] = moveVertex(num, tValue)
    global xCoord yCoord zCoord;

    for i = 1:num     
       force = calcForce(num, i);
       forceNorm = norm(force, 2);
       
       moveStep = (force / forceNorm) * min(tValue, forceNorm);
       xCoord(i) = xCoord(i) + moveStep(1);
       yCoord(i) = yCoord(i) + moveStep(2);
       zCoord(i) = zCoord(i) + moveStep(3);
    end
end

%calculate the force
function [force] = calcForce(num, self)
    repulsion = calcRepulsion(num, self);
    attraction = calcAttraction(num, self);      
    force = repulsion + attraction;
end

%calculate the repulsion
function [repulsion] = calcRepulsion(num, self)
    repulsion = [0, 0, 0];
    for j = 1:num
       if j == self
           continue
       end
     
       [dist, distVec] = calcDistance(self, j);
       repulValue = 1 / dist^2;
       repulsion = repulsion + distVec * repulValue;
    end
end

%calculate the attraction
function [attraction] = calcAttraction(num, self)
    attraction = [0, 0, 0];
    for j = 1:num
        if j == self
            continue
        end
       
        [dist, distVec] = calcDistance(j, self);
        attrValue = dist^2 * log(dist / 1);
        attraction = attraction + distVec * attrValue;
    end
end

%calculate the distance between two atoms
function [dist, distVec] = calcDistance(index1, index2)
    global xCoord yCoord zCoord;
    distVec = [xCoord(index1)-xCoord(index2), yCoord(index1)-yCoord(index2), zCoord(index1)-zCoord(index2)];
    dist = norm(distVec, 2);
    
    if dist < 0.1
         distVec = [0.1, 0.1, 0.1];
         dist = 0.17;
    end
end

%normalize coordinates
function [scale] = scaleCoord(num)
    global xCoord yCoord zCoord;
    distList = [];
    
    for i = 1:num
        for j = (i+1):num
           distVec =  [xCoord(i)-xCoord(j), yCoord(i)-yCoord(j), zCoord(i)-zCoord(j)];
           dist = norm(distVec, 2);
           distList = [distList, dist];
        end
    end
    
    scale = 1 / min(distList);
    xCoord = xCoord * scale;
    yCoord = yCoord * scale;
    zCoord = zCoord * scale;
end