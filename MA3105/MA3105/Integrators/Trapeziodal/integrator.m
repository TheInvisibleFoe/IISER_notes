function i=integrator(a,b,n)
  x = linspace(a,b,n+1);
  h = (b-a)/n;
  y = f(x);
  i = sum(y)-(1/2)*(y(1) + y(end));
  i = i*h;
end
