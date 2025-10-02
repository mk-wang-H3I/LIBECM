%%  Example: equivalent circuit model of LIB parallel pack
%   NOTE: The pack model proposed in this repo is aimed at reflecting the
%   cell current distribution within one LIB pack subject to parallel
%   connection. One can of course extend this model to the general case of
%   LIB pack with cells both connected in series and parallel. It is
%   assumed that all the modules share the same terminal voltage.
%   Pack configuration: 1S4P, 1 cell in series and 4 cells in parallel
%
%   Repo:       LIBECM
%   Author:     WANG Mingkai
%   Date:       2025-09-28
%
%% Change log
%
% 2025-09-28 - WANG Mingkai - Baseline version                      - V1.0*
%
%% ====================Start of codesection========================
%% Case 1: cells with uniform parameters
% This is a benchmark case without cell unevenness
% Prepare cell and pack inputs
LIBparam            = LIBECM.cell.getLIB('NCR18650B');
PACKparam.Np        = 4;
PACKparam.R_Ohm_vec	= [0.03; 0.03; 0.03; 0.03];
PACKparam.R_Ohm_inv	= LIBECM.pack.getRinv(PACKparam.Np, PACKparam.R_Ohm_vec);

% ode45 simulation
SimSet.x0       = zeros(2,1);                                            	% Initial states: Q_B_Ah, U_P_V
SimSet.tspan_s  = 0:2:3600;                                              	% Time span
SimSet.odeFunc  = @(t, x)LIBECM.sim.packWrapper(t,x,LIBparam,PACKparam);	% Function handle for ECM simulation
SimSet.Opt      = odeset('Events',@(t,x)LIBECM.sim.endEvent(t,x,LIBparam));	% Declare the terminal event
[SimRes.t_s,SimRes.x,SimRes.te,SimRes.xe,SimRes.ie] =...
    ode45(SimSet.odeFunc,SimSet.tspan_s,SimSet.x0,SimSet.Opt);

SimSet.nt  	= numel(SimRes.t_s);
[~,SimRes.y] = LIBECM.sim.packWrapper(SimRes.t_s.',SimRes.x.',LIBparam,PACKparam);

% Plot current values in a figure
figure('DefaultAxesFontName','Times New Roman');
set(gcf,...
    'units','normalized',...
    'Position',[0.3276    0.3194    0.2469    0.2463],...
    'color',[1,1,1]);
hold on;
plot(SimRes.t_s./60,SimRes.y(2,:),'-','linewidth',2.0);
plot(SimRes.t_s./60,SimRes.y(3:end,:),'-.','linewidth',1.5);
xlabel('$t\mathrm{[min]}$','interpreter','latex');
ylabel('$U_B\mathrm{[V]}$','interpreter','latex');
grid on;
grid minor;
set(gca,'LineWidth',1.0,...
    'fontweight','bold',...
    'fontsize',12,...
    'LooseInset',get(gca,'TightInset'),...
    'TickDir'     , 'out'     , ...
    'TickLength'  , [.01 .01] , ...
    'XMinorTick'  , 'off'      , ...
    'YMinorTick'  , 'off'      , ...
    'XColor'      , [.0 .0 .0], ...
    'YColor'      , [.0 .0 .0]);
legend('Mean','Cell 1','Cell 2','Cell 3','Cell 4',...
    'location','best',...
    'NumColumns',1);

%% Case 2: cells with uneven parameters
% Prepare cell and pack inputs
LIBparam            = LIBECM.cell.getLIB('NCR18650B');
PACKparam.Np        = 4;
PACKparam.R_Ohm_vec	= [0.03; 0.032; 0.028; 0.029];
PACKparam.R_Ohm_inv	= LIBECM.pack.getRinv(PACKparam.Np, PACKparam.R_Ohm_vec);

% ode45 simulation
SimSet.x0       = zeros(2,1);                                            	% Initial states: Q_B_Ah, U_P_V
SimSet.tspan_s  = 0:2:3600;                                              	% Time span
SimSet.odeFunc  = @(t, x)LIBECM.sim.packWrapper(t,x,LIBparam,PACKparam);	% Function handle for ECM simulation
SimSet.Opt      = odeset('Events',@(t,x)LIBECM.sim.endEvent(t,x,LIBparam));	% Declare the terminal event
[SimRes.t_s,SimRes.x,SimRes.te,SimRes.xe,SimRes.ie] =...
    ode45(SimSet.odeFunc,SimSet.tspan_s,SimSet.x0,SimSet.Opt);

SimSet.nt  	= numel(SimRes.t_s);
[~,SimRes.y] = LIBECM.sim.packWrapper(SimRes.t_s.',SimRes.x.',LIBparam,PACKparam);

% Plot current values in a figure
figure('DefaultAxesFontName','Times New Roman');
set(gcf,...
    'units','normalized',...
    'Position',[0.3276    0.3194    0.2469    0.2463],...
    'color',[1,1,1]);
hold on;
plot(SimRes.t_s./60,SimRes.y(2,:),'-','linewidth',2.0);
plot(SimRes.t_s./60,SimRes.y(3:end,:),'-.','linewidth',1.5);
xlabel('$t\mathrm{[min]}$','interpreter','latex');
ylabel('$U_B\mathrm{[V]}$','interpreter','latex');
grid on;
grid minor;
set(gca,'LineWidth',1.0,...
    'fontweight','bold',...
    'fontsize',12,...
    'LooseInset',get(gca,'TightInset'),...
    'TickDir'     , 'out'     , ...
    'TickLength'  , [.01 .01] , ...
    'XMinorTick'  , 'off'      , ...
    'YMinorTick'  , 'off'      , ...
    'XColor'      , [.0 .0 .0], ...
    'YColor'      , [.0 .0 .0]);
legend('Mean','Cell 1','Cell 2','Cell 3','Cell 4',...
    'location','best',...
    'NumColumns',1);
%% ========================End of File=============================
