function population = mutation( population, populationSize, number_of_weights )

    for p=1:populationSize
        for w=1:number_of_weights
            random_number = rand();
            if random_number <= 0.02
                random_weight = randi([-15 15]);
                population{p}(1, w) = random_weight;
            end
        end
    end
end

