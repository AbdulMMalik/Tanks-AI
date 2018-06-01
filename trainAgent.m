
% envriornmental setup
size_of_population = 250;
hidden_layer_size = 10;
input_layer_size = 225;
output_layer_size = 7;
scores = [];

%calculate total number of weights
number_of_weights = hidden_layer_size * input_layer_size + hidden_layer_size * output_layer_size + hidden_layer_size + output_layer_size;

%generate population according to size of population
population = generatePopulation(size_of_population, number_of_weights);
    
for i=1:30
    fprintf('Generation_%d\n', i)
    for p=1:size_of_population
        fprintf('Population_%d\n', p)
        net = generateNeuralNetwork(population{p}, input_layer_size, hidden_layer_size, output_layer_size);
        scores(p) = evaluateFitness( net );
    end
    
    [ scores, indexes ] = sort( scores,'Descend' );
    score_file = sprintf('scoreG_%d.mat',i);
    save(score_file,'scores');
    
    sorted_population = {};
    for p = 1:size_of_population
        sorted_population{p} = population{indexes(p)};
    end
    
    population_file = sprintf('populationG_%d.mat', i);
    save(population_file, 'sorted_population');
    
    population = crossOver( sorted_population, size_of_population, number_of_weights );
    population = mutation( population, size_of_population, number_of_weights );
end
