%% Animation for the motion of the mechanism 
%% initial parameter: unit: cm, degree, rad/sec

% Remove past data
clear; 
clc;
close all;

%known lengths defined (in cm)
r1 = 8.4;
r2 = 36;
r3 = 120;
r6 = 60;

% two rotations from 0 to 360 degrees (converted to rad)
inp_theta2 = 0:1:720;
for i = 1:length(inp_theta2)

    % Loop 1 angles and displacements 
    theta_2 = i.*pi./180; 
    theta_3 = pi - asin((r2.*sin(theta_2)-r1)./r3);
    r4 = r2.*cos(theta_2) - r3.*cos(theta_3); 

    % Loop 2 angles and displacements 
    theta_5 = theta_3;
    theta_6 = pi - asin((r1.*cos(theta_3)-r4.*sin(theta_3))./r6) + theta_3;
    r5 = (r6.*cos(theta_6)-r4)./cos(theta_3);
   
    % Link vectors for plotting 
    R1 = [0, r1];
    R2 = [r2.*cos(theta_2), r2.*sin(theta_2)];
    R3 = [r4 - r3.*cos(theta_3), r1 + r3.*sin(theta_3)];
    R4 = [r4, 0];
    R5 = [r4 - r5.*cos(theta_5), r1 + r5.*sin(theta_5)];
    R6 = [r6.*cos(theta_6), r6.*sin(theta_6)];

    % Plotting joint A
    plot(0,0, 'go', 'MarkerFaceColor', 'g'); %A

    % Setting up 
    hold on;
    grid on;
    axis equal;
    xlabel("x (cm)");
    ylabel("y (cm)");
    title("Mechanism Animation");
    axis([-40 160 -100 100]);

    % Plotting joints B, C, D
    plot(R2(1), R2(2), 'ro', 'MarkerFaceColor', 'r'); %B
    plot(R6(1), R6(2), 'bo', 'MarkerFaceColor', 'b'); %C
    plot(R4(1), R1(2), 'ro', 'MarkerFaceColor', 'r'); %D

    % Plotting loop 1 links (AB and BD)
    plot([0, R2(1)], [0, R2(2)], 'g-', 'LineWidth', 2); %AB
    plot([R2(1), R4(1)], [R2(2), R1(2)], 'r-', 'LineWidth', 2); %BD

    % Plotting loop 2 link AC
    plot([0, R6(1)], [0, R6(2)], 'b-', 'LineWidth', 2); %AC

    hold off;
    pause(0.001);   
end 
