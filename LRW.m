function [lrwScore ] = LRW( train, steps, lambda)   
%% Calculate the LRW indicator and return the AUC value
    deg = repmat(sum(train,2),[1,size(train,2)]);
    train = train ./ deg; clear deg;                                
    % Seeking a transfer matrix
    I = sparse(eye(size(train,1)));                                 
    % Generate the unit matrix
    sim = I;
    stepi = 0;
    while(stepi < steps)                                     
    % Random walk of the iteration
        sim = (1-lambda)*I + lambda * train' * sim;
        stepi = stepi + 1;
        stepi
    end 
    lrwScore=sim;
end
