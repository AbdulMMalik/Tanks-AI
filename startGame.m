% initilizing game setup
rows = 15; cols = 15;
turn = 11;
total_turns = 1000;
globalBoard = initializeBoard(rows, cols);
agentLocalBoard = zeros(15, 15);
agentLocalBoard = agentLocalBoard - 1;
globalBoard(3, 14) = 22;
globalBoard(13, 2) = 11;
globalBoard(1, 2) = 33;
globalBoard(13, 14) = 44;

% envriornmental setup
%{
size_of_population = 250;
hidden_layer_size = 10;
input_layer_size = 225;
output_layer_size = 7;
scores = [];
%}

p1 = {};
p1{1} = 11;
p1{2} = initializeBoard( rows, cols );
p1{2}( 15, 1 ) = 11;
p1{3} = 1;
p1{4} = 10;
p1{5} = true;

p2 = {};
p2{1} = 22;
p2{2} = initializeBoard(rows, cols);
p2{2}(1, 15) = 22;
p2{3} = 2;
p2{4} = 10;
p2{5} = true;

p3 = {};
p3{1} = 33;
p3{2} = initializeBoard(rows, cols);
p3{2}(1, 1) = 33;
p3{3} = 4;
p3{4} = 10;
p3{5} = true;

p4 = {};
p4{1} = 44;
p4{2} = initializeBoard(rows, cols);
p4{2}(15, 15) = 44;
p4{3} = 3;         
p4{4} = 10;
p4{5} = true;

globalBoard = placeRocks(globalBoard);
grid = boardToGrid( globalBoard, p1, p2, p3, p4 );
imshow( grid );

%calculate total number of weights
number_of_weights = hidden_layer_size * input_layer_size + hidden_layer_size * output_layer_size + hidden_layer_size + output_layer_size;

% here need to load set of wieghts created during training from file
% also create a neural network object using name net through a function generate
% neural network.....

while ( total_turns > 0 )
    % turn of agents
    if (turn ~= 11)
        move = randomMove();
    end
    if ( turn == 11 && p1{5} == true )
        % pass localboard to 
        move = net(agentLocalBoard); % generate move by nerual network created during training of agent
       [ p1, p2, p3, p4,  globalBoard ] = makeLegalMove( globalBoard, move, p1, p2, p3, p4);
       turn = changeTurn ( turn );
       grid = boardToGrid( globalBoard,  p1, p2, p3, p4 );
       imshow( grid );
       
    elseif ( turn == 22 && p2{5} == true )
        [ p2, p1, p3, p4, globalBoard ] = makeLegalMove( globalBoard, move, p2, p1, p3, p4);
        turn = changeTurn ( turn );
        grid = boardToGrid( globalBoard, p1, p2, p3, p4 );
        imshow( grid );
        
    elseif ( turn == 33 && p3{5} == true )
        [ p3, p1, p2, p4, globalBoard ] = makeLegalMove( globalBoard, move, p3, p1, p2, p4);
        turn = changeTurn ( turn );
        grid = boardToGrid( globalBoard, p1, p2, p3, p4 );
        imshow( grid );
        
    elseif( p4{5} == true )
        [ p4, p1, p2, p3, globalBoard ] = makeLegalMove( globalBoard, move, p4, p1, p2, p3);
        turn = changeTurn ( turn );
        grid = boardToGrid( globalBoard, p1, p2, p3, p4 );
        imshow( grid );
    end 
    total_turns = total_turns - 1;
    disp(total_turns);
end

disp('P1 Agent Score: ')
disp(p1{1, 4});

disp('P2 Score: ')
disp(p2{1, 4});

disp('P3 Score: ')
disp(p3{1, 4});

disp('P4 Score: ')
disp(p4{1, 4});
    
    