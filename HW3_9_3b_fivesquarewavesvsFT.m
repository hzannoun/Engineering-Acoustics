x = [1 2 3 4 5]
y = [1.273239545 0 .4244131816 0 .2546479089]
bar(x,y)

hold on
w = 0:.001:10 ;
fun =  @(t)exp(-i.*t.*w) ;
g1 = (1./(5.*pi)).*integral(fun,0,pi,'ArrayValued',true) ;
g2 = ((-1)./(5.*pi)).*integral(fun,pi,2.*pi,'ArrayValued',true)
g3 = (1./(5.*pi)).*integral(fun,2.*pi,3.*pi,'ArrayValued',true) ;
g4 = ((-1)./(5.*pi)).*integral(fun,3.*pi,4.*pi,'ArrayValued',true)
g5 = (1./(5.*pi)).*integral(fun,4.*pi,5.*pi,'ArrayValued',true) ;
g6 = ((-1)./(5.*pi)).*integral(fun,5.*pi,6.*pi,'ArrayValued',true)
g7 = (1./(5.*pi)).*integral(fun,6.*pi,7.*pi,'ArrayValued',true) ;
g8 = ((-1)./(5.*pi)).*integral(fun,7.*pi,8.*pi,'ArrayValued',true)
g9 = (1./(5.*pi)).*integral(fun,8.*pi,9.*pi,'ArrayValued',true) ;
g10 = ((-1)./(5.*pi)).*integral(fun,9.*pi,10.*pi,'ArrayValued',true)
f = abs(g1+g2+g3+g4+g5+g6+g7+g8+g9+g10) ;
plot(w, f)

legend('ideal periodic','FT')