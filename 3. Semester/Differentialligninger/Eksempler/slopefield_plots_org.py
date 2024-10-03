import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

#Define ODE
def df(x,y):
    return y - 0.1*y**2

#Show scipy numerical solution True/False
show_solution = True

#Define boundaries of x and y in the slope field plot
minx = -5.
maxx = 15.
miny = -5.
maxy = 15.

#Define step n along each axis (resolution of slope field)
xsteps = 30
ysteps = 30

#Create linspace from parameters 
xs = np.linspace(minx, maxx, xsteps)
ys = np.linspace(miny, maxy, ysteps)

#Create a meshgrid from the linspaces
x, y = np.meshgrid(xs, ys)

#Define the initial value(s) - Even if only one: Make a 1D array
x0 = 0
y0 = np.array([1.1, 0.1, 5])

#Create and normalize direction vectors
u = np.ones(x.shape)
v = df(x,y)
norm = np.sqrt(u**2 + v**2)
u /= norm
v /= norm

fig, ax = plt.subplots(1,1,figsize=(10,10))
ax.quiver(x, y, u, v, angles='xy', headwidth=2)
if show_solution:
    for i in range(len(y0)):
        #Solution
        xsol = np.linspace(x0, maxx, xsteps*100)
        sol = solve_ivp(df, [x0, maxx], y0, t_eval=xsol)
        print("NOTE! Solver Status Message:", sol.message)
        ax.plot(sol.t, sol.y[i], label=f'$y_0$ = {y0[i]}')
        ax.legend(loc='upper left', fontsize=15)
ax.set_title("Slope Field")
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_xlim(minx, maxx)
ax.set_ylim(miny, maxy)
ax.grid()
# plt.savefig("slope_field")
plt.show()