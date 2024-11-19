function TF=isapprox(A,B,tol)
  if nargin<3
    tol = 1e-7;
  end
  if size(A)~=size(B)
    fprintf("Matrices cannot be compared");
  end
  C = abs(A-B);
  [n,m] = size(A);
  TF = zeros(size(A));
  for i=1:n
    for j=1:m
      TF(i,j) = C(i,j)<tol;
    end
  end
end