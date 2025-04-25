function i=integrator(a,b,n)
  x = linspace(a,b,n+1);
  h = (b-a)/n;
  y = f(x);
  i = 4*sum(y);
  i = i - 2*sum(y(1:2:end));
  i = i - y(1) - y(end);
  i = i*h/3;
end
