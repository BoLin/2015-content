%Electromagnetic Railgun Data
C=12;%F capacitor bank capacity
V0=7*1000;%V Initial Voltage of Capacitor 
L0=1e-6;%1uH
R0=0.5e-3;
w=0.061;%rails width
h=0.135;%rails height
l=12;%rails lenth
s=0.5;%rails seperation
m=50;%kg Armature weight
x0=0;%initla position
v0=70;%m/s initial velocity
DR=4.18e-6;%resistance gradient
DL=0.94e-6;%inductance gradient

plot(x(:,1),x(:,2))
title('Projectile Position','FontSize',15,'FontName','Times New Roman');
xlabel('Time(second)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');
ylabel('Position(m)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');

plot(v(:,1),v(:,2))
title('Projectile Velocity','FontSize',15,'FontName','Times New Roman');
xlabel('Time(second)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');
ylabel('Velocity(m/s)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');

plot(i(:,1),i(:,2))
title('Circuit Current','FontSize',15,'FontName','Times New Roman');
xlabel('Time(second)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');
ylabel('Current(A)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');

plot(Vc(:,1),Vc(:,2))
title('Capacitor Bank Voltage','FontSize',15,'FontName','Times New Roman');
xlabel('Time(second)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');
ylabel('Voltage(V)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');

plot(Vc(:,1),Vc(:,2))
title('Capacitor Bank Voltage','FontSize',15,'FontName','Times New Roman');
xlabel('Time(second)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');
ylabel('Voltage(V)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');

theta=linspace(0,60)
rad=theta*pi/180
y=2*cos(rad).*sin(rad).*(1.8443e3)^2/9.8
plot(theta,y)
title('Projectile Range','FontSize',15,'FontName','Times New Roman');
xlabel('Theta(degree)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');
ylabel('Distance(m)','FontWeight','bold','FontSize',12,'FontName','Times New Roman');