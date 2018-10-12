save('networkFullHomo.mat','nwt');
data=load('networkFullHomo.mat');
 f=fieldnames(data);
 for k=1:size(f,1)
   xlswrite('HomosapiensMatrix.xlsx',data.(f{k}),f{k})
 end
 
