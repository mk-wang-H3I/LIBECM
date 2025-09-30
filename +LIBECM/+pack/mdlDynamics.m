%% ECM of LIB pack based on the cell model in this repo
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-27
% 
%% Change Log
% 
% 2025-09-27 - WANG Mingkai - Baseline version                      - V1.0*
%
%% Syntax
%  [I_B_A_all,I_B_A_mean] = LIBECM.pack.mdlDynamics(I_BP_A, U_P_V, Np, R_Ohm_inv, U_OC_V);
%
%   Inputs: I_BP_A      - Battery package current
%           U_P_V       - Polarization voltage
%           Np          - Number of cells in parallel, value
%           R_Ohm_inv 	- Inverse of the resistance matrix
%           U_OC_V      - Open-circuit voltage
%
%   Output: I_B_A_all  	- Battery cell current, all collected in a vector
%           I_B_A_mean 	- Battery cell current, mean value
%
%% =========Start-Of-Codesection===================================
function [I_B_A_all,I_B_A_mean] = mdlDynamics(I_BP_A, U_P_V, Np, R_Ohm_inv, U_OC_V)
% Prepare the coefficient vector to solve the pack current
b           = [
    (-U_OC_V + U_P_V).*ones(Np, 1);
    I_BP_A];
x           = R_Ohm_inv*b;

% Cell
I_B_A_all   = x(2:end,:);
I_B_A_mean  = mean(I_B_A_all);
end
%% =========End-Of-File============================================
