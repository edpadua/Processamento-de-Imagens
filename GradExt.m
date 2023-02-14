function [ G ] = GradExt( m, ee )
%UNTITLED6 Summary of this function goes here
%   Detailed expl A - (A ⊖ B)
 
     Aux=dilatacao(m,ee);
     G=double(Aux)-double(m);
     
     
end

