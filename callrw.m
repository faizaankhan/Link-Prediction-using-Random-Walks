function sccrr = callrw(p)
% p is adj mat
% a= coef
pp=p;
sccrr=[];
for i =1:length(pp)
    i
    e=zeros(1,length(pp));
    e(i)=1;
    s=e;
    count=1;
    while(1)
       count=count+1;
  %    count
       
     sn=s*p;
     d=sum((s-sn).^2);
    if(d<.09) %chngd to .09 frm .01
        sccrr(:,i)=s;
        break;
    
    else        
      s=sn;
    end
  
    end
    s;
end
