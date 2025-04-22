% OPG 11.1
% s = tf('s');
% G = 300/(s+2)/(s+5)/(s+20);
% Kp = 5.56;
% Glead = (2.194*s+8)/(s+17.55);
% Glag = (s+0.8)/s;
% Gc = Glag*Kp*Glead;
% % margin(Gc*G);
% Gcl = feedback(G*Gc,1);
% % step(Gcl);
% 
% 
% sampling_thing = 20;
% wc = 8;
% Ts = 2*pi/(sampling_thing*wc);
% Gsh = exp(-s*Ts/2);
% 
% % bode(Gc*G)
% % hold on
% % margin(Gsh*Gc*G)
% % legend("Original system", "Sampling med " + sampling_thing + " \cdot \omega_{c}")
% % hold off
% 
% [num,den] = pade(Ts/2,3);
% Gsh = tf(num,den);
% Gcl_sh = feedback(Gsh*Gc*G,1);
% step(Gcl,'b')
% hold on
% step(Gcl_sh,'g')
% legend("Original system", "Sampling med " + sampling_thing + " \cdot \omega_{c}")
% hold off

% OPG 11.2

s = tf('s');
G = 300/(s+2)/(s+5)/(s+20);
sampling_thing = 20;
wc = 8;
Ts = 2*pi/(sampling_thing*wc);
margin(G)

Kp = 10^(14.9/20);
Gc = Kp;
margin(Gc*G)