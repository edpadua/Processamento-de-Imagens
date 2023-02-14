function eros=erosao(img,EE)
  [l,c]=size(img);
  [le,lc]=size(EE);
  eros=zeros(l,c);
  for i=1:l
    for j=1:c
        if(img(i,j)>0)
           s=1;
           k=1;
           while((k<=le)&&(s==1))
              indx=i+EE(k,1);
              indy=j+EE(k,2);
              if(indx<1||indx>l||indy<1||indy>c||img(indx,indy)==0)
                 s=0;
              end    
              k=k+1;
           end    
           if(s==1)
              eros(i,j)=1;
           end
        end    
    end
  end
 
end