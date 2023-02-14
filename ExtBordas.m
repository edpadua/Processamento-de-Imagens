function [ G ] = ExtBordas( m, ee )
%UNTITLED6 Summary of this function goes here
%   Detailed expl A - (A ⊖ B)
 
     Abert=Abertura(m,ee);
     Aux2=erosao(m,ee);
     G=double(Abert)-double(Aux2);
     
     
end
