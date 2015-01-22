function [ xp ] = solveX( table,obs,sol,ls )

if sol==1 %% sparsity
    opts.tau = ls;
    opts.delx_mode = 'chol';
    xp = l1homotopy_v1(table, obs, opts);
    xp = xp.x_out;
end

if sol==2 %% least sqaures
    xp = lschol(table,obs,ls);
end


end

