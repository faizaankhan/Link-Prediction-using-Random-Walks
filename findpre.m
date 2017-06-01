function precisn=findpre(value,top,n)
%for i=1:115
for i=1:n
    preval(i,:)=value(i,:)/top;
    
end
sumval=sum(preval);
precisn=sumval/length(value)
