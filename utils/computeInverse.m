function [ reg ] = computeInverse( pars )

lambda = pars.lambda_ls;
inverse = pars.inverse;
reg = inv(inverse'*inverse + eye(size(inverse,2)).*lambda)*inverse';

end

