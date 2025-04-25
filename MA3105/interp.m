function pt=interp(a)
  x = [-1,1,2,3,5,7];
  y = [1,1,4,9,25,49];
  order = length(x);
  dd = [];
  dd(1) = y(1)
  for i=1:order-1
    y = divdiff(x,y,i);
    i
    y
    dd(i+1) = y(1);
  end
  pp =[];
  pp(1) = 1;
  for i=2:order
    pp(i) = pp(i-1)*(a-x(i-1))
  end
  dd
  length(dd)
  length(pp)
  pt = dd*pp'
  pt1 = sum(dd.*pp)
end
