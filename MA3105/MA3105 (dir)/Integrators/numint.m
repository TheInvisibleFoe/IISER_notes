function I=numint(a,b,tol) 
  n = 1;
  alpha = log(1+b)-log(1+a);
  fprintf("N \t NumInt Value \t Abs err \t Rel err.\n")
  previ=0;
  % Err Simp
  % -h^4(b-a)/180 f(4)(c)
  % asymp
  % -h^4/180 (f(3)(b)-f(3)(a))

  while true
    i = integrator(a,b,2^n);
    relerr = abs(previ - i);
    abserr = abs(i-alpha);
    fprintf("%d \t %f \t %f \t %f\n",n,i,abserr,relerr)
    if abserr<tol
      break
    end
    previ = i;
    n = n+1;
  end
  h = (b-a)/2^n
  corr = - h^4/30 *(1/(1+b)^4 -1/(1+a)^4);
  i = i+corr;
  I = i;
end
