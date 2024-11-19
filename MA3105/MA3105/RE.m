function i=RE(a,b,n)
  n= 2^n;
  y = integrator(a, b, n);
  yy = integrator(a,b,2*n);
  p=4;
  i = 1/(2^p-1)*(2^p*yy-y);
end
