function net = generateNeuralNetwork( set_of_weights, input_layer_size, hidden_layer_size, output_layer_size )

    % random generated input
    xt = randi([-10 10], 225, 50);
    tt = randi([1 7], 7, 50);
    % create a neural network
    net = newff(xt, tt, {10}, {'tansig'}, 'trainr', 'learngd');
    
    % calculating weights of input layer
    %no_of_input_layer_weights = input_layer_size * hidden_layer_size;
    %no_of_hidden_layer_weights = hidden_layer_size * 7;    
    
    % fetch input layer weights and hidden layer weights
    %input_layer_weights = set_of_weights(1, 1:no_of_input_layer_weights);
    %hidden_layer_weights = set_of_weights(1, (no_of_input_layer_weights+1):(no_of_input_layer_weights + no_of_hidden_layer_weights));
   % fetch input layer biases
    %input_layer_biases = set_of_weights(1, (no_of_input_layer_weights + no_of_hidden_layer_weights + 1):(no_of_input_layer_weights + no_of_hidden_layer_weights + hidden_layer_size));
    %hidden_layer_biases = set_of_weights(1, (no_of_input_layer_weights + no_of_hidden_layer_weights + hidden_layer_size + 1):(no_of_input_layer_weights +  no_of_hidden_layer_weights + hidden_layer_size + output_layer_size));
    
    % covert input layer weigths into IW matrix
    input_weights_matrix = [];
    n_previous = 1;
    n_next = input_layer_size;
    for i=1:hidden_layer_size
        input_weights_matrix = [input_weights_matrix;set_of_weights(1, n_previous:n_next)];
        n_previous = n_previous + input_layer_size;
        n_next = n_next + input_layer_size;
    end
    %disp(size(input_weights_matrix));
    % setting weights of neural network for input layer
    net.IW{1, 1} = input_weights_matrix;
    
    % convert hidden layer weights LW matrix
    hidden_weights_matrix = [];
    n_previous = (n_next - input_layer_size) + 1;
    n_next = (n_next - input_layer_size) + hidden_layer_size;
    
    for i=1:output_layer_size
        hidden_weights_matrix = [hidden_weights_matrix;set_of_weights(1, n_previous:n_next)];
        n_previous = n_previous + hidden_layer_size;
        n_next = n_next + hidden_layer_size;
    end
    
    %disp(size(hidden_weights_matrix));
    % set LW for neural network
    net.LW{2, 1} = hidden_weights_matrix;
    
    %set biases for input layer
    input_biases_matrix = [];
    n_previous = (n_next - hidden_layer_size) + 1;
    
    input_biases_matrix = [input_biases_matrix;set_of_weights(1, n_previous:n_next)];
    input_biases_matrix = input_biases_matrix';
    
    n_previous = n_previous + hidden_layer_size;
    n_next = n_next + output_layer_size;
    
    % set biases for input layer
    net.b{1, 1} = input_biases_matrix;
    
    %disp(size(input_biases_matrix))
    % set biases for hidden layer
    hidden_biases_matrix = [];
    hidden_biases_matrix = [hidden_biases_matrix;set_of_weights(1, n_previous:n_next)];
    hidden_biases_matrix = hidden_biases_matrix';
    
    %disp(size(output_biases_matrix))
    
    % set biases for hidden layer
    net.b{2, 1} = hidden_biases_matrix;
end

