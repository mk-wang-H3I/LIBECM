%% Wrapper of the dynamic LIB cell model
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-27
% 
%% Syntax
% 
% [xdot, y] = LIBECM.sim.cellWrapper(t, x, u, LIBparam);
% 
% Inputs:   t           - Time
%           x           - States, including Q_B_Ah and U_P_V
%           u           - Control, load current herein
%           LIBparam	- Parameter structure of LIB
% 
% Outputs:  xdot        - State derivatives
%           y           - Output, terminal voltage herein
% 
%% Change log
%
% 2025-09-27 - WANG Mingkai - Baseline version                      - V1.0*
%
%% ====================Start of codesection========================
function [xdot, y] = cellWrapper(t, x, u, LIBparam) %#ok
% NOTE: t is not used but still required as required by MATLAB ode45
% Extract the variables
Q_B_Ah  = x(1,:);
U_P_V   = x(2,:);
I_B_A   = u;

% Evaluate the derivatives
[Q_B_Ah_dot, U_P_V_dot, U_B_V] = LIBECM.cell.mdlDynamics(Q_B_Ah, U_P_V, I_B_A, LIBparam);

% Formulate the function output
xdot    = [Q_B_Ah_dot; U_P_V_dot];
y       = U_B_V;
end
%% ========================End of File=============================
