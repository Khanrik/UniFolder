s = tf('s');
G = (50*1000) / ((s+50) * (s + 1000));
Kp = 42;
Gc = G*Kp;

step(feedback(Gc,1));