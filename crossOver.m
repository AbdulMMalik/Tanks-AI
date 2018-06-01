function population = crossOver( population, populationSize, numberOfWeights )
    
    for p=1:2:populationSize
        randomNumber = randi([ 1 numberOfWeights ]);
        dummy = population{p}(1, randomNumber:numberOfWeights);
        population{p}(1, randomNumber:numberOfWeights) = population{p+1}(1, randomNumber:numberOfWeights);
        population{p+1}(1, randomNumber:numberOfWeights) = dummy(1, :);
    end
end

