% % Opgave 7.1
% s = tf("s");
% Gp = 1 / (s * (s + 50) * (s + 120));
% % bode(Gp)
% 
% Kp = 10^(105/20);
% % bode(Kp*Gp);
% 
% Gcl = feedback(Kp * Gp, 1);
% step(Gcl);

% Opgave 7.2
s = tf("s");
G = 100 / ((s + 0.1) * (s + 0.5) * (s + 1.0));
% bode(G);


Kp = 10^(-44.2/20);
Gp = Kp * G;
% bode(Kp * G);

Td = 1/0.5;
Gpd = Gp * (1 + s*Td);
% bode(Gpd);

Kp = 10^(-48.34/20);
Gp = G * Kp;
Gpd = Gp * (1 + s*Td);
% bode(Gpd);

Tf = 1/10;
Gpdf = Gp * (1 + s*Td / (1 + s*Tf));
% bode(Gpdf);

Ti = 1/0.1;
Gpidf = G * Kp * (s*Td + 1 + 1/(s*Ti));
% bode(Gpidf);

Gcl = feedback(Gpidf, 1);
step(Gcl);