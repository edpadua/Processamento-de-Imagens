function [ Ab ] = Abertura( m, ee)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

    
     A=erosao(m,ee);
     Ab=dilatacao(A,ee); 

end

