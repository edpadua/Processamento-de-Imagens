function [ G ] = GradMorf( m, ee )
%UNTITLED6 Summary of this function goes here
%   Detailed expl A - (A ⊖ B)
 
     Aux1=dilatacao(m,ee);
     Aux2=erosao(m,ee);
     G=double(Aux1)-double(Aux2);
     
     
end
