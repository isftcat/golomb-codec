function code = golomb_enco(n, m)
%   function golomb_enco produces the golomb codeword of the input
%   inputs : n= input number to be encoded, m= the golomb coding parameter
%   output : code is the quantity that contains the golomb coded output
% 
% Author : Vishnu Muralidharan (A25208488), 
%          Univsrsity of Alabama in Huntsville
% Done for the project:
% 'Implementation of Golomb Encoder/Decoder to perform image coding'
% CPE 790: Data Compression, Fall 2014

q = floor(n/m);                   %compute the integer part of the quotient     
r=rem(n,m);                       %compute the reaminder of n/m

q1=ones(1,q);       
q_code=[q1 0];                    %unary code of quotient q
[f,e]=log2(m);                    %f,e used to check if m is a power of 2

if f==0.5 && e == 1               %special case of m=1
    code=q_code;
else if f==0.5                    %check whether m is a power of 2
        r_code=de2bi(r,log2(m),'left-msb'); %log2(m)-bit binary code of r
    else
        a=ceil(log2(m));
        b=floor(log2(m));
        
        if r < (2^a - m)                
            r_code=de2bi(r,b,'left-msb'); %b-bit binary representation of r
        else
            r=r+(2^a - m);
            r_code=de2bi(r,a,'left-msb'); %a-bit binary representation of r
        end
        
    end
        code=[q_code r_code];               %golomb code of the input 
end
