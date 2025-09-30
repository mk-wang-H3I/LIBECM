%% Terminal voltage of lithium-ion battery, algebraic model
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-25
% 
%% Syntax
% 
% [U_B_V] = LIBECM.cell.mdlAlgebraic(Q_B_Ah, I_B_A, LIBparam);
% 
% Inputs:   Q_B_Ah      - Consumed capacity
%           I_B_A    	- Load current
%           LIBparam	- Parameter structure of LIB
% 
% Outputs:  U_B_V       - Terminal voltage
% 
%% Change log
%
% 2025-09-25 - WANG Mingkai - Baseline version                      - V1.0*
%
%% ====================Start of codesection========================
function U_B_V = mdlAlgebraic(Q_B_Ah, I_B_A, LIBparam)
SOC     = 1 - Q_B_Ah./LIBparam.Q_max_Ah;
U_OC_V  = LIBECM.cell.OCV(SOC,LIBparam);
U_B_V   = U_OC_V - I_B_A.*LIBparam.R_B_ohm;
end
%% ========================End of File=============================
