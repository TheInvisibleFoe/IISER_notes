function [R,M]=RREF(A) 
  % Forward Substitution
  [n,~] = size(A);
  B = eye(n);
  X = [A B];
  X
  for i=1:n
    % returns the max value and Index of the vector
    [mx,I] = max(A(i:end,i));
    % swapping the rows to make the maximum value the pivot
    X([i I+i-1],:) = X([I+i-1 i],:);
    for j=i+1:n
      % multiplication matrix
      % Lower diagonal matrix of M
      t = X(j,i)/X(i,i);
      X(j,:) = X(j,:) - X(i,:).*t;
    end
  end
 X
  % Gaussian Elimination Just from below
  % Switching i,j in the multiplicative factors
  for i=n:-1:1
   for j=n:-1:i+1
      % multiplication matrix
      % Lower diagonal matrix of M
      t = X(i,j)/X(j,j);
      X(i,:) = X(i,:) - X(j,:).*t;
    end
  end
  % Normalizing th diagonal
  for i=1:n
    t = X(i,i);
    X(i,:) = X(i,:)/t;
  end
  R = X(1:n,1:n)
  M = X(:,n+1:end)
end