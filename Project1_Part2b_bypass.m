clc
clear all

A = 1 ; %incident signal
d1 = 4 ; %chosen diameter of bypass
d2 = 4 ; %chosen diameter of main pipe 
s1 = (pi*((.0254*d1).^2))./4 ; %cross-sectional area s1 in m^2
s2 = (pi*((.0254*d2).^2))./4 ; %cross-sectional area s2 in m^2
T1 = 20 ; %in °C
TEMPK1 = T1 + 273.15 ; %convert to Kelvin
c1 = 20.0457.*sqrt(TEMPK1) ; %speed of sound in m/s
rho1 = 101325./(287.058.*TEMPK1) ; 
f_cutoff = (1.84.*c1)./(pi.*d2.*.0254) ;

for L2 = 10.*.0254 %convert in to m
    L1 = L2 + c1./(2.*180) ; %designing at RT with a chosen target frequency of 180 Hz
    TL_vec = [] ;
    for f = 1:.1:2500
    k = (2.*pi.*f)./c1 ;
    B = [-1 1 1 0 0 0; -1 0 0 1 1 0; 0 exp(-i.*k.*L1) exp(i.*k.*L1) -exp(-i.*k.*L2) -exp(i.*k.*L2) 0; 0 0 0 exp(-i.*k.*L2) exp(i.*k.*L2) -1; s2 s1 -s1 s2 -s2 0; 0 s1.*exp(-i.*k.*L1) -s1.*exp(i.*k.*L1) s2.*exp(-i.*k.*L2) -s2.*exp(i.*k.*L2) -s2] ;
    C = [A; A; 0; 0; s1.*A; 0] ;
    x = linsolve(B,C) ;
    G = x(6,:) ; %transmitted signal
    TL = 10.*log10(((abs(A).^2).*s1)./((abs(G).^2).*s1)) ;
    TL_vec = [TL_vec TL] ;
    end
f_axis = [1:.1:2500] ;
plot(f_axis, TL_vec) ;
end

hold on

for L2 = 100.*.0254 %convert in to m
    L1 = L2 + c1./(2.*180) ; %designing at RT with a chosen target frequency of 180 Hz
    TL_vec = [] ;
    for f = 1:.1:2500
    k = (2.*pi.*f)./c1 ;
    B = [-1 1 1 0 0 0; -1 0 0 1 1 0; 0 exp(-i.*k.*L1) exp(i.*k.*L1) -exp(-i.*k.*L2) -exp(i.*k.*L2) 0; 0 0 0 exp(-i.*k.*L2) exp(i.*k.*L2) -1; s2 s1 -s1 s2 -s2 0; 0 s1.*exp(-i.*k.*L1) -s1.*exp(i.*k.*L1) s2.*exp(-i.*k.*L2) -s2.*exp(i.*k.*L2) -s2] ;
    C = [A; A; 0; 0; s1.*A; 0] ;
    x = linsolve(B,C) ;
    G = x(6,:) ; %transmitted signal
    TL = 10.*log10(((abs(A).^2).*s1)./((abs(G).^2).*s1)) ;
    TL_vec = [TL_vec TL] ;
    end
f_axis = [1:.1:2500] ;
plot(f_axis, TL_vec) ;
end

hold on

for L2 = 1000*.0254 %convert in to m
    L1 = L2 + c1./(2.*180) ; %designing at RT with a chosen target frequency of 180 Hz
    TL_vec = [] ;
    for f = 1:.1:2500
    k = (2.*pi.*f)./c1 ;
    B = [-1 1 1 0 0 0; -1 0 0 1 1 0; 0 exp(-i.*k.*L1) exp(i.*k.*L1) -exp(-i.*k.*L2) -exp(i.*k.*L2) 0; 0 0 0 exp(-i.*k.*L2) exp(i.*k.*L2) -1; s2 s1 -s1 s2 -s2 0; 0 s1.*exp(-i.*k.*L1) -s1.*exp(i.*k.*L1) s2.*exp(-i.*k.*L2) -s2.*exp(i.*k.*L2) -s2] ;
    C = [A; A; 0; 0; s1.*A; 0] ;
    x = linsolve(B,C) ;
    G = x(6,:) ; %transmitted signal
    TL = 10.*log10(((abs(A).^2).*s1)./((abs(G).^2).*s1)) ;
    TL_vec = [TL_vec TL] ;
    end
f_axis = [1:.1:2500] ;
plot(f_axis, TL_vec) ;
end

xline(180) ; %chosen target frequency of 180 Hz
xline(f_cutoff) ;
legend('L2 = 10 in','L2 = 100 in','L2 = 1000 in','f target','f cutoff') ;
title('Bypass');
xlabel('frequency [Hz]');
ylabel('Transmission Loss [dB]');