import numpy as np
import matplotlib.pyplot as plt

#Define ODE
def df(x,y):
    return y - 0.1*y**2

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

#Create and normalize direction vectors
u = np.ones(x.shape)
v = df(x,y)
norm = np.sqrt(u**2 + v**2)
u /= norm
v /= norm

fig, ax = plt.subplots(1,1,figsize=(10,10))
ax.quiver(x, y, u, v, angles='xy', headwidth=2)
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_xlim(minx, maxx)
ax.set_ylim(miny, maxy)
ax.grid()