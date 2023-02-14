clear all
im1 = imread('frutas.jpg');
figure(1);
imagesc(im1);
colormap('gray');
[l,c]=size(im1);
img_Trans=zeros(l,c);
u=0;
v=0;


    for x=1:l 
      for y=1:c
        u=x-1;
        r=y-1;
        if((u>0) &(v>0)& (u<l)&(v<c))
            img_Trans(x,y)=img(u,v);
        end
      end
    end

     for x=1:l 
      for y=1:c
          
      end
    end
    
figure (2);
imagesc(img_Trans);
colormap('gray');