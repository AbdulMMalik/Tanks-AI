function population = generatePopulation( size_of_population, number_of_weights )
    population = cell(size_of_population, 1);
    for size=1:size_of_population
        population{size} = randi([-10 10], 1, number_of_weights);
    end   
end

