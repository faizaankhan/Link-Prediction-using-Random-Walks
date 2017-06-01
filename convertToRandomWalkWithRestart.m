function R = convertToRandomWalkWithRestart(G,c)
	
	P = convertToProbabilityMatrix(G);
	
	R = c*inv(eye(size(P)) - (1-c)*P);
end
