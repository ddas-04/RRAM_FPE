close all;clear all;clc;
gap_length = 100e-9;
xpoints = linspace(0, gap_length, 1e4);
xpoints = xpoints.';
rho0 = ones(size(xpoints)) ./ gap_length;
diffFcn = @constantDiffusion;
driftFcn = @quadraticDrift;
time_Final = 10e-9;
[t, rho] = ode15s(@(t,y)rhsFPE(t, y, xpoints, driftFcn, diffFcn, 1e10), [0 time_Final], rho0);
fh = figure(1);
ax = axes();
axis square;
plot(xpoints.', rho(end,:),'b-','linewidth',2.5);
xlabel('X');
ylabel('PDF');