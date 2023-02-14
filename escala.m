clear all
im1 = imread('frutas.jpg');
figure(1);

imagesc(im1);
colormap('gray');
[l,c]=size(im1);
l2=round(l*2);
c2=round(c*2);

img_Rot=zeros(l,c);
img_Trans=zeros(l2,c2);

u2=0;
v2=0;
u=0;
v=0;



  
im1 = imread('frutas.jpg');
figure(1);

 
     
    
    for x=1:l2 
      for y=1:c2
          
            u2=round(x/2);
            v2=round(y/2);
            %trocar sinal do seno
            if((u2>0) &(v2>0)& (u2<l)&(v2<c))
               img_Rot(x,y)=im1(u2,v2);
               
                
            end
            
        
      end
    end

figure (2);
imagesc(img_Rot);
colormap('gray');