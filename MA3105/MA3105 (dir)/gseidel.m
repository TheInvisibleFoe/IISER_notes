function y=gseidel()
  A = [9 1 1; 2 10 3; 3 4 11];
  D = diag(diag(A));
  P = A-D;
  x = [0 0 0];
  :Q

  invD = D/det(D);


end
