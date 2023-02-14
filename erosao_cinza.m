function erod=erosao_cinza(im,e,xo1,yo1);
     xo=1;
yo=1;
xo1=xo1+1;
yo1=yo1+1;
dx=xo-xo1; %diferença entre os pontos da origem inicial e origem do elemento estruturante
dy=yo-yo1;
dif=[dx dy];

%encontra os tamanhos imagem e elementos estruturante
    

     [l1 c1]=size(e);

     [l c]=size(im);
     
     
     k2=1;
    
     for k=1:l1
        for k1=1:c1
           EE(k2,1)=k+dx;              
           EE(k2,2)=k1+dx;
           k2=k2+1;
        end    
     end
     
     EE;
     
     [le ce]=size(EE);
     
     
     erod=zeros(l,c);
     for i=1:l
        
        for j=1:c
               im(i,j);
               somas=10000*ones(l1,c1);    
               for k=1:le
                   indx=i+EE(k,1);
                   indy=j+EE(k,2);
                   if(indx>0 && indy>0 && indx<=l && indy<=c)
                      %e(EE(k,1)-dx,EE(k,2)-dy)
                      somas(EE(k,1)-dx,EE(k,2)-dy)=im(indx,indy)-e(EE(k,1)-dx,EE(k,2)-dy); 
                      %dilat(indx,indy)=1;
                   end  
                   
                 
               end    
              
              somas;
              erod(i,j)=min(min(somas));
              
        end   
     erod;
%dilat=im;

end