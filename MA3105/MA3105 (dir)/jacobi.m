function x=jacobi(A,b,tol)
  %A = [9 1 1; 2 10 3; 3 4 11];
  D = diag(diag(A));
  P = A-D;
  X = [1 2 -1]';
  x=[0 0 0]';
  n = length(b);
  invD=eye(n);
  fprintf("%s \t %s \t %s \t %s \t %s \n","n","x1","x2","x3","err")
  for i=n:-1:1
    invD(i,i) = 1/D(i,i) ;
  end
  i =1;
  % matrix form
  % x(k+1) = D^(-1)[b - (L+U)x(k)]
  while true
      x = invD*(b - P*x);
      err = max(abs(X-x));
      fprintf("%d \t %.3f \t %.3f \t %.3f \t %.3f \n",i,x(1),x(2),x(3),err)
      if err<tol || i==30

        break
      end
      i = i+1;
  end
end
