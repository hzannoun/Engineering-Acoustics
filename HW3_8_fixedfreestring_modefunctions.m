clear all
clc
for n = 1:5 ;
x = 0:.01:1 ;
y = sin(((2.*n-1).*pi.*x)./2) ;
plot(x,y) ;
hold on
end
legend('n=1','n=2','n=3','n=4','n=5')