%% Terminal voltage of lithium-ion battery, 1st-order ODE
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-25
% 
%% Syntax
% 
% [Q_B_Ah_dot, U_P_V_dot, U_B_V] = LIBECM.cell.mdlDynamics(Q_B_Ah, U_P_V, I_B_A, LIBparam);
% 
% Inputs:   Q_B_Ah      - Consumed capacity
%           U_P_V       - Polarization voltage
%           I_B_A       - Load current
%           LIBparam	- Parameter structure of LIB
% 
% Outputs:  U_B_V       - Terminal voltage
%           U_P_V_dot 	- Time derivative of U_P_V
%           Q_B_Ah_dot 	- Time derivative of Q_B_Ah
% 
%% Change log
%
% 2025-09-25 - WANG Mingkai - Baseline version                      - V1.0*
%
%% ====================Start of codesection========================
function [Q_B_Ah_dot, U_P_V_dot, U_B_V] = mdlDynamics(Q_B_Ah, U_P_V, I_B_A, LIBparam)
% Battery cell model
SOC         = 1 - Q_B_Ah/LIBparam.Q_max_Ah;                                	% State of charge [0,1]
U_OC_V      = LIBECM.cell.OCV(SOC,LIBparam);                              	% Open-circuit voltage [V]

% Time derivatives of states
U_P_V_dot 	= LIBECM.cell.polVolt(U_P_V,I_B_A,LIBparam);                 	% Polarization voltage dot [V/s]
Q_B_Ah_dot  = I_B_A/3600;                                                   % Capacity consumption dot [Ah/s]

% Ouput: terminal voltage
U_B_V       = U_OC_V - U_P_V - LIBparam.R_B_ohm.*I_B_A;                   	% Battery terminal voltage [V]
end
%% ========================End of File=============================
