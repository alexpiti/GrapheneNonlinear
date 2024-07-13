clear all; close all; clc;

% Script that calculates and plots the Kerr (third-order) nonlinear 
% surface conductivity of graphene, for several parameter combinations,
% namely those of Fig. 4 in [1]
%
% Alexandros Pitilakis / Thessaloniki-Greece / July 2024
%
% GNU General Public License v3.0 | Copyright (c) 2024 Alexandros Pitilakis
%
% [1] JinLuo Cheng (JLC), N. Vermeulen, J. E. Sipe, "Third-order 
%     nonlinearity of graphene: Effects of phenomenological relaxation and
%     finite temperature", PRB, 2015. 
%     >>> https://doi.org/10.1103/PhysRevB.91.235320

% Constants
h    = 6.62607e-34;    % [Joule*sec] Plank Constant
hbar = h/2/pi;         % [Joule*sec] Reduced Plank Constant
c0   = 299792458;      % [m/sec] Speed of Light in free-space
q    = 1.60217663e-19; % [C] Electron charge
eps0 = 8.85418781e-12; % [F/m] Vaccuum Permittivity
kB   = 1.38064852e-23; % [J/K] Boltzmann Constant
s0    = q^2/4/hbar;    % [S] "universal" opt. cond of graphene ~ 61 uS

% Reproduce the four panels in Fig. 4 of [1]
mu_eV = 0.3; % [eV] scalar
om_eV = linspace( 0.1 , 1 , 91 ); % [eV]
xLims = [0.1 1]; % all plots have horz-axis in this range
omega = om_eV * q / hbar; % [rad/s] vector
s3_Formulas = 'Full_xxxx'; % use full formulas, compute xxxx component
s3_Mode = 'KerrDetune'; dKerrDetune = 1 - 1e-4; % use "KerrDetune" mode, for stability
Temp = [0 300]; % [K] 
cols = [1 0 0;0 0 1]; % red for zero Temp, blue for 300K
for p = 1:4  
    
    % Each panel is at different relaxation lifetimes, 1 or 2 Temp's    
    switch p
        case 1,
            Gi_eV = 0e-3; % [eV] 
            Ge_eV = 0e-3; % [eV] 
            yLims = 1e3*[-2 +2];
        case 2,
            Gi_eV = 33e-3; % [eV]
            Ge_eV = 33e-3; % [eV] 
            yLims = 1e3*[-5.2 +2.4];
        case 3,
            Gi_eV = 65e-3; % [eV]
            Ge_eV = 0.5e-3; % [eV] 
            yLims = 1e3*[-90 +10];
        case 4,
            Gi_eV = 0.5e-3; % [eV]
            Ge_eV = 65e-3; % [eV]             
            yLims = 1e3*[-110 +70];
    end
    titl = sprintf( '\\Gamma_i = %4.1f meV , \\Gamma_e=%4.1f meV' , ...
        [Gi_eV,Ge_eV]*1e3 );
    
    % Calc-and-plot, for each Temp
    subplot(2,2,p)    
    for n = 1 : (2 - (p==1))
        sigma3_xxxx = sigma3_Graphene_2015JLC( ...
            s3_Formulas, s3_Mode, omega, mu_eV, Temp(n), Gi_eV, Ge_eV );        
        ftp = sigma3_xxxx / s0 * 1e19;
        plot( om_eV , real(ftp) , '-' , 'Color' , cols(n,:) ); hold on;
        plot( om_eV , imag(ftp) , '--' , 'Color' , cols(n,:) );
    end
    
    % Now, do all the plot cosmetics to make it look like the paper
    ylim( yLims )
    xlim( xLims )    
    xlabel( '\omega (eV)' )
    ylabel( '\sigma^{(3);xxxx}_{Kerr}/\sigma_0\times10^{19}' )
    if p==1
        legend('Real','Imag')
    elseif p==2
        legend( '0 K, Re' , '0 K, Im' , '300 K, Re' , '300 K, Im' );
        plot( om_eV , 0*om_eV , 'k-' );
    elseif p==4
        plot( om_eV , 0*om_eV , 'k-' );
    end
    title( titl )    
    set(gca,'xMinorTick','on','YMinorTick','on')    
    
end
set(gcf,'Position',[158   291   781   586])







