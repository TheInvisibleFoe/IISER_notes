function [y, L, U,P]=gausspivot(A,b)
%  A = [ 1 2 -1 1; -1 1 2 -1; 2 -1 2 2; 1 1 -1 2]
% b = [6 3 14 8]';
% y =[1 2 3 4]
  X = [A b];
  % Forward Substitution
  n = length(b);
  % Lower Diagonal Matrix
  L = eye(n);
  % Permutation Matrix
  P = eye(n);
  for i=1:n
    % returns the max value and Index of the vector
    [~,I] = max(A(i:end,i));
    % swapping the rows to make the maximum value the pivot
    X([i I+i-1],:) = X([I+i-1 i],:);
    P([i I+i-1],:) = P([I+i-1 i],:);

    for j=i+1:n
      % multiplication matrix
      % Lower diagonal matrix of M
      t = X(j,i)/X(i,i);
      L(j,i) = t;
      X(j,:) = X(j,:) - X(i,:).*t;
    end
  end
  x = X(:,end);
  X
  % Back Substitution
  for i=n:-1:1
    m = 0;
    for j=n:-1:i+1
      m = m + X(i,j)*y(j);
    end
    y(i) = (x(i)-m)/X(i,i);
  end
  U = X(:,1:end-1);
end
