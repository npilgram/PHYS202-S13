function [m,merr,b,berr] = WeightedLSQFit(x,y,w)
% Weighted Linear Least Squares Fit
%   Take in arrays representing (x,y) values for a set of linearly varying data and an array of weights w.
%   Perform a weighted linear least squares regession. Return the resulting slope and intercept parameters of
%   the best fit line with their uncertainties.
%
%   If all the weights are equal to one, then the uncertanties on the parameters are calculated using the 
%   non-weighted least squares equation
w_sum = sum(w);
    wx_sum = sum((w.*x));
    wy_sum = sum((w.*y));
    wxsqr_sum = sum((w.*(x.^2)));
    wxy_sum = sum((w.*(x.*y)));
    
    m = ((w_sum.*wxy_sum)-(wx_sum.*wy_sum))./((w_sum.*wxsqr_sum)-(wx_sum.^2));
    b = ((wxsqr_sum.*wy_sum)-(wx_sum.*wxy_sum))./((w_sum.*wxsqr_sum)-(wx_sum.^2));
    
    if sum(w)/length(w)==1;
        x_ave = sum(x)./length(x);
        xsqr_ave = sum((x.*x))./length((x.*x));
        
        uncer = zeros(len(x));
        for i = 1:len(x)
            uncer(i) = y(i)-((m.*x(i))+b);
        end
        
        uncer_sqr_ave = sum((uncer.*uncer))./len((uncer.*uncer));
    
        merr = sqrt((1./(len(x)-2.)).*(uncer_sqr_ave./(xsqr_ave -(x_ave.^2))));
        berr = sqrt((1./(len(x)-2.)).*((uncer_sqr_ave.*xsqr_ave)./(xsqr_ave -(x_ave.^2))));
   
    
    else
        merr = sqrt(w_sum./((w_sum.*wxsqr_sum)-(wx_sum.^2)));
        berr = sqrt(wxsqr_sum./((w_sum.*wxsqr_sum)-(wx_sum.^2)));
    end
end

