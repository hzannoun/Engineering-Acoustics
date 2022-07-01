for t = 0:0.2:2
x = 0:.01:1 ;
syms n ;
y = symsum((-32./(15.*(n.*pi).^3)).*(cos(n.*pi)-1).*cos(n.*pi.*t).*sin(n.*pi.*x),n,1,10) ;
plot(x,y) ;
hold on
end
legend('t=0','t=0.2','t=0.4','t=.6','t=.8','t=1','t=1.2','t=1.4','t=1.6','t=1.8','t=2')