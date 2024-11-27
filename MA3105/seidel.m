function x=seidel(A,b,X,tol)
  x=[0 0 0]';
  n = length(b);
  % invD=eye(n);
  fprintf("%s \t %s \t %s \t %s \t\t %s \n","n","x1","x2","x3","err")
  c =1;
  % matrix form
  % L x(k+1) = [b - U x(k)]
  % We use the element wise form here
  % x(k+1)_(i) = 1/a_ii[b_i - sum_j=1^i-1 a_ij x(k+1)_j - sum_j=i+1^n a_ij x(k)_j]
  while true
      for i=1:n
      t = [0 0 0]';
      % Single For loop can be used with matrix multiplication
        for j=1:n
          if j~=i
            t(i) = t(i)+A(i,j) *x(j);
          end
        end
       x(i) = (b(i)-t(i))/A(i,i);

      end
      % can have different err bound norm(Ax(n) - b) is wothin tolerance
      err = max(abs(X-x));
      fprintf("%d \t %.3f \t %.3f \t %.3f \t %.3f \n",c,x(1),x(2),x(3),err)
      if err<tol
        break
      end
      c = c+1;
  end
end
