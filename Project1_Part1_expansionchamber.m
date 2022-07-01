clc
clear all

A = 1 ; %incident signal
d1 = 1 ; %chosen diameter of main pipe in inches
d2 = 4 ; %chosen diameter of expansion chamber in inches
s1 = (pi*(.0254*d1).^2)./4 ; %cross-sectional area s1 in m^2
s2 = (pi*(.0254*d2).^2)./4 ; %cross-sectional area s2 in m^2
T1 = 20 ; %in °C
TEMPK1 = T1 + 273.15 ; %convert to Kelvin
c1 = 20.0457.*sqrt(TEMPK1) ; %speed of sound in m/s
rho1 = 101325./(287.058.*TEMPK1) ;
L = c1./(4.*180) ; %designing for a target frequency of 180 Hz
f_cutoff = (1.84.*c1)./(pi.*d2.*.0254) ;

TL_vec = [] ;
for f = 1:.1:2500
    k1 = (2.*pi.*f)./c1 ;
    B = [-1 1 1 0; 0 exp(-i.*k1.*L) exp(i.*k1.*L) -1; s1 s2 -s2 0; 0 s2.*exp(-i.*k1.*L) -s2.*exp(i.*k1.*L) -s1] ;
    C = [A; 0; s1.*A; 0] ;
    x = linsolve(B,C) ;
    E = x(4,:) ; %transmitted signal
    TL = 10.*log10(((abs(A).^2).*s1)./((abs(E).^2).*s1)) ;
    TL_vec = [TL_vec TL] ;
end
f_axis = [1:.1:2500] ;
plot(f_axis, TL_vec) ;

hold on

for T2 = 100 ; %in °C
TEMPK2 = T2 + 273.15 ; %convert to Kelvin
c2 = 20.0457.*sqrt(TEMPK2) ; %speed of sound in m/s
rho2 = 101325./(287.058.*TEMPK2) ;
    TL_vec = [] ; 
    for f = 1:.1:2500 
    k2 = (2.*pi.*f)./c2 ;
    B = [-1 1 1 0; 0 exp(-i.*k2.*L) exp(i.*k2.*L) -1; s1 s2 -s2 0; 0 s2.*exp(-i.*k2.*L) -s2.*exp(i.*k2.*L) -s1] ;
    C = [A; 0; s1.*A; 0] ;
    x = linsolve(B,C) ;
    E = x(4,:) ; %transmitted signal
    TL = 10.*log10(((abs(A).^2).*s1)./((abs(E).^2).*s1)) ;
    TL_vec = [TL_vec TL] ;
end
f_axis = [1:.1:2500] ;
plot(f_axis, TL_vec)
end

xline(180) ; %chosen target frequency of 180 Hz
xline(f_cutoff) 
legend('T1 = 20 °C','T2 = 100 °C','f target','f cutoff') ;
title('Simple Expansion Chamber');
xlabel('frequency [Hz]');
ylabel('Transmission Loss [dB]');