function scoreAA= AANew(train)

[row,col]=size(train);
train1 = train ./ repmat(log(sum(train,2)),[1,size(train,1)]); 
% Calculate the weight of each node, 1 / log (k_i), the network size is too large need to block processing

train1(isnan(train1)) = 0; 
train1(isinf(train1)) = 0;  
% Set the exception value obtained by dividing the divisor by 0 to 0

sim = train * train1;   clear train1;  
% To achieve the calculation of similarity matrix 
    
% scoreCN=adj*adj;
maxCN = max(sim(:));

degree=sum(train);
degree=1./degree;
degree=repmat(degree',1,col);
degree=degree.*train;
scoreAA=(1+sim/maxCN).*degree;
   scoreAA(isnan(scoreAA)) = 0; 
 scoreAA(isinf(scoreAA)) = 0; 
 
