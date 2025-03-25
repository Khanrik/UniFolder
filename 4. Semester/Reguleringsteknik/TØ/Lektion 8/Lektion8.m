% Opgave 8.1
s = tf("s");
Gp = 1 / (s * (s + 50) * (s + 120));
Kp = 177830;
% step (Gp*Kp);

% margin(Gp*Kp);

Glag = (s + 1/0.775) / (s + 1/8.525);
Gtotal=Gp*Kp*Glag;
% margin(Gtotal);

Gcl = feedback(Gtotal,1);
% step(Gcl);


t=99:.001:100;
A = 7;
reference = step(A/s, t);
base = step(A / s*feedback(Gp*Kp,1), t);
lag = step(A / s*Gcl, t);

figure(1)
plot(t, reference)
hold on
plot(t, base)
plot(t, lag)
hold off
legend('reference', 'Uden lag','Med lag')
xlabel('tid (s)')
ylabel('Amplitude')