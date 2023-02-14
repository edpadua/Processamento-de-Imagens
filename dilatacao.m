function dilat=dilatacao(im, EE)
     [l c]=size(im);
     [le ce]=size(EE);
     dilat=zeros(l,c);
     for i=1:l
        for j=1:c
            if(im(i,j)>0)
               for k=1:le
                   indx=i+EE(k,1);
                   indy=j+EE(k,2);
                   if(indx>0 && indy>0 && indx<=l && indy<=c)
                      dilat(indx,indy)=1;
                   end    
            end    
        end    
     end   


end