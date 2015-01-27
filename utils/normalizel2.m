function [ store_normz ] = normalizel2( store )

store_normz.trainData  =  normc(store.trainData);
store_normz.testData  =  normc(store.testData);
store_normz.V = normc(store.V);
store_normz.P = normc(store.P);

end

