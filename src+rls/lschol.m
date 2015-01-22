function [ x ] = lschol( A,b,ls )

[R,p] = chol(A'*A + eye(size(A'*A,2)).*ls);
x = R \ (R' \ (A'*b));

end

