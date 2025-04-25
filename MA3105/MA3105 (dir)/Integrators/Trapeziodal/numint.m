function I=numint(a,b,tol) 
  n = 1;
  alpha = 0.693147;
   % Err Simp
  % -h^2(b-a)/12 f(2)(c)
  % asymp
  % -h^2/12 (f(1)(b)-f(1)(a))
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
