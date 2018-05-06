function y=ComputeZero4(x)
   if length(find(x==0))==64
       y=[0,0,0,0,0];       
   else
        temp=GetBlockACUnit4(x);
        temp1=abs(temp);
        temp1=sum(temp1,2);
        temp(find(temp1==0),:)=[];
%         if(find(temp(:,1)==0)&find(temp(:,2)==0))
%         temp(find(temp(:,1)==0,:))=[];       
%         end               
       y=[mean(x(find(x~=0))),std(x(find(x~=0))),length(find(x~=0)),mean(temp(:,1)),std(temp(:,1))];       
   end
end
