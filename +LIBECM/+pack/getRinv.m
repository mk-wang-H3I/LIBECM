%% Get the inverse of internal resistance matrix
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-28
% 
%% Change Log
% 
% 2025-09-28 - WANG Mingkai - Baseline version                      - V1.0*
%
%% Syntax
%  [R_Ohm_inv] = LIBECM.pack.getRinv(Np, R_Ohm_vec);
%
%   Inputs: Np          - Number of cells in parallel
%           R_Ohm_vec  	- Resistance vector of the parallel module
%
%   Output: R_Ohm_inv 	- Inverse of the resistance matrix
%
%% =========Start-Of-Codesection===================================
function [R_Ohm_inv] = getRinv(Np, R_Ohm_vec)
R_mat       = [
    -ones(Np,1), diag(-R_Ohm_vec);
    0, ones(1,Np)];
R_Ohm_inv   = inv(R_mat);
end
%% =========End-Of-File============================================
