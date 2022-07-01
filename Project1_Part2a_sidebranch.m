clc
clear all

A = 1 ;
d1 = 4 ; %chosen diameter of main pipe in inches
s1 = (pi*(.0254*d1).^2)./4 ; %cross-sectional area s1 in m^2
T = 20 ; %in °C
TEMPK = T + 273.15 ; %convert to Kelvin
c = 20.0457.*sqrt(TEMPK) ; %speed of sound in m/s
rho = 101325./(287.058.*TEMPK) ;
f_cutoff = (1.84.*c)./(pi.*d1.*0254) ;

for s2 = .001:.001:.005 %cross-sectional area s2 in m^2
    TL_vec = [] ; 
    for f = 1:.1:2500 
    k = (2.*pi.*f)./c ;
    L = c./(4.*180) ; %chosen target frequency of 180 Hz
    B = [-1 1 1 0; -1 0 0 1; s1 s2 -s2 s1; 0 exp(-i.*k.*L) -exp(i.*k.*L) 0] ;
    C = [A; A; s1.*A; 0] ;
    x = linsolve(B,C) ;
    E = x(4,:) ; %transmitted signal
    TL = 10.*log10(((abs(A).^2).*s1)./((abs(E).^2).*s1)) ;
    TL_vec = [TL_vec TL] ;
    end
f_axis = [1:.1:2500] ;
plot(f_axis, TL_vec) ;
hold on
end

xline(180) ; %chosen target frequency of 180 Hz
xline(1978.519879) ; %f_cutoff @ °C
legend('s2 = .001 m^2','s2 = .002 m^2','s2 = .003 m^2','s2 = .004 m^2','s2 = .005 m^2','f target','f cutoff') ;
title('Quarter-wavelength Side Branch');
xlabel('frequency [Hz]');
ylabel('Transmission Loss [dB]');