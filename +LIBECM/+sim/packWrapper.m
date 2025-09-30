%% Wrapper of the dynamic LIB pack model
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-27
% 
%% Syntax
% 
% [xdot, y] = LIBECM.sim.packWrapper(t, x, u, LIBparam, PACKparam);
% 
% Inputs:   t           - Time
%           x           - States, including Q_B_Ah and U_P_V
%           LIBparam	- Parameter structure of LIB
%           PACKparam
% 
% Outputs:  xdot        - State derivatives
%           y           - Output, terminal voltage, mean/all current
% 
%% Change log
%
% 2025-09-27 - WANG Mingkai - Baseline version                      - V1.0*
%
%% ====================Start of codesection========================
function [xdot, y] = packWrapper(t, x, LIBparam, PACKparam)
% NOTE: t is not used but still required as required by MATLAB ode45
% Extract the variables
Q_B_Ah  = x(1,:);
U_P_V   = x(2,:);
I_BP_A  = LIBECM.pack.loadCurrent(t);

% Evaluate the derivatives
SOC                 = 1 - Q_B_Ah./LIBparam.Q_max_Ah;
U_OC_V              = LIBECM.cell.OCV(SOC, LIBparam);
[I_B_A_all,I_B_A]   = LIBECM.pack.mdlDynamics(I_BP_A, U_P_V, PACKparam.Np, PACKparam.R_Ohm_inv, U_OC_V);
[Q_B_Ah_dot, U_P_V_dot, U_B_V] = LIBECM.cell.mdlDynamics(Q_B_Ah, U_P_V, I_B_A, LIBparam);

% Formulate the function output
xdot    = [Q_B_Ah_dot; U_P_V_dot];
y       = [U_B_V; I_B_A; I_B_A_all];
end
%% ========================End of File=============================
