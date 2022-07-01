n = 1:80 ;
fun =  @(x)200.*sin(n.*pi.*x) ;
Cn = integral(fun,0,1,'ArrayValued',true) ;
bar(n, Cn)

