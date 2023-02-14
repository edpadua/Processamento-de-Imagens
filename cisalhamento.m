function cisal=cisalhamento(im, ch,cv)
      img=imread(im); 
      %clear all
      im1 = imread('frutas.jpg');
      figure(1);

      imagesc(im1);
      colormap('gray');
      [l,c]=size(im1);

      imcis=zeros(l,c);
      
      for x=1:l
         for y=1:c
             i=round(x-y*cv);
             j=round(y-x*ch);
           if((i>0) &(j>0)& (i<l)&(j<c)) 
             imcis(x,y)=im1(i,j);
         end
      end    

      figure (2);
      imagesc(imcis);
      colormap('gray');

end