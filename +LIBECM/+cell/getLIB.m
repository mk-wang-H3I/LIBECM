%% Get parameter structure of the specified LIB type name
%   Available: NCR20700B, NCR18650B, NCR18500A
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-25
% 
%% Syntax
% 
% [LIBparam] = LIBECM.cell.getLIB(LIBType);
% 
% Inputs:   LIBType   	- Name of the LIB type
% 
% Outputs:  LIBparam	- Parameter structure of LIB
% 
%% Change log
%
% 2025-09-25 - WANG Mingkai - Baseline version                      - V1.0*
%
%% ====================Start of codesection========================
function LIBparam = getLIB(LIBType)
switch LIBType
    case 'NCR18650B'
        LIBparam.Coeff     	= [0.1387; 0.4961; 0.0014; 2.3786];          	% Coefficients of fitting OCV
        LIBparam.R_B_ohm   	= 0.0299;                                      	% Internal resistance
        LIBparam.Q_max_Ah	= 3.35;                                       	% Typical capacity of cell
        LIBparam.m_B_kg    	= 48.5e-3;                                    	% Mass of cell
        LIBparam.R_P_ohm   	= 1.27e-4;                                      % Polarization resistance
        LIBparam.C_P_F     	= 198.61;                                       % Polarization capacitor
    case 'NCR20700B'
        LIBparam.Coeff    	= [0.2607, 0.0104, 0.3671, 2.7322];
        LIBparam.R_B_ohm  	= 0.0206;
        LIBparam.Q_max_Ah	= 4.25;
        LIBparam.m_B_kg    	= 63.0e-3;
    case 'NCR18500A'
        LIBparam.Coeff     	= [0.2098, 0.0252, 0.4023, 2.7622];
        LIBparam.R_B_ohm   	= 0.0744;
        LIBparam.Q_max_Ah	= 2.04;
        LIBparam.m_B_kg   	= 33.5e-3;
    otherwise
        error('Wrong battery type');
end
end
%% ========================End of File=============================
