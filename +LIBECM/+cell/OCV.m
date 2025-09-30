%% Nonlinear open-circuit voltage (OCV) of lithium-ion battery
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-25
% 
%% Syntax
% 
% [U_OC_V] = LIBECM.cell.OCV(SOC, LIBparam);
% 
% Inputs:   SOC         - Load current
%           LIBparam	- Parameter structure of LIB
% 
% Outputs:  U_OC_V      - Open-circuit voltage
% 
%% Change log
%
% 2025-09-25 - WANG Mingkai - Baseline version                      - V1.0*
%
%% ====================Start of codesection========================
function U_OC_V = OCV(SOC, LIBparam)
c       = LIBparam.Coeff;
U_OC_V  = c(1).*log(SOC) + exp(c(2)*SOC) + c(3).*SOC.^3 + c(4);
end
%% ========================End of File=============================
