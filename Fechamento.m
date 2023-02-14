function [ Fech ] = Fechamento( m, ee )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

    
     A=dilatacao(m,ee);
     Fech=erosao(A,ee); 

end

