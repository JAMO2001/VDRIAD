function dust = vdriadCalculateForces(dust,params,kernel)
%CalculateForces Function to Calculate the forces of the interacting dust
%particles and ion wakes.
    % Time to seed the random number generator
    seed = convertTo(datetime('now'),'posixtime');

    % CALCULATE THE FORCES
    [dust.d_x,dust.d_y,dust.d_z,...
     dust.d_vx,dust.d_vy,dust.d_vz,...
     dust.d_ax,dust.d_ay,dust.d_az,...
     dust.d_radius,...
     dust.d_mass,...
     dust.d_charge,...
     dust.d_wake_charge,...
     dust.d_wake_length,...
     dust.d_wake_nn_z,...
     dust.d_wake_nn_r,...
     dust.d_wake_nn_id] = feval(kernel,...
                        dust.d_x,dust.d_y,dust.d_z,...
                        dust.d_vx,dust.d_vy,dust.d_vz,...
                        dust.d_ax,dust.d_ay,dust.d_az,...
                        dust.d_radius,...
                        dust.d_mass,...
                        dust.d_charge,...
                        dust.d_wake_charge,...
                        dust.d_wake_length,...
                        dust.d_wake_nn_z,...
                        dust.d_wake_nn_r,...
                        dust.d_wake_nn_id,...
                        params.DUST_RADIUS_MEAN,...
                        params.COULOMB,...
                        params.ION_DEBYE,...
                        params.ELECTRON_DEBYE,...
                        params.CUTOFF_MULTIPLIER,...
                        params.CELL_RADIUS,...
                        params.CELL_CHARGE,...
                        params.CELL_HEIGHT,...
                        params.SHEATH_HEIGHT,...
                        params.WAKE_CHARGE_PERCENT,...
                        params.GRAVITY,...
                        params.GAS_TEMPERATURE,...
                        params.GAS_PRESSURE,...
                        params.TIME_STEP,...
                        seed,...
                        params.NUM_PARTICLES);
end