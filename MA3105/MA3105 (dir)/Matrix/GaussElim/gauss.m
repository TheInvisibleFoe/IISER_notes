function y=gauss(A,b)
%  A = [ 1 2 -1 1; -1 1 2 -1; 2 -1 2 2; 1 1 -1 2]
% b = [6 3 14 8]';
% y =[1 2 3 4]
  X = [A b];
  % Forward Substitution
  n = length(b);
  L = eye(n);
  for i=1:n
    for j=i+1:n
      t = X(j,i)/X(i,i);
      L(j,i) = t;
      X(j,:) = X(j,:) - X(i,:).*t;
    end
  end
  x = X(:,end);
  disp(L)
  % Back Substitution
  for i=n:-1:1
    m = 0;
    for j=n:-1:i+1
      m  = m + X(i,j)*y(j);
    end
    y(i) = (x(i)-m)/X(i,i);
  end
end