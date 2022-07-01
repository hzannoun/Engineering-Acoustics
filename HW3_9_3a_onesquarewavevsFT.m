x = [1 2 3 4 5]
y = [1.273239545 0 .4244131816 0 .2546479089]
bar(x,y)

hold on
w = 0:.001:10 ;
fun =  @(t)exp(-i.*t.*w) ;
g = (1./pi).*integral(fun,0,pi,'ArrayValued',true) ;
h = (-1./pi).*integral(fun,pi,2.*pi,'ArrayValued',true)
f = abs(g+h) ;
plot(w, f)

legend('FT','ideal periodic')