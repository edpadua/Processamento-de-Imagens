function [ G ] = GradInt( m, ee )
%UNTITLED6 Summary of this function goes here
%   Detailed expl A - (A ⊖ B)
 
     Aux=erosao(m,ee);
     G=double(m)-double(Aux);
     
     
end

