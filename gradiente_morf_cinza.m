function g=gradiente_morf_cinza(im,e,xo1,yo1);
   

   Dilat=dilatacao_cinza(im,e,2,2);
   Erod=erosao_cinza(im,e,2,2);
   g=Dilat-Erod;
   

end