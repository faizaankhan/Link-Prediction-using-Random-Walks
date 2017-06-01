function current = RWS(a,epsilon,beta) %a is the network. 
%by Chengwei Lei, UTSA, San Antonio, TX, USA, http://my.cs.utsa.edu/~clei
nodes=size(a,1);


if (nargin < 4)
    stop_value = 1/mean(sum(a));
end
if (nargin < 3)
    beta = 1/mean(sum(a))/nodes;
end
if (nargin < 2)
    epsilon = 1/sum(sum(a))/mean(sum(a));
end



[m,n]=size(a);
aa=max(a,eye(size(a)));%%%%%%%%%%%%%%%%%%%%%%%%%pass to self
bb=sum(aa);
bb=1./bb;
cc=ones(m,1)*bb.*aa;
cc=cc';

cc(find(isnan(cc))) = 0;




current=eye(m,n);
newcurrent=current;


active=ones(m,1);


step=0;
improve_count=0;
active_nodes=0;


    improve=ones(n,1);
    while sum(active),
        [step sum(active) improve_count]
        
        
        active_nodes=sum(active);
        current=newcurrent;
        
        
        curr_act=active*ones(1,m).*current;
        curr_stop=(active*ones(1,m)-1).*current;
        
        temp=curr_act*cc-((((current*cc>0)-(current>0))==1).*( (curr_act>0)*aa ).*beta);
        temp=temp.*(temp>0);
        newcurrent=temp;
        
        newcurrent=newcurrent.*(newcurrent>(beta*cc));
        
        
        newcurrent=newcurrent-(current>0)*aa.*epsilon;
        newcurrent=newcurrent.*(newcurrent>0);


        newcurrent=newcurrent-curr_stop;
        newcurrent=(1./sum(newcurrent'))'*ones(1,nodes).*newcurrent;%normalize


        improve=sum(abs(current-newcurrent)')';
        active=(improve>stop_value);
        
        if active_nodes==sum(active)
            improve_count=improve_count+1;
        else improve_count=0;
        end
    step=step+1;

    
    
        if improve_count>500
            break
        end

    end
