import numpy as np
def LinearLeastSquaresFit(x,y):
    """Take in arrays representing (x,y) values for set of linearly varying data and perform 
    a linear least squares regression. Return the resulting slope and intercept parameters of 
    the best fit line with their uncertainties."""
    x_ave = np.sum(x)/len(x)
    y_ave = np.sum(y)/len(y)
    xsqr_ave = np.sum((x*x))/len((x*x))
    xy_ave = np.sum((x*y))/len((x*y))
    
    m = (xy_ave - (x_ave*y_ave))/(xsqr_ave - (x_ave**2))
    b = ((xsqr_ave*y_ave)-(x_ave*xy_ave))/(xsqr_ave - (x_ave**2))
    
    uncer = np.zeros(len(x))
    for i in range(len(x)):
        uncer[i]=y[i]-((m*x[i])+b)
        
    uncer_sqr_ave = np.sum((uncer*uncer))/len((uncer*uncer))
    
    m_err = np.sqrt((1/(len(x)-2.))*(uncer_sqr_ave/(xsqr_ave -(x_ave**2))))
    b_err = np.sqrt((1/(len(x)-2.))*((uncer_sqr_ave*xsqr_ave)/(xsqr_ave -(x_ave**2))))
    
    return (m,b,m_err,b_err)
