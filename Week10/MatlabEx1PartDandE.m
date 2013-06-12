hold off
% function to fit
fun = @(a,b,c,x) -sqrt(a^2-(x-b).^2)+c;

% Find a starting point for the parameters a, b, and c.
guess = fun(15,0,15,x); % fun(a,b,c,x)
plot(x,guess,'r:')

% fit the data
fittedmodel = fit(x',y',fun,'StartPoint',[15 0 15]);
% plot the result
plot(fittedmodel,'r-');