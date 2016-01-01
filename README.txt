This is a algorithm for optimizing the stable structure of atomic clusters.

usages:

>> [X, Y, Z] = StableAtoms(NumberOfAtoms); % X, Y, Z are coordinates.
>> CostFunc(X, Y, Z); %calculate cost.
>> Draw(X, Y, Z); %draw graph.


Results:

>> [X, Y, Z] = StableAtoms(26);
>> CostFunc(X, Y, Z);
cost: -64.7836
>> [X, Y, Z] = StableAtoms(38);
>> CostFunc(X, Y, Z);
cost: -97.9418
>> [X, Y, Z] = StableAtoms(55);
>> CostFunc(X, Y, Z);
cost: -142.9032
>> [X, Y, Z] = StableAtoms(75);
>> CostFunc(X, Y, Z);
cost: -203.403
>> [X, Y, Z] = StableAtoms(100);
>> CostFunc(X, Y, Z);
cost: -272.6807
>> [X, Y, Z] = StableAtoms(150);
>> CostFunc(X, Y, Z);
cost: -422.8752