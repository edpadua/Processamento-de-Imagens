clear all


img = imread('digital.jpg');

tamf=8;

[ l c ]=size(img);

nova_img=zeros(l,c);

vetor=zeros(1,tamf*tamf);

for i=1:l
   for j=1:c
       pos=1;
       for k=i-tamf:i+tamf
         for m=j-tamf:j+tamf
            if((k>0&&m>0)&&(k<l&&m<=c))
                pos=pos+1;
                vetor(pos)=img(k,m);
           end    
        end
       vet_ordenado=sort(vetor);
       valor=vet_ordenado(round(pos/2));
       nova_img(i,j)=valor;
         
   end
   end
end
   


figure(4);
imagesc(nova_img);
colormap('gray');