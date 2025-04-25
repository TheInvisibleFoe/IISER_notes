function root = bisec(a,b,noiter,tol)
  clc;
  % BISECTION METHOD
  % requires two points and is guaranteed to converge,
  % The convergence is slow
  C= [];
  FC = [];
  x = linspace(a,b,1000);
  fprintf("%s\t%s\t %s\t %s\t %s\t %s \n", 'iter', 'a', 'b', 'c', 'f(c)', 'rel. err')
  hold on;
  grid on;
  Y = f(x);
  plot(x,Y);
  xlabel("$x$","Interpreter","latex");
  ylabel("$f(x) = x^6-x-1$","Interpreter","latex");
  % max no iterations
  % bound for iterations
  % n> ln((b-a)/tol)/ln 2
  for i=1:noiter
    c = (a+b)/2;
    fa = f(a);
    fb = f(b);
    fc = f(c);

    if sign(fa)*sign(fb)>0
      disp('wrong choice')
    end
  % e_n+1 = 1/2 e_n

    if (b-a)<tol
      root = c;
      break
    end

    if sign(fa)*sign(fc) < 0
      b = c;
      err = abs(c-a);

    elseif sign(fa)*(fb)< 0
      a =c;
      err = abs(b-c);
    else 
      root =c;
      err = 0;
    end

    C = [C c];
    FC = [FC fc];
    scatter(c,fc,'filled');

    fprintf("%d\t%.3f\t %.3f\t %.3f\t %.3f\t %.3f \n", i, a, b, c, fc, err)
    pause(0.5)
  end

  hold off;



end
