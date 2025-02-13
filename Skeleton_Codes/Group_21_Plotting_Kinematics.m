%% The following code plots all kinematic equations against theta2

clear; clc; close all;

%%initial parameter: unit: m, degree, rad/sec
r1 = 0.084; 
r2 = 0.36;
r3 = 1.2;
r6 = 0.6;

theta2 = 0:0.00001:4*pi; % from 0 to 360 with step 1: [0,1,2,3,4....360]
dtheta2 = 2;
ddtheta2 = 0; 

%% Part 1- Calculations for kinematic variables, caculated based on loop closure eqn

%equations for kinematic values
theta3 = pi - asin((r2.*sin(theta2)-r1)./r3); % eqn 4
r4 = r2.*cos(theta2) - r3.*cos(theta3); % eqn 5
theta5 = theta3; % eqn 15
theta6 = pi - asin((r1.*cos(theta5)-r4.*sin(theta5))./r6) + theta5; %eqn 18
r5 = (r6.*cos(theta6)-r4)./cos(theta5);

%% Take time derivative of loop eqn (d/dt) 
% and solve them for dtheta3, dtheta5 & dr6
% and the same for the second derivatives. 
% add r5dot, theta6dot, r5 double dot, theta6 double dot

% First derivates of r4 and theta 3
dtheta3 = (r2.*dtheta2.*cos(theta2))./(r3.*cos(theta3));
dr4 = (r2.*dtheta2.*sin(theta3 - theta2))./cos(theta3);

% Second derivates of r4 and theta 3
ddtheta3 = ((r3.*(dtheta3.^2).*sin(theta3))-(r2.*(dtheta2.^2).*sin(theta2)))./(r3.*cos(theta3));
ddr4 = (r3.*ddtheta3.*sin(theta3)) + (r3.*(dtheta3.^2).*cos(theta3)) - (r2.*(dtheta2.^2).*cos(theta2));

% First derivatives of r5 and theta 6
dtheta5 = dtheta3;
dtheta6 = ((r5.*dtheta5)-dr4.*sin(theta5))./(r6.*cos(theta5-theta6));
dr5 = ((r6.*dtheta6.*cos(theta6))-(r5.*dtheta5.*cos(theta5)))./(sin(theta5));

% Second derivatives of r5 and theta 6
ddtheta5 = ddtheta3;
ddtheta6 = ((-ddr4.*sin(theta5))+(2.*dr5.*dtheta5)+(r5.*ddtheta5)-(r6.*(dtheta6.^2).*sin(theta5-theta6)))./(r6.*cos(theta5-theta6));
ddr5 = (((-2.*dr5.*dtheta5-r5.*ddtheta5).*cos(theta5))+(r5.*(dtheta5.^2).*sin(theta5))+(r6.*ddtheta6.*cos(theta6))-(r6.*(dtheta6.^2).*sin(theta6)))./(sin(theta5));

% Calculating Coriolis acceleration
a_coriolis = abs((2.*(r6.*dtheta6.*cos(theta6)-r5.*(dtheta5).*cos(theta5)).*(r2.*dtheta2.*cos(theta2)))./(r3.*cos(theta3).*sin(theta5)));

%% Plot vars;
% Plot all desired deliverables. 

% Figure 1 for theta6 variables
figure (1);

% Plotting theta6 angular displacement
subplot(3,1,1);
plot(theta2, theta6);
title('$\theta_6$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel("\theta_6 (radians)");
grid on;

% Plotting theta6 angular velocity
subplot(3,1,2);
plot(theta2, dtheta6);
title('$\dot\theta_6$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel("$\dot\theta_6$ (radians/s)", 'Interpreter','latex');
grid on;

% Plotting theta6 angular acceleration
subplot(3,1,3);
plot(theta2, ddtheta6);
title('$\ddot\theta_6$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel('$\ddot{\theta}_6$ (radians/s$^2$)', 'Interpreter', 'latex');
grid on;

% Figure 2 for theta3 variables
figure (2);

% Plotting theta3 angular displacement 
subplot(3,1,1);
plot(theta2, theta3);
title('$\theta_3$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel("\theta_3 (radians)");
grid on;

% Plotting theta6 angular velocity
subplot(3,1,2);
plot(theta2, dtheta3);
title('$\dot\theta_3$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel("$\dot\theta_3$ (radians/s)", 'Interpreter','latex');
grid on;

% Plotting theta6 angular acceleration
subplot(3,1,3);
plot(theta2, ddtheta3);
title('$\ddot\theta_3$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel('$\ddot{\theta}_3$ (radians/s$^2$)', 'Interpreter', 'latex');
grid on;

% Figure 2 for r4 variables
figure (3);

% Plotting r4 linear displacement
subplot(3,1,1);
plot(theta2, r4);
title('$r_4$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel("r_4 (m)");
grid on;

% Plotting r4 linear velocity
subplot(3,1,2);
plot(theta2, dr4);
title('$\dot r_4$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel("$\dot r_4$ (m/s)", 'Interpreter','latex');
grid on;

% Plotting r4 linear acceleration
subplot(3,1,3);
plot(theta2, ddr4);
title('$\ddot r_4$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel('$\ddot{r}_4$ (m/s$^2$)', 'Interpreter','latex');
grid on;

% Figure 4 for r5 variables
figure (4);

% Plotting r5 linear displacement
subplot(3,1,1);
plot(theta2, r5);
title('$r_5$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel("r_5 (m)");
grid on;

% Plotting r5 linear velocity
subplot(3,1,2);
plot(theta2, dr5);
title('$\dot r_5$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel("$\dot r_5$ (m/s)", 'Interpreter','latex');
grid on;

% Plotting r5 linear acceleration
subplot(3,1,3);
plot(theta2, ddr5);
title('$\ddot r_5$ vs $\theta_2$', 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel('$\ddot{r}_5$ (m/s$^2$)', 'Interpreter','latex');
grid on;

% Figure 5 for coriolis acceleration
figure (5);
plot(theta2, a_coriolis);
title("Coriolis Acceleration of $r_5$ vs $\theta_2$", 'Interpreter','latex');
xlabel("\theta_2 (radians)");
ylabel("Coriolis Acceleration (m/s^2)");
grid on;
