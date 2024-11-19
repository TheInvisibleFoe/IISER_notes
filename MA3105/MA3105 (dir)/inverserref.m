function L=inverserref(A)

  [n,m] = size(A);
  if n ~= m
    fprintf("The matrix is not square.\n")
    return;
  end
  
  [R, AI] = RREF(A);
  L=AI;
end
