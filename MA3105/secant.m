function root=secant(a,b,noiter,tol)
  clc;
  x = [];
  y = [];
  err =[];
  xval = linspace(1,1.5,1000);
  yval = f(xval);
  abserr =[];
  alpha = 1.134724138;
  err(1) = 0;
  err(2) = abs(a-b);
  x(1) = a;
  x(2) = b;
  y(1) = f(a);
  y(2) = f(b);
  hold on;
  grid on;
  func = plot(xval, yval,'b');
  rootpoint = scatter(alpha, f(alpha),"+");
  fprintf("\t %i \t %f \t %f \t %f \t %f\n",1, x(1), y(1),err(1),(abs(a-alpha)))
  fprintf("\t %i \t %f \t %f \t %f \t %f\n",2, x(2), y(2),err(2),(abs(b-alpha)))
  for i=3:noiter
    x(i) = x(i-1) - (y(i-1))*((x(i-1)-x(i-2))/(y(i-1)-y(i-2)));
    y(i) = f(x(i));
    err(i) = abs(x(i)-x(i-1));
    abserr(i) = abs(x(i) -alpha);
    secpoint = scatter(x(i), y(i),'filled');
    secline = plot(xval, y(i-1) + (xval-x(i-1))*((y(i-1)-y(i-2))/(x(i-1)-x(i-2))));
    legend("Function","Actual Root" ,"Root estimate", "Secant",Interpreter="latex")
    pause(1);
    if abs(x(i) - x(i-1))<tol
      root = x(i);
      break;
    end
    fprintf("\t %i \t %f \t %f \t %f \t %f\n",i, x(i), y(i),err(i),abserr(i))
    delete(secpoint);
    delete(secline);
  end
  hold off;
end

