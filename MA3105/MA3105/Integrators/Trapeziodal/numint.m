function I=numint(a,b,tol) 
  n = 1;
  alpha = 0.693147;
  fprintf("N \t NumInt Value \t Abs err \n")
  while true
    i = integrator(a,b,n);
    abserr = abs(i-alpha);
    fprintf("%d \t %f \t %f \n",n,i,abserr)
    if abserr<tol
      break
    end
    n = n+1;
  end
end
