function pol=qip(xval,x)
  x0 = x(1,1);
  y0 = x(1,2);
  x1 = x(2,1);
  y1 = x(2,2);
  x2 = x(3,1);
  y2 = x(3,2);
  l = length(xval);
  pol=[];
  for i=1:l
    pol(i) = (((xval(i)-x1)*(xval(i) - x2))/((x0-x1)*(x0-x2)))*y0 ;
    pol(i) = pol(i) + (((xval(i)-x2)*(xval(i) - x0))/((x1-x2)*(x1-x0)))*y1 ;
    pol(i) =pol(i)+(((xval(i)-x1)*(xval(i) - x0))/((x2-x1)*(x2-x0)))*y2;
  end
end
