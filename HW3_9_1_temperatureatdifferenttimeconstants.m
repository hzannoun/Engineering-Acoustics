hold on
for t = 0:.2:2
    x = 0:.001:1 ;
syms n ;
y = symsum((-200./(n.*pi)).*(cos(n.*pi)-1).*sin(n.*pi.*x).*exp(-t),n,1,50) ;
plot(x,y) ;
end
legend('t=0','t=.2','t=.4','t=.8','t=1','t=1.2','t=1.4','t=1.6','t=1.8','t=2')
