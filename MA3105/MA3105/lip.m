function pol=lip(xval,x)
  x0 = x(1,1);
  y0 = x(1,2);
  x1 = x(2,1);
  y1 = x(2,2);
  l = length(xval);
  pol=[];
  for i=1:l
    pol(i) = ((x1 - xval(i))*y0 + (xval(i)- x0)*y1)/(x1 - x0);
  end
end
