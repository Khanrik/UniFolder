s=tf('s'); %%% s bliver Laplace operator
K=17.4;
G1=1/(s+5); %%% Opretter overføringsfunktion
G2=1/s ; %%% Opretter overføringsfunktion
G3 = K*G1*G2;
Gcl = feedback(G3,1)
step(Gcl)