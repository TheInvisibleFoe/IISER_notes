function dd=divdiff(x, y, o)
  npt = length(y);
  dd = [];
  for i=1:npt-1
    dd(i) = (y(i+1) - y(i))/(x(i+o)-x(i));
  end
end

