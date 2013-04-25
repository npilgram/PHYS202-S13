import numpy as np

def pointPotential(x,y,q,posx,posy):
    """Returns the electric potential at point (x,y) created by the charge of q at (posx,posy). Expects units of meters for x, y, posx, and posy, and units of Coulombs for q."""
    k = 8.9875517873681764*10.**9. #Nm^2/C^2
    Vxy = (k*q)/(np.sqrt(((x-posx)**2)+((y-posy)**2)))
    return Vxy

def dipolePotential(x,y,q,d):
    """Returns the electrical potential at point (x,y) created by the dipole with chage magnitudes of q and charge separation of d. Expects units of meters for x, y, and d and units of Coulombs for q"""
    Vxy = pointPotential(x,y,q,-d/2.,0.)-pointPotential(x,y,q,d/2.,0.)
    return Vxy
    
