function P = convertToProbabilityMatrix(G)
	denom=sum(G);
	denom(denom==0) = 1;
	P=G*diag(1./denom);
end
	