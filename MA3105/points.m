function poly=points()
 x = [-1 1;2 4;3 9;5 25;7 49;8 64];
% x = [-1 1;2 4;3 9;5 25;7 49];
 hold on;
 npoints = size(x,1);
 
 for i=1:npoints
   scatter(x(i,1),x(i,2),'filled','marker','d')
 end
 if mod(npoints,2) ==0
   sprintf('QIP will not work since for even number of points')
   for i=1:npoints-1
     xt = [x(i,1) x(i,2);x(i+1,1) x(i+1,2)];
     xval = linspace(x(i,1),x(i+1,1),100);
     plot(xval, lip(xval,xt))
     fx = xval.^2;
   end
else
   for i=1:npoints-1
     xt = [x(i,1) x(i,2);x(i+1,1) x(i+1,2)];
     xval = linspace(x(i,1),x(i+1,1),100);
     plot(xval, lip(xval,xt))
   end
   for i=1:2:npoints-2
     xt1 = [x(i,1) x(i,2);x(i+1,1) x(i+1,2);x(i+2,1) x(i+2,2)];
     xval1 = linspace(x(i,1),x(i+2,1),100);
     plot(xval1, qip(xval1,xt1))
   end
 end
 hold off;
end
