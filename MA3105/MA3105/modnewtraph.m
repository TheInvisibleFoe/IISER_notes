function root=newtraph(a, noiter, tol)
  clc;
  x= [];
  y= [];
  yd =[];
  err = [];
  alpha = 1.1;
  abserr = 0;
  err = 0;
  x(1) = a;
  y(1) = f(a);
  yd(1) = fd(a);
  ydd(1) = fdd(a);
  xval = linspace(0,3,1000);
  ratio=0;
  yval = f(xval);
  fprintf("\t %s \t %s \t \t %s \t \t %s \t %s\n", 'iter', 'x',  'f(x)','abs. err', 'Ratio')
  abserr =abs(x(1)-alpha);
  fprintf("\t %i \t %f \t %f \t %f \t %f\n",1, x(1), y(1),abserr,ratio)
  hold on;
  grid on;
  func = plot(xval, yval,'b',"DisplayName", "$f(x)$");
  rootpoint = scatter(alpha, f(alpha),"+", "DisplayName", "$\alpha$");
  yax = yline(0,'b', "DisplayName","$y=0$");
  for i=2:noiter
    guess = scatter(x(i-1), y(i-1), "filled","DisplayName",sprintf("$x_{%d}$",i-1));
    x(i) = x(i-1)-((y(i-1)*yd(i-1))/(yd(i-1)^2 -y(i-1)*ydd(i-1)));
    y(i) = f(x(i));
    yd(i) = fd(x(i));
    ydd(i) = fdd(x(i));
    ratio = (alpha-x(i))/(alpha-x(i-1));
    err = abs(x(i) - x(i-1));
    abserr =abs(x(i)-alpha);
    fprintf("\t %i \t %f \t %f \t %f \t %f\n",i, x(i), y(i),abserr,ratio)
    tangent =plot(xval,yd(i-1)*(xval-x(i-1))+y(i-1),"DisplayName", "Tangent");
    legend("Interpreter","latex","Location","northwest")
    if err<tol
      root = x(i);
      break
    end
    pause(1);
    delete (guess);
    delete (tangent);
  end
delete (guess);
delete (tangent);
guess = scatter(x(i), y(i), "filled","DisplayName",sprintf("$x_{%d}$",i));
tangent =plot([x(i),x(i-1)],[0 y(i-1)],"DisplayName", "Tangent");
end

