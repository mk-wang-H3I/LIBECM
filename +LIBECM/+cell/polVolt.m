%% Propagate polarization voltage of LIB cell
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-27
% 
%% Syntax
% 
% [U_P_V_dot] = LIBECM.cell.polVolt(U_P_V, I_B_A, LIBparam);
% 
% Inputs:   U_P_V       - Polarization voltage
%           I_B_A    	- Load current
%           LIBparam	- Parameter structure of LIB
% 
% Outputs:  U_P_V_dot   - Time derivative of U_P_V
% 
%% Change log
%
% 2025-09-27 - WANG Mingkai - Baseline version                      - V1.0*
%
%% ====================Start of codesection========================
function U_P_V_dot = polVolt(U_P_V, I_B_A, LIBparam)
U_P_V_dot	= I_B_A./LIBparam.C_P_F - U_P_V./(LIBparam.R_P_ohm.*LIBparam.C_P_F);
end
%% ========================End of File=============================
