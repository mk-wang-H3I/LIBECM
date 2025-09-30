%% Generate the pack load current
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-30
% 
%% Change Log
% 
% 2025-09-30 - WANG Mingkai - Baseline version                      - V1.0*
%
%% Syntax
%  [I_BP_A] = LIBECM.pack.loadCurrent(t_s);
%
%   Inputs: t_s  	- Current time
%
%   Output: I_BP_A 	- Pack load current
%
%% =========Start-Of-Codesection===================================
function [I_BP_A] = loadCurrent(t_s)
t_min   = t_s./60;
I_BP_A  = 4*sin(pi*t_min/10) + 12;
end
%% ========================End of File=============================
