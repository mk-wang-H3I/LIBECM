%% Termination event of ECM simulation
%   The simulation will be terminated once the consumed capacity is not
%   less than 99% of the maximum capacity
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-27
% 
%% Syntax
% 
% [xdot, y] = LIBECM.sim.endEvent(t, x, LIBparam);
% 
% Inputs:   t           - Time
%           x           - States, including Q_B_Ah and U_P_V
%           LIBparam	- Parameter structure of LIB
% 
% Outputs:  value       - Value of the event
%           isterminal 	- Flag of termination
%           direction   - Both direction
% 
%% Change log
%
% 2025-09-27 - WANG Mingkai - Baseline version                      - V1.0*
%
%% ====================Start of codesection========================
function [value,isterminal,direction] = endEvent(t, x, LIBparam)
value       = (x(1))<0.99*LIBparam.Q_max_Ah;
isterminal  = 1;
direction   = 0;
end
%% ========================End of File=============================
