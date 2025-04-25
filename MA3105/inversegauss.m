function L=inversegauss(A)

  [n,m] = size(A);
  if n ~= m
    fprintf("The matrix is not square.")
  end
  L = zeros(n);
  I = eye(n);
  for i=1:n
    L(:,i) = gausspivot(A,I(:,i));
  end
end
