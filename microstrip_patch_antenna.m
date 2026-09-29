clc;
clear;
close all;

% Microstrip Patch Antenna Design
% Frequency = 2.4 GHz
% Substrate = FR4

f = 2.4e9;          % Operating frequency
c = 3e8;            % Speed of light
er = 4.4;           % Dielectric constant
h = 1.6e-3;         % Substrate thickness

% Patch Width
W = (c/(2*f))*sqrt(2/(er+1));

% Effective dielectric constant
er_eff = (er+1)/2 + ...
         ((er-1)/2)*(1+12*h/W)^(-0.5);

% Effective length
Leff = c/(2*f*sqrt(er_eff));

% Length extension
deltaL = 0.412*h*((er_eff+0.3)*(W/h+0.264)) / ...
         ((er_eff-0.258)*(W/h+0.8));

% Actual patch length
L = Leff - 2*deltaL;

% Display results
fprintf('Microstrip Patch Antenna Design\n');
fprintf('Operating Frequency = %.2f GHz\n', f/1e9);
fprintf('Patch Width         = %.2f mm\n', W*1000);
fprintf('Patch Length        = %.2f mm\n', L*1000);
fprintf('Effective Dielectric Constant = %.3f\n', er_eff);

% Patch dimensions
figure;
rectangle('Position',[0 0 W*1000 L*1000]);
axis equal;
grid on;
xlabel('Width (mm)');
ylabel('Length (mm)');
title('2.4 GHz Microstrip Patch Antenna');
