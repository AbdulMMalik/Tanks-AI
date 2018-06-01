function move = generateAgentMove( net, agentLocalBoard )

    agentLocalBoard = reshape(agentLocalBoard, 1, 225);
    agentLocalBoard = agentLocalBoard';
    
    result = net(agentLocalBoard);
    [ dummy_value, move ] = max(result);
end

